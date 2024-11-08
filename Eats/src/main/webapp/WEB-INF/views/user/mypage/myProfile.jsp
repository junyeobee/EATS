<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 정보</title>
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
        .profile-container {
            width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-header img {
            width: 70px;
            height: 70px;
            border-radius: 50%;
        }
        .profile-item {
            margin-bottom: 15px;
        }
        .profile-item label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        .profile-item span {
            color: #555;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="profile-header">
            <img src="profile-icon.png" alt="프로필 이미지">
            <h2>${userProfile.user_name}</h2>
            <p>${userProfile.user_email}</p>
            <p>포인트: ${userProfile.user_point} p</p>
        </div>
        <div class="profile-item">
            <label>아이디:</label>
            <span>${userProfile.user_id}</span>
        </div>
        <div class="profile-item">
            <label>생년월일:</label>
            <span>${userProfile.user_birth}</span>
        </div>
        <div class="profile-item">
            <label>성별:</label>
            <span>${userProfile.user_gender == 1 ? '남성' : '여성'}</span>
        </div>
        <div class="profile-item">
            <label>가입 방법:</label>
            <span>${userProfile.join_method}</span>
        </div>
        <div class="profile-item">
            <label>전화번호:</label>
            <span>${userProfile.user_tel}</span>
        </div>
        <div class="profile-item">
            <label>닉네임:</label>
            <span>${userProfile.user_nickname}</span>
        </div>
        <div class="profile-item">
            <label>소개:</label>
            <span>${userProfile.user_intro}</span>
        </div>
        <div class="profile-item">
            <label>위치:</label>
            <span>${userProfile.user_location}</span>
        </div>
    </div>
</body>
</html>
