<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 상세 보기</title>
    <link rel="stylesheet" href="/css/store/storeDetail.css">
    <style>
        /* 전체 컨테이너 스타일 */
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background: #f9f9f9;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            color: #333;
            font-weight: bold;
        }

        .qna-detail {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            background-color: #fff;
        }

        .qna-item {
            margin-bottom: 20px;
        }

        .qna-item label {
            font-weight: bold;
            display: inline-block;
            width: 120px;
            color: #555;
        }

        .qna-item span, .qna-item p {
            display: inline-block;
            margin-left: 10px;
            font-size: 16px;
            color: #333;
        }

        .qna-item p {
            line-height: 1.6;
        }

        .button-group {
            text-align: center;
            margin-top: 30px;
        }

        .btn-back {
            background-color: #000;
            color: #fff;
            padding: 12px 20px;
            border: none;
            cursor: pointer;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-back:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <!-- 헤더 포함 -->
    <%@ include file="/WEB-INF/views/store/store_Header.jsp" %>

    <div class="container">
        <h1>문의 상세 보기</h1>

        <div class="qna-detail">
            <div class="qna-item">
                <label>제목:</label>
                <span>${qnaDetail.SQNA_TITLE}</span>
            </div>
            <div class="qna-item">
                <label>문의 내용:</label>
                <p>${qnaDetail.SQNA_CONTENT}</p>
            </div>
            <div class="qna-item">
                <label>문의일:</label>
                <span>${qnaDetail.SQNA_WDATE}</span>
            </div>
            <div class="qna-item">
                <label>처리 상태:</label>
                <c:choose>
                    <c:when test="${qnaDetail.SQNA_STAT == 0}">
                        <span style="color: red;">처리 대기</span>
                    </c:when>
                    <c:otherwise>
                        <span style="color: green;">처리 완료</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <c:if test="${qnaDetail.SQNA_ANSWER != null}">
                <div class="qna-item">
                    <label>답변:</label>
                    <p>${qnaDetail.SQNA_ANSWER}</p>
                </div>
            </c:if>
        </div>

        <div class="button-group">
            <button onclick="window.history.back();" class="btn-back">이전</button>
        </div>
    </div>

    <!-- 푸터 포함 -->
    <%@ include file="/WEB-INF/views/store/common/footer.jsp" %>
</body>
</html>
