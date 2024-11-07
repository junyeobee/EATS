# FILE: utils/data_loader.py
import pandas as pd
import json
from typing import List, Dict, Union, Generator
import logging

class DataLoader:
    def __init__(self, config_path: str = None):
        self.config = self._load_config(config_path) if config_path else {}
        self.logger = logging.getLogger(__name__)

    def _load_config(self, path: str) -> dict:
        with open(path, 'r', encoding='utf-8') as f:
            return json.load(f)

    def load_from_csv(self, file_path: str, **kwargs) -> List[Dict]:
        """CSV 파일에서 리뷰 데이터 로드"""
        df = pd.read_csv(file_path, **kwargs)
        return self._process_dataframe(df)

    def load_from_json(self, file_path: str) -> List[Dict]:
        """JSON 파일에서 리뷰 데이터 로드"""
        with open(file_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        return self._validate_data(data)

# FILE: utils/data_loader.py
    def _process_dataframe(self, df: pd.DataFrame) -> List[Dict]:
        """DataFrame을 표준 형식으로 변환"""
        required_columns = {'review_text', 'rating'}
        if not required_columns.issubset(df.columns):
            raise ValueError(f"Required columns missing: {required_columns - set(df.columns)}")
        
        processed_data = []
        for _, row in df.iterrows():
            if pd.isna(row['review_text']) or pd.isna(row['rating']):
                continue
                
            metadata = {
                'rating': float(row['rating']),
                'label': self._convert_rating_to_label(float(row['rating']))
            }
            
            # 추가 메타데이터 필드 추가
            for k, v in row.items():
                if k not in ['review_text', 'rating'] and not pd.isna(v):
                    metadata[k] = v
                    
            processed_data.append({
                'review_text': str(row['review_text']),
                'metadata': metadata
            })
        
        return processed_data

    def _validate_data(self, data: List[Dict]) -> List[Dict]:
        """데이터 유효성 검사"""
        valid_data = []
        for item in data:
            if 'review_text' not in item:
                self.logger.warning(f"Skipping invalid review: {item}")
                continue
            if 'metadata' not in item:
                item['metadata'] = {}
            valid_data.append(item)
        return valid_data

    @staticmethod
    def _convert_rating_to_label(rating: float) -> str:
        """평점을 레이블로 변환"""
        if rating >= 4:
            return "긍정"
        elif rating <= 2:
            return "부정"
        return "중립"