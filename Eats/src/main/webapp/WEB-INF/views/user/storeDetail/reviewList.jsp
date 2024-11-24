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
<style>
section{
	width:90%;
	margin:auto;
}
.top{
	background-color: #f3553c;
    width: 90%;
    padding: 20px;
    margin: 50px 0px;
    border-radius: 10px;
}
.top a{
	color:#fefefe;
	text-decoration: none;
}
.rev-list-main{
	display:flex;
	width: 90%;
    padding: 20px;
    margin: 50px 0px;
    border-radius: 10px;
}
.rev-list-main .left{
	width:20%;
}
.rev-list-main .rev-list-wrap{
	width:60%;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/userHeader.jsp" %>
<section>
	<div class="top">
		<a href="/user/storeInfo?store_idx=${store.STORE_IDX }">${store.STORE_NAME }</a>
	</div>
	<div class="rev-list-main">
		<div class="left">
			<span>평점: ${avgScore }</span>
			<span>리뷰 ${revCnt }개</span>
		</div>
		<div class="rev-list-wrap">
			<c:if test="${empty reviewList }">
			아직 리뷰가 없습니다! 첫 리뷰를 작성해보세요
			</c:if>
			<c:if test="${!empty reviewList }">
			<ul>
				<c:forEach var="review" items="${reviewList }">
				<li>
					<div class="rev-box">
						<p>${review.USER_NICKNAME }</p>
						<p>${review.PROFILE_IMAGE }</p>
						<p>
							<c:forEach var="img" items="${review.imgList }">
							<img src="/img/user/review/${img }">
							</c:forEach>
						</p>
						<p>${review.REV_SCORE }</p>
						<p>${review.REV_CONTENT }</p>
						<p>
							주문 메뉴:
					        <c:forEach items="${review.revMenuList}" var="menu">
					            <span>${menu.MENU_NAME}</span>
					        </c:forEach>
						</p>
						<p>
							<c:forEach var="tag" items="${review.tagList }">
							<span>${tag }</span>
							</c:forEach>
						</p>
					</div>
				</li>	
				</c:forEach>
			</ul>
			</c:if>
		</div>
	</div>
	
	
</section>
<%@include file="/WEB-INF/views/userFooter.jsp" %>
</body>
<script type="text/javascript" src="/js/userHeader.js"></script>
</html>