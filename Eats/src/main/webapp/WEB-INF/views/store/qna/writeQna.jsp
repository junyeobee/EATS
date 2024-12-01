<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의 작성</title>
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

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            font-size: 16px;
            color: #555;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            color: #333;
        }

        textarea {
            resize: none;
            height: 150px;
        }

        /* 버튼 영역 */
        .button-group {
            text-align: center;
            margin-top: 20px;
        }

        .btn-submit {
            background-color: #000;
            color: #fff;
            padding: 12px 20px;
            border: none;
            cursor: pointer;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #333;
        }

        .btn-cancel {
            background-color: #6c757d;
            color: white;
            padding: 12px 20px;
            border: none;
            cursor: pointer;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-cancel:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <!-- 헤더 포함 -->
    <%@ include file="/WEB-INF/views/store/store_Header.jsp" %>

    <div class="container">
        <h1>1:1 문의 작성</h1>

        <!-- 문의 작성 폼 -->
        <form action="/store/qna/write" method="post" id="qnaForm">
            <div class="form-group">
                <label for="SQNA_TITLE">제목</label>
                <input type="text" id="SQNA_TITLE" name="SQNA_TITLE" required placeholder="제목을 입력하세요.">
            </div>
            <div class="form-group">
                <label for="SQNA_CONTENT">내용</label>
                <textarea id="SQNA_CONTENT" name="SQNA_CONTENT" required placeholder="내용을 입력하세요."></textarea>
            </div>

            <!-- 버튼 영역 -->
            <div class="button-group">
                <button type="submit" class="btn-submit">제출</button>
                <button type="button" class="btn-cancel" onclick="window.history.back();">취소</button>
            </div>
        </form>
    </div>

    <!-- 푸터 포함 -->
    <%@ include file="/WEB-INF/views/store/common/footer.jsp" %>
</body>
</html>
