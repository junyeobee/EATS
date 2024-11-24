<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 상세 보기</title>
    <link rel="stylesheet" href="/css/user/myPageCss.css">
    <link rel="stylesheet" href="./css/user/userHeader.css">
</head>
<body>
<div class="container">
    <h1>문의 상세 보기</h1>

    <div class="qna-detail">
        <div class="qna-item">
            <label>제목:</label>
            <!-- 제목을 클릭하면 목록으로 이동 -->
            <a href="/user/mypage/myQna" style="color: blue; text-decoration: underline;">
                ${qnaDetail.UQNA_TITLE}
            </a>
        </div>
        <div class="qna-item">
            <label>문의 내용:</label>
            <p>${qnaDetail.UQNA_CONTENT}</p>
        </div>
        <div class="qna-item">
            <label>문의일:</label>
            <!-- 문의일을 클릭하면 목록으로 이동 -->
            <a href="/user/mypage/myQna" style="color: blue; text-decoration: underline;">
                ${qnaDetail.UQNA_WDATE}
            </a>
        </div>
        <div class="qna-item">
            <label>처리 상태:</label>
            <c:choose>
                <c:when test="${qnaDetail.UQNA_STAT == 0}">
                    처리 대기
                </c:when>
                <c:otherwise>
                    처리 완료
                </c:otherwise>
            </c:choose>
        </div>
<!-- 처리 완료일 -->
<c:if test="${qnaDetail.UQNA_ANSWER != null}">
    <div class="qna-item">
        <label>답변:</label>
        <p>${qnaDetail.UQNA_ANSWER}</p>
    </div>
</c:if>

    </div>

    <div class="button-group">
        <button onclick="window.history.back();" class="btn-back">돌아가기</button>
    </div>
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
        margin-bottom: 20px;
    }

    .qna-detail {
        border: 1px solid #ccc;
        padding: 15px;
        border-radius: 5px;
        background-color: #f9f9f9;
    }

    .qna-item {
        margin-bottom: 15px;
    }

    .qna-item label {
        font-weight: bold;
        display: inline-block;
        width: 100px;
    }

    .qna-item span, .qna-item p {
        display: inline-block;
        margin-left: 10px;
    }

    .button-group {
        text-align: center;
        margin-top: 20px;
    }

    .btn-back {
        background-color: #007BFF;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        border-radius: 4px;
        font-size: 14px;
    }

    .btn-back:hover {
        background-color: #0056b3;
    }
</style>

</body>
</html>
