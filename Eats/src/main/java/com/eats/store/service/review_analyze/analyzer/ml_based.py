from transformers import BertTokenizer, BertForSequenceClassification
import torch
from torch.utils.data import Dataset, DataLoader
import numpy as np
from sklearn.model_selection import train_test_split
import os
from .base_analyzer import BaseAnalyzer

class ReviewDataset(Dataset):
    def __init__(self, reviews, labels, tokenizer, label_map):
        self.reviews = reviews
        self.labels = labels
        self.tokenizer = tokenizer
        self.label_map = label_map

    def __len__(self):  # 추가
        return len(self.reviews)

    def __getitem__(self, idx):
        review = self.reviews[idx]
        label = self.label_map[self.labels[idx]]
        
        encoding = self.tokenizer.encode_plus(
            review,
            add_special_tokens=True,
            max_length=512,
            return_token_type_ids=False,
            padding='max_length',
            truncation=True,
            return_attention_mask=True,
            return_tensors='pt'
        )

        return {
            'input_ids': encoding['input_ids'].flatten(),
            'attention_mask': encoding['attention_mask'].flatten(),
            'label': torch.tensor(label, dtype=torch.long)
        }

class MLBasedAnalyzer(BaseAnalyzer):
    def __init__(self):
        self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
        self.tokenizer = BertTokenizer.from_pretrained('bert-base-multilingual-cased')
        self.model = BertForSequenceClassification.from_pretrained(
            'bert-base-multilingual-cased',
            num_labels=3
        )
        self.model.to(self.device)
        # 레이블 매핑 추가
        self.label_map = {
            "긍정": 2,
            "중립": 1,
            "부정": 0
        }
        
        self.model.to(self.device)

    # FILE: analyzer/ml_based.py
class MLBasedAnalyzer(BaseAnalyzer):
    def __init__(self):
        self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
        self.tokenizer = BertTokenizer.from_pretrained('bert-base-multilingual-cased')
        self.model = BertForSequenceClassification.from_pretrained(
            'bert-base-multilingual-cased',
            num_labels=3
        )
        # 레이블 매핑 추가
        self.label_map = {
            "긍정": 2,
            "중립": 1,
            "부정": 0
        }
        self.model.to(self.device)

    def train(self, data, epochs=3, batch_size=16):
        """모델 학습"""
        training_pairs = []
        for item in data:
            if isinstance(item, dict):
                if 'review_text' in item and 'metadata' in item:
                    if 'label' in item['metadata']:
                        training_pairs.append((item['review_text'], item['metadata']['label']))
        
        if not training_pairs:
            raise ValueError("No valid training data found")
        
        reviews, labels = zip(*training_pairs)
        
        # 데이터 분할
        train_reviews, val_reviews, train_labels, val_labels = train_test_split(
            reviews, labels, test_size=0.2, random_state=42
        )

        # label_map 전달
        train_dataset = ReviewDataset(train_reviews, train_labels, self.tokenizer, self.label_map)
        val_dataset = ReviewDataset(val_reviews, val_labels, self.tokenizer, self.label_map)
        """모델 학습"""
        training_pairs = []
        for item in data:
            if isinstance(item, dict):
                if 'review_text' in item and 'metadata' in item:
                    if 'label' in item['metadata']:
                        training_pairs.append((item['review_text'], item['metadata']['label']))
        
        if not training_pairs:
            raise ValueError("No valid training data found")
        
        reviews, labels = zip(*training_pairs)
        
        # 데이터 분할
        train_reviews, val_reviews, train_labels, val_labels = train_test_split(
            reviews, labels, test_size=0.2, random_state=42
        )

        # label_map 전달하여 데이터셋 생성
        train_dataset = ReviewDataset(train_reviews, train_labels, self.tokenizer, self.label_map)
        val_dataset = ReviewDataset(val_reviews, val_labels, self.tokenizer, self.label_map)

        train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
        val_loader = DataLoader(val_dataset, batch_size=batch_size)

        # 옵티마이저 설정
        optimizer = torch.optim.AdamW(self.model.parameters(), lr=2e-5)

        best_accuracy = 0
        for epoch in range(epochs):
            # 학습
            self.model.train()
            total_loss = 0
            for batch in train_loader:
                optimizer.zero_grad()
                
                input_ids = batch['input_ids'].to(self.device)
                attention_mask = batch['attention_mask'].to(self.device)
                labels = batch['label'].to(self.device)

                outputs = self.model(
                    input_ids=input_ids,
                    attention_mask=attention_mask,
                    labels=labels
                )

                loss = outputs.loss
                total_loss += loss.item()

                loss.backward()
                optimizer.step()

            # 검증
            self.model.eval()
            correct = 0
            total = 0
            
            with torch.no_grad():
                for batch in val_loader:
                    input_ids = batch['input_ids'].to(self.device)
                    attention_mask = batch['attention_mask'].to(self.device)
                    labels = batch['label'].to(self.device)

                    outputs = self.model(
                        input_ids=input_ids,
                        attention_mask=attention_mask
                    )

                    predictions = torch.argmax(outputs.logits, dim=1)
                    correct += (predictions == labels).sum().item()
                    total += labels.size(0)

            accuracy = correct / total
            print(f'Epoch {epoch+1}: Loss = {total_loss/len(train_loader):.4f}, '
                  f'Accuracy = {accuracy:.4f}')

            # 모델 저장
            if accuracy > best_accuracy:
                best_accuracy = accuracy
                self.save_model("best_model")

    def analyze(self, review_text, metadata=None):
        """리뷰 분석 수행"""
        self.model.eval()
        
        encoding = self.tokenizer(
            review_text,
            add_special_tokens=True,
            max_length=128,
            return_token_type_ids=False,
            padding='max_length',
            truncation=True,
            return_attention_mask=True,
            return_tensors='pt'
        )

        input_ids = encoding['input_ids'].to(self.device)
        attention_mask = encoding['attention_mask'].to(self.device)

        with torch.no_grad():
            outputs = self.model(
                input_ids=input_ids,
                attention_mask=attention_mask
            )
            
            probabilities = torch.softmax(outputs.logits, dim=1)
            prediction = torch.argmax(probabilities, dim=1).item()
            confidence = probabilities[0][prediction].item()

        sentiment_map = {0: "부정", 1: "중립", 2: "긍정"}
        
        return {
            "sentiment": sentiment_map[prediction],
            "confidence": confidence,
            "probabilities": {
                "부정": probabilities[0][0].item(),
                "중립": probabilities[0][1].item(),
                "긍정": probabilities[0][2].item()
            }
        }

    def save_model(self, path):
        """모델 저장"""
        self.model.save_pretrained(path)
        self.tokenizer.save_pretrained(path)

    def load_model(self, path):
        """모델 로드"""
        self.model = BertForSequenceClassification.from_pretrained(path)
        self.tokenizer = BertTokenizer.from_pretrained(path)
        self.model.to(self.device)