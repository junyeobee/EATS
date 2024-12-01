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
    <link rel="stylesheet" href="/css/user/userFooter.css">
</head>
<body>
    <!-- 헤더 포함 -->
    <%@include file="/WEB-INF/views/userHeader.jsp" %>

    <div class="container">
        <h1>결제 내역</h1>
        <div class="payment-header">
            <span>매장</span>
            <span>이용 날짜</span>
            <span>결제 금액</span>
            <span>결제 방법</span>
            <span>상태</span>
        </div>
        <c:choose>
            <c:when test="${not empty paymentList}">
                <c:forEach var="payment" items="${paymentList}">
                    <div class="payment-row">
                        <span>${payment.store_name}</span>
                        <span>${payment.reserve_date}</span>
                        <span>${payment.pay_price}원</span>
                        <span>
                            <c:choose>
                                <c:when test="${payment.pay_method == 1}">카드</c:when>
                                <c:when test="${payment.pay_method == 2}">현금</c:when>
                                <c:otherwise>기타</c:otherwise>
                            </c:choose>
                        </span>
                        <span>
                            <c:choose>
                                <c:when test="${payment.reserve_state == 0}">결제 완료</c:when>
                                <c:when test="${payment.reserve_state == 1}">매장 승인 완료</c:when>
                                <c:when test="${payment.reserve_state == 2}">취소</c:when>
                                <c:when test="${payment.reserve_state == 3}">방문 완료</c:when>
                                <c:when test="${payment.reserve_state == 4}">노쇼</c:when>
                                <c:otherwise>알 수 없음</c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="no-payment">결제 내역이 없습니다.</p>
            </c:otherwise>
        </c:choose>

        <!-- 돌아가기 버튼 -->
        <div class="button-container">
            <a href="javascript:history.back()" class="back-btn">돌아가기</a>
        </div>
    </div>
    <%@include file="../../userFooter.jsp" %>
    <script type="text/javascript" src="/js/userHeader.js"></script>
</body>
</html>
