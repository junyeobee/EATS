
import pandas as pd
import json
import openai
from typing import List, Dict, Optional
import os
from dotenv import load_dotenv
import sys
from functools import lru_cache
from concurrent.futures import ThreadPoolExecutor
import logging
from datetime import datetime
import time
import re
from diskcache import Cache

class ReviewAnalyzer:
    patterns = {
        'emails': r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}',
        'urls': r'http\S+|www\S+',
        'special_chars': r'[^\w\s가-힣]',
        'repeated_chars': r'(.)\1{2,}', #3회이상 반복되는 문자 제거
        'numbers': r'\d+',
        'english': r'[a-zA-Z]+',
        'spaces': r'\s+'
    }

    def __init__(self):
        # 기본 설정
        load_dotenv()
        self.api_key = os.getenv('OPENAI_API_KEY')
        if not self.api_key:
            raise ValueError("API 키가 설정되지 않았습니다.")
        
        # OpenAI 클라이언트 초기화
        self.client = openai.Client(api_key=self.api_key)
        
        # 캐시 설정
        self.cache = Cache("./cache")
        self.cache_timeout = 86400  # 24시간
        
        # 로깅 설정
        logging.basicConfig(
            filename=f'review_analyzer_{datetime.now().strftime("%Y%m%d")}.log',
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s',
            encoding='utf-8'
        )
        
        # 스레드풀 설정
        self.executor = ThreadPoolExecutor(max_workers=4)
        
        # DB에 없는 음식명들 저장
        self.unknown_foods = set()

    def preprocess_reviews(self, df: pd.DataFrame) -> pd.DataFrame:
        """리뷰 데이터 전처리"""
        def clean_text(text):
            if pd.isna(text):
                return ""
            
            # 1. 기본 클리닝
            for pattern_name, pattern in self.patterns.items():
                if pattern_name == 'repeated_chars':
                    text = re.sub(pattern, r'\1', text)
                else:
                    text = re.sub(pattern, ' ', text)
            
            # 2. 한글 자모음 분리 현상 교정
            text = re.sub(r'[ㄱ-ㅎㅏ-ㅣ]+', '', text)
            
            # 3. 불필요한 조사 제거
            endings_to_remove = ['은데', '는데', '네요', '어요', '예요', '에요']
            for ending in endings_to_remove:
                text = text.replace(ending, '')
            
            # 4. 감성 표현 통일
            sentiment_map = {
                '맛있': '맛있음',
                '괜찮': '괜찮음',
                '좋': '좋음',
                '최고': '최고',
                '별로': '별로',
                '실망': '실망',
                '아쉽': '아쉬움'
            }
            
            for old, new in sentiment_map.items():
                if old in text:
                    text = re.sub(f'{old}[다|음|요|네]?', new, text)
            
            # 5. 중복 공백 제거 및 양쪽 공백 제거
            text = ' '.join(text.split())
            
            return text

        try:
            # 전처리 적용
            df['cleaned_review'] = df['review_text'].apply(clean_text)
            
            # 빈 리뷰 제거
            df = df[df['cleaned_review'].str.len() > 0]
            
            return df
        except Exception as e:
            logging.error(f"전처리 중 오류 발생: {str(e)}")
            raise
    async def analyze_batch_async(self, reviews: List[Dict]) -> Dict:
        """리뷰 배치 분석"""
        try:
            prompt = """리뷰들을 분석하여 메뉴/음식평가, 서비스, 분위기로 분류해주세요.
    각 리뷰들의 핵심 키워드를 추출해서 예시와 같은 형식으로 만들어주세요.

    예시 리뷰:
    "우동 맛은 괜찮았는데 양이 너무 적고, 가격도 비싼 편이에요. 직원분들은 친절했지만 주문까지 오래 걸렸어요. 매장은 깔끔했는데 의자가 불편했습니다."

    분석 결과:
    메뉴 평가:
    - 긍정: 맛이 괜찮음
    - 부정: 양이 적음, 가격이 비쌈

    서비스 평가:
    - 긍정: 친절함
    - 부정: 주문이 느림

    분위기 평가:
    - 긍정: 매장이 깔끔함
    - 부정: 의자가 불편함

    분석할 리뷰들:
    """
            for i, r in enumerate(reviews, 1):
                prompt += f"\n[리뷰 {i}]\n{r['review']}\n---"

            prompt += """
    각 리뷰를 위 예시와 같은 형식으로 분석해주세요.

    중요:
    1. 평가는 명확한 키워드로만 작성:
    - "우동 맛은 괜찮았는데 양이 너무 적고" -> 메뉴평가: -긍정:"맛이 좋음" - 부정:"양이 적음"
    - "서비스가 나쁨" -> 서비스 - "불친절함"
    
    2. 분류 기준:
    - 메뉴/음식 관련 평가는 모두 메뉴 평가에 포함
    - 직원/주문/응대는 서비스로 분류
    - 매장 환경/시설은 분위기로 분류

    3. 키워드 작성:
    - 조사 제거 ('에', '이', '가' 등)
    - 간단명료하게
    - 구체적으로
    
    4. 없는 항목은 "없음"으로 표시"""

            # 실제 프롬프트 로깅
            logging.info("=== 보내는 프롬프트 ===")
            logging.info(prompt)
            logging.info("=== 프롬프트 끝 ===")

            response = self.client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=[
                    {"role": "system", "content": """리뷰 분석 전문가입니다. 
                    리뷰에서 핵심 키워드만 추출하여 메뉴, 서비스, 분위기로 정확히 분류합니다. 
                    키워드는 간단명료하고 구체적으로 추출합니다."""},
                    {"role": "user", "content": prompt}
                ],
                temperature=0.3,
                max_tokens=2000
            )
            
            # GPT 응답 로깅
            logging.info("=== GPT 응답 ===")
            logging.info(response.choices[0].message.content)
            logging.info("=== 응답 끝 ===")
            
            result = response.choices[0].message.content
            # _map_to_menu 호출 제거
            review_results = self._parse_batch_response(result, reviews)
            return {"data": review_results}
        except Exception as e:
            logging.error(f"분석 중 오류 발생: {str(e)}")
            return {"data": []}
    def _parse_batch_response(self, response_text: str, original_reviews: List[Dict]) -> List[Dict]:
        """리뷰 분석 결과 파싱"""
        current_result = {
            "분위기": {"긍정": [], "부정": []},
            "서비스": {"긍정": [], "부정": []},
            "메뉴": []
        }
        
        try:
            menu_evaluations = {}
            reviews = response_text.split('[리뷰')
            current_review_index = 0
            
            for review in reviews[1:]:  # 첫 번째 빈 문자열 제외
                if current_review_index >= len(original_reviews):
                    break
                    
                current_menu = original_reviews[current_review_index]['menu']
                sections = review.split('\n')
                current_section = None
                
                for line in sections:
                    line = line.strip()
                    if not line or line == '---':
                        continue
                        
                    # 섹션 식별
                    if '메뉴' in line:
                        current_section = 'menu'
                    elif '서비스' in line:
                        current_section = 'service'
                    elif '분위기' in line:
                        current_section = 'atmosphere'
                    elif line.startswith('- '):
                        if ':' not in line:
                            continue
                            
                        sentiment = '긍정' if '긍정' in line else '부정'
                        content = line.split(':', 1)[1].strip()
                        
                        if content.lower() == '없음':
                            continue
                        
                        evaluations = [e.strip() for e in content.split(',') if e.strip()]
                        
                        if current_section == 'menu':
                            if current_menu not in menu_evaluations:
                                menu_evaluations[current_menu] = {"긍정": [], "부정": []}
                            menu_evaluations[current_menu][sentiment].extend(evaluations)
                        elif current_section == 'service':
                            current_result['서비스'][sentiment].extend(evaluations)
                        elif current_section == 'atmosphere':
                            current_result['분위기'][sentiment].extend(evaluations)
                        
                current_review_index += 1

            # 메뉴 평가 결과 추가
            for menu_name, evals in menu_evaluations.items():
                current_result["메뉴"].append({
                    menu_name: {
                        "긍정": list(evals["긍정"]),
                        "부정": list(evals["부정"])
                    }
                })

            # 중복 제거
            for key in ["분위기", "서비스"]:
                for sentiment in ["긍정", "부정"]:
                    current_result[key][sentiment] = list(current_result[key][sentiment])

            return [current_result]  # 단일 결과를 리스트로 반환

        except Exception as e:
            logging.error(f"응답 파싱 중 오류 발생: {str(e)}\n응답 텍스트: {response_text}")
            return []

    def merge_review_results(self, results: List[Dict]) -> Dict:
        """리뷰 결과 병합"""
        if not results:
            return {"data": []}
            
        merged = {
            "분위기": {"긍정": [], "부정": []},
            "서비스": {"긍정": [], "부정": []},
            "메뉴": []
        }
        
        menu_evaluations = {}
        
        for result in results:
            # 분위기/서비스 병합
            for key in ["분위기", "서비스"]:
                for sentiment in ["긍정", "부정"]:
                    if result[key][sentiment]:
                        merged[key][sentiment].extend(result[key][sentiment])
            
            # 메뉴 평가 병합
            for menu_item in result["메뉴"]:
                for menu_name, evaluations in menu_item.items():
                    if menu_name not in menu_evaluations:
                        menu_evaluations[menu_name] = {"긍정": [], "부정": []}
                    for sentiment in ["긍정", "부정"]:
                        menu_evaluations[menu_name][sentiment].extend(evaluations[sentiment])
        
        # 중복 제거
        for key in ["분위기", "서비스"]:
            for sentiment in ["긍정", "부정"]:
                merged[key][sentiment] = list(merged[key][sentiment])
        
        # 메뉴 평가 추가
        for menu_name, evals in menu_evaluations.items():
            merged["메뉴"].append({
                menu_name: {
                    "긍정": list(evals["긍정"]),
                    "부정": list(evals["부정"])
                }
            })
        
        return {"data": [merged]}

    async def process_reviews_async(self, df: pd.DataFrame, batch_size: int = 5) -> Dict:
        """비동기 리뷰 처리"""
        try:
            reviews = []
            for _, row in df.iterrows():
                reviews.append({
                    'menu': row['menu'],
                    'review': row['cleaned_review']
                })

            all_results = []
            total_batches = (len(reviews) + batch_size - 1) // batch_size
            
            for i in range(0, len(reviews), batch_size):
                batch = reviews[i:i+batch_size]
                try:
                    result = await self.analyze_batch_async(batch)
                    if result and "data" in result and result["data"]:
                        all_results.extend(result["data"])
                    logging.info(f"처리 완료: {i//batch_size + 1}/{total_batches} 배치")
                except Exception as e:
                    logging.error(f"배치 처리 중 오류 발생: {str(e)}")
                    continue

            if not all_results:
                return {"data": []}

            # 결과 병합
            return self.merge_review_results(all_results)

        except Exception as e:
            logging.error(f"리뷰 처리 중 오류 발생: {str(e)}")
            return {"data": []}

    async def process_reviews(self, df: pd.DataFrame, batch_size: int = 5) -> Dict:
        """동기식 인터페이스"""
        try:
            return await self.process_reviews_async(df, batch_size)
        except Exception as e:
            logging.error(f"처리 중 오류 발생: {str(e)}")
            return {"data": []}

    def cleanup(self):
        """리소스 정리"""
        try:
            self.cache.close()
            self.executor.shutdown(wait=True)
        except Exception as e:
            logging.error(f"리소스 정리 중 오류: {str(e)}")

    def get_unknown_foods(self) -> List[str]:
        """발견된 DB에 없는 음식명들 반환"""
        return list(self.unknown_foods)