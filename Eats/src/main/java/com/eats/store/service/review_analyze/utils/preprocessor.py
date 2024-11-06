# FILE: utils/preprocessor.py
import re
from konlpy.tag import Okt
from typing import List, Dict, Union

class Preprocessor:
    def __init__(self):
        self.okt = Okt()
        self.stop_words = set([
            '은', '는', '이', '가', '을', '를', '에', '의',
            '로', '으로', '도', '만', '까지', '부터'
        ])

    def preprocess(self, text: str) -> str:
        """전체 전처리 프로세스"""
        text = self._normalize_text(text)
        text = self._remove_special_chars(text)
        return self._trim_text(text)

    def tokenize(self, text: str) -> List[str]:
        """형태소 분석"""
        tokens = self.okt.morphs(text, stem=True)
        return [token for token in tokens if token not in self.stop_words]

    def _normalize_text(self, text: str) -> str:
        """텍스트 정규화"""
        text = text.strip().lower()
        text = re.sub(r'\s+', ' ', text)
        return text

    def _remove_special_chars(self, text: str) -> str:
        """특수문자 제거"""
        return re.sub(r'[^가-힣a-zA-Z0-9\s.,!?]', '', text)

    def _trim_text(self, text: str, max_length: int = 512) -> str:
        """텍스트 길이 제한"""
        return text[:max_length]

    def pos_tag(self, text: str) -> List[tuple]:
        """품사 태깅"""
        return self.okt.pos(text, norm=True, stem=True)

    def extract_nouns(self, text: str) -> List[str]:
        """명사 추출"""
        return self.okt.nouns(text)

    def extract_adjectives(self, text: str) -> List[str]:
        """형용사 추출"""
        pos_tagged = self.pos_tag(text)
        return [word for word, pos in pos_tagged if pos == 'Adjective']