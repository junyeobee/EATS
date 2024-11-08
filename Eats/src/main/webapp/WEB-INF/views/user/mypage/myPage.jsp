<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
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
            min-height: 100vh;
            margin: 0;
            background-color: #f8f4ec;
        }
        .container {
            text-align: center;
            width: 90%;
            max-width: 1000px; /* 크기 확대 */
            background-color: #ffffff;
            padding: 60px; /* 여백 확대 */
            border-radius: 25px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }
        .profile {
            margin-bottom: 50px; /* 여백 확대 */
        }
        .profile img {
            width: 150px; /* 크기 확대 */
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        .profile-name {
            font-size: 2em; /* 글씨 크기 확대 */
            font-weight: bold;
            margin-top: 20px;
            color: #333;
        }
        .profile-points {
            font-size: 1.5em; /* 글씨 크기 확대 */
            color: #777;
        }
        .menu {
            display: flex;
            flex-wrap: wrap;
            gap: 30px; /* 간격 확대 */
            justify-content: center;
            margin-top: 30px;
        }
        .menu-item {
            width: 180px; /* 크기 확대 */
            padding: 30px; /* 여백 확대 */
            background-color: #fff7e6;
            border-radius: 20px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-size: 1.3em; /* 글씨 크기 확대 */
            color: #333;
            text-decoration: none;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .menu-item:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.2);
        }
        .menu-item img {
            width: 80px; /* 아이콘 크기 확대 */
            height: 80px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 프로필 섹션 -->
        <div class="profile">
            <img src="profile-icon.png" alt="프로필 이미지">
            <div class="profile-name">${userProfile.user_nickname}</div>
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
