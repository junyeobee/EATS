
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List
import pandas as pd
from review_analyzer import ReviewAnalyzer
import logging

app = FastAPI()

class ReviewDTO(BaseModel):
    rev_content: str
    rev_score: int
    rev_menu: str

@app.post("/analyze", response_model=dict)
async def analyze_reviews(reviews: List[ReviewDTO]):
    try:
        analyzer = ReviewAnalyzer()
        
        # Convert reviews to DataFrame
        df = pd.DataFrame([{
            'review_text': review.rev_content,
            'rating': review.rev_score,
            'menu': review.rev_menu
        } for review in reviews])
        
        # 데이터프레임이 비어있는지 확인
        if df.empty:
            return {
                "data": [{
                    "분위기": {"긍정": [], "부정": []},
                    "서비스": {"긍정": [], "부정": []},
                    "메뉴": []
                }]
            }
        
        # Preprocess and analyze
        df = analyzer.preprocess_reviews(df)
        results = await analyzer.process_reviews_async(df)
        
        # 결과가 비어있는지 확인
        if not results or "data" not in results:
            return {
                "data": [{
                    "분위기": {"긍정": [], "부정": []},
                    "서비스": {"긍정": [], "부정": []},
                    "메뉴": []
                }]
            }
            
        analyzer.cleanup()
        return results
    
    except Exception as e:
        logging.error(f"Error during analysis: {str(e)}")
        # 에러 발생시에도 빈 응답 대신 기본 구조 반환
        return {
            "data": [{
                "분위기": {"긍정": [], "부정": []},
                "서비스": {"긍정": [], "부정": []},
                "메뉴": []
            }]
        }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=9091)