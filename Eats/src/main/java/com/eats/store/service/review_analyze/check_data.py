from utils import DataLoader

def check_data():
    loader = DataLoader()
    data = loader.load_from_csv('samples/sample_reviews.csv')
    
    print(f"총 데이터 수: {len(data)}")
    print("\n첫 번째 데이터 샘플:")
    print(data[0] if data else "데이터 없음")
    
    # label 확인
    valid_data = [(review, meta) for review, meta in data if 'label' in meta]
    print(f"\n유효한 레이블 데이터 수: {len(valid_data)}")
    
    # 문제있는 데이터 확인
    invalid_data = [(review, meta) for review, meta in data if 'label' not in meta]
    print(f"\n레이블 없는 데이터 수: {len(invalid_data)}")
    if invalid_data:
        print("\n레이블 없는 첫 번째 데이터:")
        print(invalid_data[0])

if __name__ == "__main__":
    check_data()