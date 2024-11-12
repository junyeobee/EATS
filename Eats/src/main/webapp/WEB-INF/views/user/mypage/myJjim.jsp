<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 찜 목록</title>
    <link rel="stylesheet" href="/css/user/myPage.css">
</head>
<body>
    <div class="container">
        <h1>나의 찜 목록</h1>

        <div class="jjim-list">
            <c:forEach var="jjim" items="${jjimList}">
                <div class="jjim-item">
                    <div class="store-info">
                        <h2>${jjim.store_name}</h2>
                        <p>${jjim.store_addr}</p>
                        <p>전화번호: ${jjim.store_tel}</p>
                    </div>
                    <div class="button-group">
                        <a href="/store/view?storeId=${jjim.store_idx}" class="btn detail">매장 보기</a>
                        <form action="/user/mypage/deleteJjim" method="post" class="delete-form">
                            <input type="hidden" name="userId" value="${sessionScope.user_idx}">
                            <input type="hidden" name="storeId" value="${jjim.store_idx}">
                            <button type="submit" class="btn delete">삭제</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="?userId=${sessionScope.user_idx}&page=1" class="btn">맨 처음</a>
                <a href="?userId=${sessionScope.user_idx}&page=${currentPage - 1}" class="btn">이전</a>
            </c:if>
            <span>페이지 ${currentPage} / ${totalPages}</span>
            <c:if test="${currentPage < totalPages}">
                <a href="?userId=${sessionScope.user_idx}&page=${currentPage + 1}" class="btn">다음</a>
                <a href="?userId=${sessionScope.user_idx}&page=${totalPages}" class="btn">맨 끝</a>
            </c:if>
        </div>

        <div class="button-back">
            <a href="/user/mypage/myPage?userId=${sessionScope.user_idx}" class="btn back">마이페이지로 돌아가기</a>
        </div>
    </div>
</body>
</html>
