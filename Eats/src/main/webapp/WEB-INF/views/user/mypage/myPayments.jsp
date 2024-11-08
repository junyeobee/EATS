<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 내역</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f4ec;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 600px;
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }
        .payment-item {
            background-color: #fff5e4;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .payment-detail {
            font-size: 14px;
            color: #333;
            margin: 5px 0;
        }
        .status {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">결제 내역</div>
        
        <c:forEach var="payment" items="${paymentList}">
            <div class="payment-item">
                <div class="payment-detail">매장: ${payment.storeName}</div>
                <div class="payment-detail">이용날짜: ${payment.useDate}</div>
                <div class="payment-detail">결제금액: ${payment.amount}원</div>
                <div class="payment-detail">상태: <span class="status">${payment.status}</span></div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
