<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
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
            min-height: 100vh;
            margin: 0;
            background-color: #f8f4ec;
        }
        .profile-container {
            width: 90%;
            max-width: 500px; /* 최대 크기 설정 */
            padding: 30px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }
        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .profile-header img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-header h2 {
            margin-top: 15px;
            font-size: 1.8em;
            font-weight: bold;
            color: #333;
        }
        .profile-header p {
            margin: 5px 0;
            font-size: 1em;
            color: #666;
        }
        .profile-item {
            margin-bottom: 20px;
            border-bottom: 1px solid #f1f1f1;
            padding-bottom: 10px;
        }
        .profile-item:last-child {
            border-bottom: none;
        }
        .profile-item label {
            font-weight: bold;
            font-size: 1em;
            color: #444;
            display: block;
            margin-bottom: 5px;
        }
        .profile-item span {
            font-size: 1em;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <!-- 프로필 헤더 -->
        <div class="profile-header">
            <img src="profile-icon.png" alt="프로필 이미지">
            <h2>${userProfile.user_name}</h2>
            <p>${userProfile.user_email}</p>
            <p>포인트: <strong>${userProfile.user_point} p</strong></p>
        </div>

        <!-- 프로필 상세 정보 -->
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
            <span>${userProfile.join_method == 'R' ? '일반 가입' : '카카오 가입'}</span>
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
            <span>${userProfile.user_intro != null ? userProfile.user_intro : '소개 정보가 없습니다.'}</span>
        </div>
        <div class="profile-item">
            <label>위치:</label>
            <span>${userProfile.user_location != null ? userProfile.user_location : '위치 정보가 없습니다.'}</span>
        </div>
    </div>
</body>
</html>
