from abc import ABC, abstractmethod

class BaseAnalyzer(ABC):
    """
    분석기의 기본 인터페이스를 정의하는 추상 클래스
    """
    
    @abstractmethod
    def analyze(self, review_text: str, metadata: dict = None) -> dict:
        """
        리뷰 텍스트 분석을 수행하는 메서드
        
        Args:
            review_text (str): 분석할 리뷰 텍스트
            metadata (dict, optional): 리뷰 관련 추가 정보
            
        Returns:
            dict: 분석 결과
        """
        pass
        
    @abstractmethod
    def train(self, data: list) -> None:
        """
        분석기 학습을 수행하는 메서드
        
        Args:
            data (list): 학습 데이터 리스트
        """
        pass