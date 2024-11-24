<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 내역</title>
    <link rel="stylesheet" href="/css/user/myPaymentCss.css">
    <link rel="stylesheet" href="/css/user/userHeader.css">
</head>
<body>
    <!-- 헤더 포함 -->
    <%@include file="/WEB-INF/views/userHeader.jsp" %>

    <div class="container">
        <h1>결제 내역</h1>
        <div class="payment-header">
            <span>매장</span>
            <span>이용날짜</span>
            <span>결제금액</span>
            <span>결제방법</span>
            <span>상태</span>
        </div>
        <c:choose>
            <c:when test="${not empty paymentList}">
                <c:forEach var="payment" items="${paymentList}">
                    <div class="payment-row">
                        <span>${payment.store_name}</span>
                        <span>${payment.reserve_date}</span>
                        <span>${payment.pay_price}원</span>
                        <span>${payment.pay_method}</span>
                        <span>${payment.reserve_state}</span>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="no-payment">결제 내역이 없습니다.</p>
            </c:otherwise>
        </c:choose>
        <div class="button-container">
            <a href="javascript:history.back()" class="back-btn">돌아가기</a>
        </div>
    </div>
</body>
</html>
