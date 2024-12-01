<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의 작성</title>
    <link rel="stylesheet" href="/css/user/myPageCss.css">
    <link rel="stylesheet" href="/css/user/userHeader.css">
    <style>
        /* 컨테이너 기본 스타일 */
        .container {
            width: 80%;
            max-width: 900px;
            margin: 100px auto;
            background-color: #FFFFFF;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
        }

        /* 제목 스타일 */
        h1 {
            text-align: center;
            font-size: 2rem;
            font-weight: bold;
            color: #F3553C; /* 테마 빨간색 */
            margin-bottom: 30px;
        }

        /* 폼 스타일 */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333333;
            font-size: 1.1rem;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 15px;
            font-size: 1rem;
            border: 1px solid #E0E0E0;
            border-radius: 10px;
            background-color: #FAFAFA;
            transition: border-color 0.3s;
        }

        .form-group input[type="text"]:focus,
        .form-group textarea:focus {
            border-color: #F3553C;
            background-color: #FFFFFF;
        }

        textarea {
            resize: none; /* 크기 조정 비활성화 */
            height: 150px; /* 텍스트 영역 높이 */
        }

        /* 버튼 그룹 */
        .button-group {
            text-align: center;
            margin-top: 30px;
        }

        .button-group button {
            display: inline-block;
            padding: 15px 30px;
            font-size: 1.1rem;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-submit {
            background-color: #F3553C;
            color: #FFFFFF;
        }

        .btn-submit:hover {
            background-color: #D84332;
        }

        .btn-cancel {
            background-color: #F5F5F5;
            color: #333333;
            margin-left: 10px;
        }

        .btn-cancel:hover {
            background-color: #E0E0E0;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 30px;
            }

            .button-group button {
                width: 100%; /* 버튼을 100% 너비로 설정 */
                margin-bottom: 10px;
            }

            .btn-cancel {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <%@include file="/WEB-INF/views/userHeader.jsp" %>
    <link rel="stylesheet" href="/css/user/myPageCss.css"> <!-- 스타일 시트 -->
    <link rel="stylesheet" href="/css/user/userHeader.css">
    <link rel="stylesheet" href="/css/user/userFooter.css">
</head>
<body>
<%@include file="../../userHeader.jsp" %>
<div class="container">
    <h1>1:1 문의 작성</h1>


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
                <textarea id="UQNA_CONTENT" name="UQNA_CONTENT" required placeholder="내용을 입력하세요."></textarea>
            </div>

            <!-- 버튼 영역 -->
            <div class="button-group">
                <button type="submit" class="btn-submit">제출</button>
                <button type="button" class="btn-cancel" onclick="window.history.back();">취소</button>
            </div>
        </form>
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
<%@include file="../../userFooter.jsp" %>
    <script type="text/javascript" src="/js/userHeader.js"></script>

</body>
</html>
