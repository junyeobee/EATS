<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 수정</title>
    <link rel="stylesheet" href="/css/user/myPage.css">
</head>
<body>
    <div class="container">
        <h1>내 정보 수정</h1>
        <form action="/user/mypage/updateProfile" method="post">
            <input type="hidden" name="user_idx" value="${userProfile.user_idx}">

            <div class="form-group">
                <label for="user_name">이름</label>
                <input type="text" id="user_name" name="user_name" value="${userProfile.user_name}" required>
            </div>

            <div class="form-group">
                <label for="user_email">이메일</label>
                <input type="email" id="user_email" name="user_email" value="${userProfile.user_email}" required>
            </div>

            <div class="form-group">
                <label for="user_birth">생년월일</label>
                <input type="date" id="user_birth" name="user_birth" value="${userProfile.user_birth}" required>
            </div>

            <div class="form-group">
                <label for="user_tel">전화번호</label>
                <input type="text" id="user_tel" name="user_tel" value="${userProfile.user_tel}" required>
            </div>

            <div class="form-group">
                <label for="user_nickname">닉네임</label>
                <input type="text" id="user_nickname" name="user_nickname" value="${userProfile.user_nickname}">
            </div>

            <div class="form-group">
                <label for="user_intro">소개</label>
                <textarea id="user_intro" name="user_intro">${userProfile.user_intro}</textarea>
            </div>

            <div class="button-group">
                <button type="submit" class="btn save">저장하기</button>
                <button type="button" class="btn back" onclick="history.back()">이전으로</button>
            </div>
        </form>
    </div>
</body>
</html>
