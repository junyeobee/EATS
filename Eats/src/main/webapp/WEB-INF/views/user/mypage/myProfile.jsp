<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 정보</title>
    <link rel="stylesheet" href="/css/user/myProfileCss.css">
    <link rel="stylesheet" href="/css/user/userHeader.css">
    <link rel="stylesheet" href="/css/user/userFooter.css">
</head>
<body>
    <!-- 헤더 포함 -->
    <%@include file="/WEB-INF/views/userHeader.jsp" %>

    <div class="container">
        <!-- 프로필 섹션 -->
<div class="profile">
    <img src="${not empty userProfile.profile_image ? userProfile.profile_image : '/svg/profile_icon.svg'}" 
         alt="프로필 이미지" class="profile-img">
    <div class="profile">
        <div class="profile-name">${userProfile.user_nickname}</div>
    </div>
</div>


        <!-- 정보 테이블 -->
        <h1>나의 정보</h1>
        <table class="info-table">
            <tr>
                <th>닉네임</th>
                <td>${userProfile.user_nickname}</td>
            </tr>
            <tr>
                <th>소개</th>
                <td>${not empty userProfile.user_intro ? userProfile.user_intro : '소개 정보가 없습니다.'}</td>
            </tr>
            <tr>
                <th>위치</th>
                <td>${not empty userProfile.user_location ? userProfile.user_location : '위치 정보가 없습니다.'}</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>${userProfile.user_tel}</td>
            </tr>
        </table>

        <!-- 버튼 섹션 -->
        <div class="button-wrapper">
            <a href="/user/mypage/myPage" class="btn-link">돌아가기</a>
            <a href="/user/mypage/editProfile" class="btn-link">프로필 수정</a>
        </div>
    </div>
    <%@include file="../../userFooter.jsp" %>
    <script type="text/javascript" src="/js/userHeader.js"></script>
</body>
</html>
