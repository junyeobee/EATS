<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 찜 목록</title>
    <link rel="stylesheet" href="/css/user/myJjimCss.css">
    <link rel="stylesheet" href="/css/user/userHeader.css">
</head>
<body>
    <!-- 헤더 포함 -->
    <%@include file="/WEB-INF/views/userHeader.jsp" %>

    <div class="container">
        <h1>나의 찜 목록</h1>

        <!-- 찜 목록 표시 -->
        <c:choose>
            <c:when test="${not empty jjimList}">
                <div class="jjim-list">
                    <c:forEach var="jjim" items="${jjimList}">
                        <div class="jjim-item">
                            <a href="${jjim.store_idx}"><h2>매장 이름: ${jjim.store_name}</h2></a>
                            <p>주소: ${jjim.store_addr}</p>
                            <p>전화번호: ${jjim.store_tel}</p>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <p>찜한 매장이 없습니다.</p>
            </c:otherwise>
        </c:choose>

        <!-- 마이페이지로 돌아가기 버튼 -->
        <div class="button-back">
            <a href="/user/mypage/myPage" class="btn back">마이페이지로 돌아가기</a>
        </div>
    </div>
</body>
</html>
