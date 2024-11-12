<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 정보</title>
    <!-- CSS 파일 연결 -->
   <link rel="stylesheet" href="/css/user/myPage.css">
</head>
<body>
    <div class="container">
        <!-- 프로필 섹션 -->
        <div class="profile">
            <img src="/img/profile-icon.png" alt="프로필 이미지">
            <div class="profile-point">포인트: ${userProfile.userPoint} p</div>
        </div>
		<form action="/user/mypage/uploadProfileImage" method="post" enctype="multipart/form-data">
    <label for="profileImage">프로필 이미지 변경:</label>
    <input type="file" id="profileImage" name="profileImage" accept="image/*">
    <button type="submit">업로드</button>
</form>
		
        <!-- 정보 테이블 -->
        <h1>나의 정보</h1>
        <table class="info-table">
            <tr>
                <th>아이디</th>
                <td>${userProfile.userId}</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>${userProfile.userBirth}</td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <c:choose>
                        <c:when test="${userProfile.userGender == 1}">남성</c:when>
                        <c:when test="${userProfile.userGender == 2}">여성</c:when>
                        <c:otherwise>기타</c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>가입 방법</th>
                <td>${userProfile.joinMethod}</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>${userProfile.userTel}</td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>${userProfile.userNickname}</td>
            </tr>
            <tr>
                <th>소개</th>
                <td>
                    <c:if test="${empty userProfile.userIntro}">
                        소개 정보가 없습니다.
                    </c:if>
                    <c:if test="${not empty userProfile.userIntro}">
                        ${userProfile.userIntro}
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>위치</th>
                <td>
                    <c:if test="${empty userProfile.userLocation}">
                        위치 정보가 없습니다.
                    </c:if>
                    <c:if test="${not empty userProfile.userLocation}">
                        ${userProfile.userLocation}
                    </c:if>
                </td>
            </tr>
        </table>

        <!-- 버튼 섹션 -->
        <div class="button-wrapper">
            <a href="/user/mypage/myPage?userId=${userProfile.userIdx}">돌아가기</a>
            <a href="/user/mypage/editProfile?userId=${userProfile.userIdx}">프로필 수정</a>
        </div>
    </div>
</body>
</html>
