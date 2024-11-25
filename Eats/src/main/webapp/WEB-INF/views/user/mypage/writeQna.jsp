<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의 작성</title>
    <link rel="stylesheet" href="/css/user/myPageCss.css"> <!-- 공통 CSS -->
    <link rel="stylesheet" href="/css/user/myQnaWriteCss.css"> <!-- 1:1 문의 작성 전용 CSS -->
    <link rel="stylesheet" href="/css/user/userHeader.css"> <!-- 헤더 CSS -->
</head>
<body>
    <!-- 헤더 포함 -->
    <%@ include file="/WEB-INF/views/userHeader.jsp" %>

    <!-- 컨테이너 시작 -->
    <div class="container">
        <h1>1:1 문의 작성</h1>

        <!-- 문의 작성 폼 -->
        <form action="/user/mypage/writeQna" method="post" id="qnaForm">
            <div class="form-group">
                <label for="UQNA_TITLE">제목</label>
                <input type="text" id="UQNA_TITLE" name="UQNA_TITLE" required placeholder="제목을 입력하세요.">
            </div>
            <div class="form-group">
                <label for="UQNA_CONTENT">내용</label>
                <textarea id="UQNA_CONTENT" name="UQNA_CONTENT" rows="10" required placeholder="내용을 입력하세요."></textarea>
            </div>

            <!-- 버튼 영역 -->
            <div class="button-group">
                <button type="submit" class="btn-submit">제출</button>
                <button type="button" class="btn-cancel" onclick="window.history.back();">취소</button>
            </div>
        </form>
    </div>
</body>
</html>
