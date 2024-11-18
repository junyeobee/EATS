<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 리뷰</title>
    <link rel="stylesheet" href="/css/user/myReviewCss.css">
</head>
<body>
<div class="container">
    <h1>나의 리뷰</h1>

    <!-- 데이터가 없을 경우 안내 메시지 -->
    <c:if test="${empty reviewList}">
        <p style="text-align: center; color: #888;">작성된 리뷰가 없습니다.</p>
    </c:if>

    <!-- 리뷰 목록 -->
    <div class="review-list">
        <c:forEach var="review" items="${reviewList}">
            <div class="review-item">
                <h2>${review.store_name}</h2>
                <p><strong>방문 날짜:</strong> ${review.reserve_date}</p>
                <p><strong>별점:</strong> ${review.rev_score} ★</p>
                <p><strong>리뷰 내용:</strong> ${review.rev_content}</p>
                <c:if test="${not empty review.rev_img}">
                    <div class="review-images">
                        <img src="${review.rev_img}" alt="리뷰 이미지" class="review-img">
                    </div>
                </c:if>
                <c:if test="${not empty review.rev_menu}">
                    <p><strong>주문 메뉴:</strong> ${review.rev_menu}</p>
                </c:if>
                <c:if test="${not empty review.rev_tag}">
                    <p><strong>태그:</strong> ${review.rev_tag}</p>
                </c:if>
            </div>
        </c:forEach>
    </div>

    <!-- 페이징 -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="?page=${currentPage - 1}">이전</a>
        </c:if>
        <span>페이지 ${currentPage} / ${totalPages}</span>
        <c:if test="${currentPage < totalPages}">
            <a href="?page=${currentPage + 1}">다음</a>
        </c:if>
    </div>
    <div class="button-container">
    <a href="javascript:history.back()" class="back-btn">돌아가기</a>
</div>
</div>
</body>
</html>
