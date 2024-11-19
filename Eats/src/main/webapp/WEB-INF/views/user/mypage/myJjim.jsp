<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 찜 목록</title>
    <link rel="stylesheet" href="/css/user/myJjimCss.css">
</head>
<body>
    <div class="container">
        <h1>나의 찜 목록</h1>

        <!-- 찜 목록 표시 -->
        <c:choose>
            <c:when test="${not empty jjimList}">
                <div class="jjim-list">
                    <c:forEach var="jjim" items="${jjimList}">
                        <div class="jjim-item">
                            <div class="store-info">
                                <h2>매장 이름: ${jjim.store_name}</h2>
                                <ul>
                                    <li>매장 주소: ${jjim.store_addr}</li>
                                    <li>전화번호: ${jjim.store_tel}</li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <p>찜한 매장이 없습니다.</p>
            </c:otherwise>
        </c:choose>

        <!-- 페이지네이션 
        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="?page=1" class="btn">맨 처음</a>
                <a href="?page=${currentPage - 1}" class="btn">이전</a>
            </c:if>
            <span>페이지 ${currentPage} / ${totalPages}</span>
            <c:if test="${currentPage < totalPages}">
                <a href="?page=${currentPage + 1}" class="btn">다음</a>
                <a href="?page=${totalPages}" class="btn">맨 끝</a>
            </c:if>
        </div>-->

        <!-- 마이페이지로 돌아가기 -->
        <div class="button-back">
            <a href="/user/mypage/myPage" class="btn back">마이페이지로 돌아가기</a>
        </div>
    </div>
</body>
</html>
