<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의 작성</title>
    <link rel="stylesheet" href="/css/user/myPageCss.css"> <!-- 스타일 시트 -->
    <link rel="stylesheet" href="./css/user/userHeader.css">
</head>
<body>
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

<style>
    .container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        font-family: Arial, sans-serif;
    }

    h1 {
        text-align: center;
        margin-bottom: 30px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    input[type="text"], textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }

    textarea {
        resize: none;
    }

    .button-group {
        text-align: center;
    }

    .btn-submit {
        background-color: #007BFF;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        border-radius: 4px;
        font-size: 14px;
        margin-right: 10px;
    }

    .btn-submit:hover {
        background-color: #0056b3;
    }

    .btn-cancel {
        background-color: #6c757d;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        border-radius: 4px;
        font-size: 14px;
    }

    .btn-cancel:hover {
        background-color: #5a6268;
    }
</style>

</body>
</html>
