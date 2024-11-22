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
                <h2>방문 목적</h2>
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
                <h2>예약 정보</h2>
                <div class="user-info">
                    <div class="field">
                        <label>이름</label>
                        <input type="text" value="홍길동">
                    </div>
                    <div class="field">
                        <label>연락처</label>
                        <input type="text" value="01012345678">
                    </div>
            
                </div>
            </section>

 

            <section class="section">
                <h2>레스토랑 주의사항</h2>
                <div class="field">
                   
                    <div class="point-input">
                       
                        <button>2일 전 취소: 100% 환불</button>
                    </div>
                </div>
            
            </section>
        </div>



        <div class="summary">
            <h2>최종 결제금액</h2>
            <div class="price-row">
                <span>금액</span>
                <span>18,000원</span>
            </div>
            <div class="price-row">
                <span>할인</span>
                <span>-1,000원</span>
            </div>
      
           
            <div class="price-row total-price">
                <span>총 결제금액</span>
                <span>19,500원</span>
            </div>
            
            
            <div class="payment-methods">
                <label class="payment-method">
                  
                </label>
                
            </div>

            <div class="agreement">
                <label>
                    <input type="checkbox">
                    <span>구매조건 확인 및 결제진행에 동의</span>
                </label>
            </div>

            <button class="submit-button" onclick="goPay();">결제하기</button>
        </div>
    </div>
</body>

<script>

function goPay(){
	
	//const price = ${reserve_count} * 10000;
	
	
	
    const url ='Payment';
    //?user_id_pk="+price; 
    // 견적서번호 넘기기 
    
    //int store_idx, String reserve_date, int reserve_count, String reserve_time, String reserve_table, String request,  
    
    window.open(url, "goPay",  "left=350px, top=100px, width=1000px height=600px");
	
}


function goInsertOrder() {
	
	location.href='/user/makeReserve';
}

</script>
</html>