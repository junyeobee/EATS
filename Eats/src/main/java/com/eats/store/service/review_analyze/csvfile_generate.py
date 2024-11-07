# FILE: convert_reviews.py
import pandas as pd
import os

def convert_csv_format():
    # 입력 CSV 파일 읽기
    input_path = 'samples/dd2.csv'
    output_path = 'samples/sample_reviews2.csv'
    
    # CSV 읽기
    df = pd.read_csv(input_path)
    
    # 컬럼 이름 매핑
    renamed_df = pd.DataFrame({
        'review_text': df['리뷰'],
        'rating': df['별점(1~5)'],
        'date': df['날짜'],
        'user': df['닉네임'],
        'delivery': df['배달평가(상,중,하)'],
        'menu': df.apply(lambda row: [item for item in [row['주문메뉴1'], row['주문메뉴2'], 
                                                      row['주문메뉴3'], row['주문메뉴4']] 
                                    if pd.notna(item)], axis=1)
    })
    
    # NaN 값 처리
    renamed_df = renamed_df.fillna('')
    
    # 메뉴 리스트를 문자열로 변환
    renamed_df['menu'] = renamed_df['menu'].apply(lambda x: ', '.join(x) if x else '')
    
    # 필요한 컬럼만 선택하여 저장
    final_df = renamed_df[['review_text', 'rating', 'date', 'user', 'delivery', 'menu']]
    
    # 출력 디렉토리 확인 및 생성
    os.makedirs('samples', exist_ok=True)
    
    # CSV 파일로 저장
    final_df.to_csv(output_path, index=False, encoding='utf-8')
    print(f"변환 완료: {output_path}")

if __name__ == "__main__":
    convert_csv_format()