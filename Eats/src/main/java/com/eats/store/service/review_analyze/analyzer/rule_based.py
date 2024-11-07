import re
from konlpy.tag import Okt
from collections import defaultdict
from abc import ABC, abstractmethod
import json
import os

# 기본 분석기 인터페이스
class BaseAnalyzer(ABC):
    @abstractmethod
    def analyze(self, review_text, metadata=None):
        pass
    
    @abstractmethod
    def train(self, data):
        pass

# 규칙 기반 분석기
class RuleBasedAnalyzer(BaseAnalyzer):
    def __init__(self, rules_path="rules.json"):
        self.okt = Okt()
        self.rules = self._load_rules(rules_path)
        self.learned_patterns = defaultdict(set)  # 새로 학습된 패턴 저장

    def _load_rules(self, rules_path):
        """규칙 파일 로드 또는 기본 규칙 사용"""
        if os.path.exists(rules_path):
            with open(rules_path, 'r', encoding='utf-8') as f:
                return json.load(f)
        else:
            return {
                "patterns": {
                    "메뉴평가": {
                        "긍정": ["맛있", "최고", "좋", "훌륭"],
                        "부정": ["별로", "맛없", "실망", "아쉽"],
                        "weight": 2.0
                    },
                    "서비스평가": {
                        "긍정": ["친절", "빠르", "좋", "깔끔"],
                        "부정": ["불친절", "느리", "나쁨", "더러움"],
                        "weight": 1.0
                    },
                    "가격평가": {
                        "긍정": ["저렴", "합리적", "가성비"],
                        "부정": ["비싸", "부담", "가격이높"],
                        "weight": 1.5
                },
                    "양평가": {
                        "긍정": ["푸짐", "많", "넉넉"],
                        "부정": ["적어", "부족", "양이적"],
                        "weight": 1.2
                }
                },
                "stop_words": ["은", "는", "이", "가", "을", "를", "에", "도"]
            }

    def _preprocess(self, text):
        """텍스트 전처리"""
        # 기본 전처리
        text = re.sub(r'\s+', ' ', text.strip())
        
        # 특수문자 처리
        text = re.sub(r'[^가-힣a-zA-Z0-9\s.,!?]', '', text)
        
        return text

    def _tokenize(self, text):
        """형태소 분석"""
        morphs = self.okt.pos(text, norm=True, stem=True)
        return [(word, pos) for word, pos in morphs 
                if word not in self.rules["stop_words"]]

    def _find_patterns(self, tokens):
        """패턴 매칭"""
        matches = []
        for i, (word, pos) in enumerate(tokens):
            for pattern_type, rules in self.rules["patterns"].items():
                # 기존 규칙 확인
                for sentiment, patterns in rules.items():
                    if sentiment != "weight":  # weight는 패턴이 아님
                        if any(pattern in word for pattern in patterns):
                            matches.append({
                                "type": pattern_type,
                                "sentiment": sentiment,
                                "word": word,
                                "weight": rules["weight"]
                            })
                
                # 학습된 패턴 확인
                if word in self.learned_patterns[pattern_type]:
                    matches.append({
                        "type": pattern_type,
                        "sentiment": "learned",
                        "word": word,
                        "weight": 1.0
                    })
        
        return matches

    def analyze(self, review_text, metadata=None):
        """리뷰 분석 수행"""
        # 전처리
        text = self._preprocess(review_text)
        
        # 토큰화
        tokens = self._tokenize(text)
        
        # 패턴 매칭
        matches = self._find_patterns(tokens)
        
        # 결과 정리
        result = defaultdict(lambda: {"긍정": [], "부정": [], "learned": []})
        for match in matches:
            result[match["type"]][match["sentiment"]].append({
                "word": match["word"],
                "weight": match["weight"]
            })
        
        return dict(result)

    def train(self, data):
        """새로운 패턴 학습"""
        # data: [(review_text, metadata), ...]
        for review_text, metadata in data:
            if metadata and "score" in metadata:
                score = metadata["score"]
                text = self._preprocess(review_text)
                tokens = self._tokenize(text)
                
                # 높은 평점의 리뷰에서 새로운 긍정 표현 학습
                if score >= 4:
                    for word, pos in tokens:
                        if pos in ['Adjective', 'Verb']:
                            self.learned_patterns["메뉴평가"].add(word)
                
                # 낮은 평점의 리뷰에서 새로운 부정 표현 학습
                elif score <= 2:
                    for word, pos in tokens:
                        if pos in ['Adjective', 'Verb']:
                            self.learned_patterns["메뉴평가"].add(word)

    def save_rules(self, path="rules.json"):
        """학습된 규칙 저장"""
        rules = self.rules.copy()
        rules["learned_patterns"] = {k: list(v) for k, v in self.learned_patterns.items()}
        
        with open(path, 'w', encoding='utf-8') as f:
            json.dump(rules, f, ensure_ascii=False, indent=2)