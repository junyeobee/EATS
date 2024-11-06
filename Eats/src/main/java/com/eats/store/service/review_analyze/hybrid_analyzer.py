# FILE: hybrid_analyzer.py
from analyzer.ml_based import MLBasedAnalyzer
from analyzer.rule_based import RuleBasedAnalyzer
from analyzer.word_embedding import WordEmbeddingAnalyzer
from collections import defaultdict
import os
import json
import numpy as np

class HybridAnalyzer:
    def __init__(self, model_path=None):
        # 각 분석기 초기화
        self.rule_analyzer = RuleBasedAnalyzer()
        self.ml_analyzer = MLBasedAnalyzer()
        self.word_analyzer = WordEmbeddingAnalyzer()
        
        # 가중치 설정
        self.weights = {
            'ml': 0.5,    # BERT 모델 가중치
            'rule': 0.3,  # 규칙 기반 가중치
            'word': 0.2   # 워드 임베딩 가중치
        }
        
        # 분석 결과 캐시
        self.cache = {}
        
        if model_path:
            self.load_models(model_path)

    def train(self, training_data):
        """각 분석기 학습"""
        print("규칙 기반 분석기 학습 중...")
        self.rule_analyzer.train(training_data)
        
        print("BERT 모델 학습 중...")
        self.ml_analyzer.train(training_data)
        
        print("Word2Vec 모델 학습 중...")
        self.word_analyzer.train(training_data)

    def _combine_scores(self, ml_result, rule_result, word_result):
        """분석 결과 통합"""
        # 각 분석기의 점수를 가중치와 함께 계산
        ml_score = ml_result.get('confidence', 0) * (1 if ml_result.get('sentiment', '') == '긍정' else -1)
        
        rule_aspects = rule_result.get('aspects', defaultdict(list))
        rule_score = 0
        for aspect_type in rule_aspects:
            for item in rule_aspects[aspect_type]:
                if item['sentiment'] == '긍정':
                    rule_score += item['confidence']
                else:
                    rule_score -= item['confidence']
        rule_score = np.tanh(rule_score)  # 정규화
        
        word_scores = word_result.get('sentiment_scores', {})
        word_score = word_scores.get('긍정', {}).get('score', 0) - word_scores.get('부정', {}).get('score', 0)
        
        # 가중치 적용 및 합산
        total_score = (
            ml_score * self.weights['ml'] +
            rule_score * self.weights['rule'] +
            word_score * self.weights['word']
        )
        
        # 임계값 기반 최종 감성 판단
        if total_score > 0.3:
            sentiment = "긍정"
        elif total_score < -0.3:
            sentiment = "부정"
        else:
            sentiment = "중립"
            
        return sentiment, abs(total_score)

    def analyze(self, review_text, metadata=None):
        """통합 분석 수행"""
        # 캐시 확인
        if review_text in self.cache:
            return self.cache[review_text]

        # 각 분석기 결과 얻기
        ml_result = self.ml_analyzer.analyze(review_text, metadata)
        rule_result = self.rule_analyzer.analyze(review_text, metadata)
        word_result = self.word_analyzer.analyze(review_text, metadata)
        
        # 결과 통합
        sentiment, confidence = self._combine_scores(ml_result, rule_result, word_result)
        
        # 상세 분석 결과 구성
        result = {
            'overall_sentiment': sentiment,
            'sentiment_scores': {
                '긍정': max(0, confidence) if sentiment == '긍정' else 0,
                '부정': max(0, confidence) if sentiment == '부정' else 0,
                '중립': 1 - confidence if confidence < 1 else 0
            },
            'confidence': confidence,
            'analysis_weights': self.weights,
            'detailed_analysis': {
                'aspects': rule_result.get('aspects', defaultdict(list)),
                'keywords': word_result.get('keywords', []),
                'new_expressions': set()
            }
        }
        
        # 결과 캐시에 저장
        self.cache[review_text] = result
        return result

    def save_models(self, path):
        """모델 저장"""
        os.makedirs(path, exist_ok=True)
        
        # 각 분석기 모델 저장
        self.ml_analyzer.save_model(os.path.join(path, 'ml_model'))
        self.rule_analyzer.save_rules(os.path.join(path, 'rules.json'))
        self.word_analyzer.save_model(os.path.join(path, 'word2vec.model'))
        
        # 가중치 설정 저장
        with open(os.path.join(path, 'config.json'), 'w', encoding='utf-8') as f:
            json.dump({
                'weights': self.weights
            }, f, ensure_ascii=False, indent=2)

    def load_models(self, path):
        """모델 로드"""
        # 각 분석기 모델 로드
        self.ml_analyzer.load_model(os.path.join(path, 'ml_model'))
        self.rule_analyzer.load_rules(os.path.join(path, 'rules.json'))
        self.word_analyzer.load_model(os.path.join(path, 'word2vec.model'))
        
        # 가중치 설정 로드
        config_path = os.path.join(path, 'config.json')
        if os.path.exists(config_path):
            with open(config_path, 'r', encoding='utf-8') as f:
                config = json.load(f)
                self.weights = config.get('weights', self.weights)

# 사용 예시
def main():
    # 올바른 형식의 테스트 데이터 구성
    test_reviews = [
        {
            'review_text': "음식이 정말 맛있었고 서비스도 친절했어요!",
            'metadata': {'rating': 5, 'label': '긍정'}
        },
        {
            'review_text': "가격이 비싼데 양이 너무 적어요.",
            'metadata': {'rating': 2, 'label': '부정'}
        },
        {
            'review_text': "보통이에요. 특별한 점은 없었습니다.",
            'metadata': {'rating': 3, 'label': '중립'}
        }
    ]

    # 하이브리드 분석기 초기화 및 학습
    analyzer = HybridAnalyzer()
    analyzer.train(test_reviews)

   # 테스트
    for review, _ in test_reviews:
       print("\n리뷰:", review)
       result = analyzer.analyze(review)
       print("\n분석 결과:")
       print(json.dumps(result, ensure_ascii=False, indent=2))

if __name__ == "__main__":
   main()