<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
           
        }

        body {
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.5;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 20px;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 30px;
            grid-column: 1 / -1;
        }

        .section {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .section h2 {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .product {
            display: flex;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }

        .product img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            margin-right: 15px;
        }

        .user-info, .delivery-info {
            display: grid;
            gap: 10px;
        }

        .field {
            margin-bottom: 15px;
        }

        .field label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .summary {
            background: white;
            padding: 20px;
            border-radius: 8px;
            position: sticky;
            top: 20px;
        }

        .price-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            color: #666;
        }

        .total-price {
            border-top: 2px solid #eee;
            margin-top: 15px;
            padding-top: 15px;
            font-weight: bold;
            color: #333;
        }

        .payment-methods {
            display: grid;
            gap: 10px;
            margin: 15px 0;
        }

        .payment-method {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .submit-button {
            width: 100%;
            padding: 15px;
            background-color: #1c7ed6;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }

        .submit-button:hover {
            background-color: #1971c2;
        }

        .point-input {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }

        .point-input input {
            flex: 1;
        }

        .point-input button {
            padding: 8px 15px;
            background-color: #1c7ed6;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .agreement {
            margin-top: 15px;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>결제하기</h1>

        <div class="main-content">
            <section class="section">
                <h2>예약 정보</h2>
                <div class="product">
                    <img src="/api/placeholder/80/80" alt="Daily Facial Soap">
                    <div>
                        <h3></h3>
                        <p></p>
                        <p></p>
                    </div>
                </div>
            </section>

            <section class="section">
                <h2>방문 목적</h2>
                <div class="user-info">
                    <div class="field">
                        <label>이름</label>
                        <input type="text" value="홍길동">
                    </div>
                    <div class="field">
                        <label>연락처</label>
                        <input type="text" value="01012345678">
                    </div>
                    <div class="field">
                        <label>이메일</label>
                        <input type="text" value="user@imweb.me">
                    </div>
                </div>
            </section>

   <!--          <section class="section">
                <h2>배송 정보</h2>
                <div class="delivery-info">
                    <div class="field">
                        <label>받는 분</label>
                        <input type="text" value="홍길동">
                    </div>
                    <div class="field">
                        <label>연락처</label>
                        <input type="text" value="01012345678">
                    </div>
                    <div class="field">
                        <label>주소</label>
                        <input type="text" value="서울특별시 서대문구 성산로7길 89-8 (연희동)">
                    </div>
                    <div class="field">
                        <label>배송 메모</label>
                        <select>
                            <option>배송메모를 선택해 주세요.</option>
                        </select>
                    </div>
                </div>
            </section> -->

            <section class="section">
                <h2>쿠폰/포인트</h2>
                <div class="field">
                    <label>쿠폰</label>
                    <div class="point-input">
                        <input type="text" placeholder="쿠폰 번호 입력">
                        <button>번호확인</button>
                    </div>
                </div>
                <div class="field">
                    <label>포인트</label>
                    <div class="point-input">
                        <input type="text" placeholder="0">
                        <button>전액사용</button>
                    </div>
                    <p>보유 포인트: 2,300</p>
                </div>
            </section>
        </div>

        <div class="summary">
            <h2>최종 결제금액</h2>
            <div class="price-row">
                <span>상품금액</span>
                <span>18,000원</span>
            </div>
            <div class="price-row">
                <span>쿠폰 할인</span>
                <span>-1,000원</span>
            </div>
            <div class="price-row">
                <span>포인트 사용</span>
                <span>-0원</span>
            </div>
            <div class="price-row">
                <span>배송비</span>
                <span>+2,500원</span>
            </div>
            <div class="price-row total-price">
                <span>총 결제금액</span>
                <span>19,500원</span>
            </div>

            <div class="payment-methods">
                <label class="payment-method">
                    <input type="radio" name="payment">
                    <span>신용카드</span>
                </label>
                <label class="payment-method">
                    <input type="radio" name="payment" checked>
                    <span>무통장 입금</span>
                </label>
                <label class="payment-method">
                    <input type="radio" name="payment">
                    <span>카카오페이</span>
                </label>
            </div>

            <div class="agreement">
                <label>
                    <input type="checkbox">
                    <span>구매조건 확인 및 결제진행에 동의</span>
                </label>
            </div>

            <button class="submit-button">결제하기</button>
        </div>
    </div>
</body>
</html>