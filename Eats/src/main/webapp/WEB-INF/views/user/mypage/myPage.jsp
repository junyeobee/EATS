<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>
<link rel="stylesheet" href="/css/user/myPage.css">
</head>
<body>
	<div class="container">
		<!-- 프로필 섹션 -->
		<div class="profile">
			<img src="/img/profile-icon.png" alt="프로필 이미지">
			<div class="profile-name">${userProfile.userNickname}</div>
			<div class="profile-points">${userProfile.userPoint}p</div>
		</div>

		<!-- 메뉴 섹션 -->
		<div class="menu">
			<a href="/user/mypage/myJjim" class="menu-item"> <img
				src="/myPageImg/jjim-icon.png" alt="찜 아이콘">
				<div>나의 콕!</div>
			</a> <a href="/user/mypage/myReviews" class="menu-item"> <img
				src="/myPageImg/review-icon.png" alt="리뷰 아이콘">
				<div>나의 리뷰</div>
			</a> <a href="/user/mypage/myPayments" class="menu-item"> <img
				src="/myPageImg/payment-icon.png" alt="결제 관리 아이콘">
				<div>결제 관리</div>
			</a> <a href="/user/mypage/myQna" class="menu-item"> <img
				src="/myPageImg/qna-icon.png" alt="1:1 문의 아이콘">
				<div>1:1 문의</div>
			</a> <a href="/user/mypage/myProfile" class="menu-item"> <img
				src="/myPageImg/profile-icon.png" alt="나의 정보 아이콘">
				<div>나의 정보</div>
			</a>
		</div>

	</div>
</body>
</html>
