from gensim.models import Word2Vec
import numpy as np
from sklearn.cluster import DBSCAN
import logging
from .base_analyzer import BaseAnalyzer
from collections import defaultdict
import os
import json
from konlpy.tag import Okt

logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)

class WordEmbeddingAnalyzer(BaseAnalyzer):
    def __init__(self, vector_size=100, window=5, min_count=2, workers=4):
        self.okt = Okt()
        self.model = None
        self.vector_size = vector_size
        self.window = window
        self.min_count = min_count
        self.workers = workers
        
        # 감성 단어 사전 (초기값)
        self.sentiment_words = {
            "긍정": set(["맛있다", "좋다", "최고", "훌륭하다", "친절하다"]),
            "부정": set(["별로", "실망", "최악", "나쁘다", "비싸다", "적다"])
        }
        
        # 유사어 사전
        self.similar_words = defaultdict(set)

    def _preprocess_review(self, review):
        """리뷰 전처리 및 토큰화"""
        # 형태소 분석
        morphs = self.okt.pos(review, norm=True, stem=True)
        
        # 명사, 형용사, 동사만 선택
        tokens = [word for word, pos in morphs 
                 if pos in ['Noun', 'Adjective', 'Verb']]
        
        return tokens

    def train(self, data):
        """Word2Vec 모델 학습 및 유사어 군집화"""
        # 데이터 전처리 수정
        processed_reviews = []
        for item in data:
            if isinstance(item, dict) and 'review_text' in item:
                tokens = self._preprocess_review(item['review_text'])
                if tokens:  # 빈 토큰 리스트 제외
                    processed_reviews.append(tokens)
        
        if not processed_reviews:
            raise ValueError("No valid reviews for training")
        
        # Word2Vec 모델 학습 (min_count 조정)
        self.model = Word2Vec(
            sentences=processed_reviews,
            vector_size=self.vector_size,
            window=self.window,
            min_count=1,  # 최소 출현 빈도 1로 조정
            workers=self.workers
        )
        
        # 나머지 코드는 동일
        sentiment_vectors = {}
        for sentiment, words in self.sentiment_words.items():
            for word in words:
                if word in self.model.wv:
                    sentiment_vectors[word] = {
                        'vector': self.model.wv[word],
                        'sentiment': sentiment
                    }
        
        # 모든 단어에 대해 가장 유사한 감성 단어 찾기
        for word in self.model.wv.index_to_key:
            if word not in sentiment_vectors:
                word_vector = self.model.wv[word]
                max_similarity = -1
                closest_sentiment = None
                
                for sent_word, sent_data in sentiment_vectors.items():
                    similarity = np.dot(word_vector, sent_data['vector']) / (
                        np.linalg.norm(word_vector) * np.linalg.norm(sent_data['vector'])
                    )
                    
                    if similarity > max_similarity:
                        max_similarity = similarity
                        closest_sentiment = sent_data['sentiment']
                
                # 유사도가 충분히 높은 경우에만 감성 할당
                if max_similarity > 0.7:  # 임계값
                    self.similar_words[closest_sentiment].add(word)

    def find_similar_expressions(self, word, topn=5):
        """주어진 단어와 가장 유사한 표현들 찾기"""
        if self.model and word in self.model.wv:
            return self.model.wv.most_similar(word, topn=topn)
        return []

    def analyze(self, review_text, metadata=None):
        """리뷰 분석 수행"""
        if not self.model:
            return {"error": "모델이 학습되지 않았습니다."}
        
        # 토큰화
        tokens = self._preprocess_review(review_text)
        
        # 감성 분석 결과
        sentiments = defaultdict(int)
        evidence = defaultdict(list)
        
        for token in tokens:
            # 기존 감성 사전 확인
            for sentiment, words in self.sentiment_words.items():
                if token in words:
                    sentiments[sentiment] += 1
                    evidence[sentiment].append(token)
            
            # 학습된 유사어 확인
            for sentiment, words in self.similar_words.items():
                if token in words:
                    sentiments[sentiment] += 0.7  # 유사어는 가중치 낮게
                    evidence[sentiment].append(f"{token}(유사)")
        
        # 결과 정리
        total = sum(sentiments.values())
        if total > 0:
            sentiment_scores = {
                sentiment: {
                    "score": count/total,
                    "words": evidence[sentiment]
                }
                for sentiment, count in sentiments.items()
            }
        else:
            sentiment_scores = {"중립": {"score": 1.0, "words": []}}

        return {
            "sentiment_scores": sentiment_scores,
            "dominant_sentiment": max(sentiments.items(), key=lambda x: x[1])[0] if sentiments else "중립"
        }

    def save_model(self, path):
        """모델 저장"""
        if self.model:
            self.model.save(f"{path}/word2vec.model")
            
            # 감성 단어 사전과 유사어 사전 저장
            with open(f"{path}/dictionaries.json", 'w', encoding='utf-8') as f:
                json.dump({
                    "sentiment_words": {k: list(v) for k, v in self.sentiment_words.items()},
                    "similar_words": {k: list(v) for k, v in self.similar_words.items()}
                }, f, ensure_ascii=False, indent=2)

    def load_model(self, path):
        """모델 로드"""
        if os.path.exists(f"{path}/word2vec.model"):
            self.model = Word2Vec.load(f"{path}/word2vec.model")
            
            # 사전들 로드
            if os.path.exists(f"{path}/dictionaries.json"):
                with open(f"{path}/dictionaries.json", 'r', encoding='utf-8') as f:
                    data = json.load(f)
                    self.sentiment_words = {k: set(v) for k, v in data["sentiment_words"].items()}
                    self.similar_words = {k: set(v) for k, v in data["similar_words"].items()}

    def update_sentiment_words(self, new_words):
        """감성 단어 사전 업데이트"""
        for sentiment, words in new_words.items():
            self.sentiment_words[sentiment].update(words)