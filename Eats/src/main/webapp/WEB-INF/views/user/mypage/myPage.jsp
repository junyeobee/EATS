<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f8f4ec;
        }
        .container {
            text-align: center;
        }
        .profile {
            margin-bottom: 20px;
        }
        .profile img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
        .profile-name {
            font-size: 1.2em;
            margin-top: 10px;
        }
        .profile-points {
            font-size: 1em;
            color: #999;
        }
        .menu {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 20px;
        }
        .menu-item {
            width: 120px;
            padding: 20px;
            background-color: #fff5e4;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-size: 1em;
            color: #333;
            text-decoration: none;
        }
        .menu-item img {
            width: 40px;
            height: 40px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 프로필 섹션 -->
        <div class="profile">
            <img src="profile-icon.png" alt="프로필 이미지">
            <div class="profile-name">${userProfile.user_name}</div>
            <div class="profile-points">${userProfile.user_point} p</div>
        </div>

        <!-- 메뉴 섹션 -->
        <div class="menu">
            <a href="/myJjim?userId=${userProfile.user_idx}" class="menu-item">
                <img src="icon1.png" alt="나의 콕! 아이콘">
                <div>나의 콕!</div>
            </a>
            <a href="/myReviews?userId=${userProfile.user_idx}" class="menu-item">
                <img src="icon2.png" alt="나의 리뷰 아이콘">
                <div>나의 리뷰</div>
            </a>
            <a href="/myPayments?userId=${userProfile.user_idx}" class="menu-item">
                <img src="icon3.png" alt="결제 관리 아이콘">
                <div>결제 관리</div>
            </a>
            <a href="/myQna?userId=${userProfile.user_idx}" class="menu-item">
                <img src="icon4.png" alt="1:1 문의 아이콘">
                <div>1:1 문의</div>
            </a>
            <a href="/myProfile?userId=${userProfile.user_idx}" class="menu-item">
                <img src="icon5.png" alt="나의 정보 아이콘">
                <div>나의 정보</div>
            </a>
        </div>
    </div>
</body>
</html>
