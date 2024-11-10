
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List, Optional
import pandas as pd
from review_analyzer import ReviewAnalyzer

app = FastAPI()

class ReviewDTO(BaseModel):
    rev_content: str
    rev_score: Optional[float] = None
    rev_menu: str

@app.post("/analyze")
async def analyze_reviews(reviews: List[ReviewDTO]):
    try:
        # ReviewAnalyzer 인스턴스 생성
        analyzer = ReviewAnalyzer()
        
        # DataFrame 생성
        df = pd.DataFrame([{
            'review_text': review.rev_content,
            'rating': review.rev_score,
            'menu': review.rev_menu
        } for review in reviews])
        
        # 리뷰 처리
        results = analyzer.process_reviews(df)
        
        # 리소스 정리
        analyzer.cleanup()
        
        return results
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=9091)