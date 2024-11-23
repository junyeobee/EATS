<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/user/userHeader.css">
<link rel="stylesheet" href="/css/user/userFooter.css">
</head>
<body>
<%@include file="/WEB-INF/views/userHeader.jsp" %>
<section>
	<div class="top">
		<a href="/user/storeInfo?store_idx=${store.STORE_IDX }">${store.STORE_NAME }</a>
	</div>
	<c:if test="${empty reviewList }">
	아직 리뷰가 없습니다! 첫 리뷰를 작성해보세요
	</c:if>
	<c:if test="${!empty reviewList }">
	<div class="rev-list-wrapper">
		<ul>
			<c:forEach var="review" items="${reviewList }">
			<li>
				<div class="rev-box">
					<p>${review.USER_NICKNAME }</p>
					<p>${review.PROFILE_IMAGE }</p>
					<p>${review.REV_IMG }</p>
					<p>${review.REV_SCORE }</p>
					<p>${review.REV_CONTENT }</p>
					<p>
						주문 메뉴:
				        <c:forEach items="${review.revMenuList}" var="menu">
				            <span>${menu.MENU_NAME}</span>
				        </c:forEach>
					</p>
					<p>${review.rev_tag }</p>
				</div>
			</li>	
			</c:forEach>
		</ul>
	</div>
	</c:if>
	
</section>
<%@include file="/WEB-INF/views/userFooter.jsp" %>
</body>
<script type="text/javascript" src="/js/userHeader.js"></script>
</html>