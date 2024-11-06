import json
import logging
from utils import DataLoader, Preprocessor
from analyzer import MLBasedAnalyzer, RuleBasedAnalyzer, WordEmbeddingAnalyzer
from hybrid_analyzer import HybridAnalyzer

def load_config():
    """설정 파일 로드"""
    with open('config/config.json', 'r', encoding='utf-8') as f:
        return json.load(f)

class CustomJSONEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, set):
            return list(obj)
        return super().default(obj)

def main():
    # 로깅 설정
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(levelname)s - %(message)s'
    )
    logger = logging.getLogger(__name__)

    # 설정 로드
    config = load_config()
    logger.info("설정 파일 로드 완료")

    # 데이터 로더 및 전처리기 초기화
    data_loader = DataLoader()
    preprocessor = Preprocessor()

    # 학습 데이터 로드
    train_data = data_loader.load_from_csv('samples/sample_reviews2.csv')
    logger.info(f"학습 데이터 {len(train_data)}개 로드 완료")

    # 분석기 초기화
    hybrid_analyzer = HybridAnalyzer()
    
    # 분석기 학습
    logger.info("분석기 학습 시작")
    hybrid_analyzer.train(train_data)
    logger.info("분석기 학습 완료")

    # 테스트 리뷰 분석
    test_reviews = [
        "음식이 정말 맛있었고 서비스도 친절했어요!",
        "가격이 비싼데 양이 너무 적어요.",
        "보통이에요. 특별한 점은 없었습니다."
    ]

    # FILE: main.py
    logger.info("테스트 리뷰 분석 시작")
    for review in test_reviews:
        # 전처리
        processed_review = preprocessor.preprocess(review)
        
        # 분석
        result = hybrid_analyzer.analyze(processed_review)
        
        # 결과 출력
        logger.info(f"\n리뷰: {review}")
        logger.info(f"분석 결과: {json.dumps(result, ensure_ascii=False, indent=2, cls=CustomJSONEncoder)}")

if __name__ == "__main__":
    main()