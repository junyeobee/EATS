<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 상세 보기</title>
    <link rel="stylesheet" href="/css/user/myPageCss.css">
    <link rel="stylesheet" href="/css/user/userHeader.css">
    <link rel="stylesheet" href="/css/user/userFooter.css">
    <style>
        /* 컨테이너 스타일 */
        .container {
            width: 80%;
            max-width: 800px;
            margin: 100px auto;
            background-color: #FFFFFF;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        /* 제목 스타일 */
        h1 {
            text-align: center;
            font-size: 2.4rem;
            font-weight: bold;
            color: #F3553C;
            margin-bottom: 30px;
        }

        /* 문의 상세 정보 박스 */
        .qna-detail {
            background-color: #FFF8EB;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        /* 개별 항목 스타일 */
        .qna-item {
            margin-bottom: 20px;
        }

        .qna-item label {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 10px;
        }

        .qna-item input, .qna-item textarea {
            width: 100%;
            padding: 12px 15px;
            font-size: 1rem;
            border: 1px solid #E0E0E0;
            border-radius: 10px;
            background-color: #FFFFFF;
            color: #333;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            resize: none;
        }

        .qna-item input:focus, .qna-item textarea:focus {
            border-color: #F3553C;
            outline: none;
            background-color: #FFFAF0;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        }

        /* 버튼 섹션 */
        .button-group {
            text-align: center;
            margin-top: 30px;
        }

        .btn-back {
            background-color: #F3553C;
            color: #FFFFFF;
            padding: 15px 30px;
            font-size: 1.2rem;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .btn-back:hover {
            background-color: #D84332;
            transform: translateY(-3px);
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }

            .qna-item input, .qna-item textarea {
                font-size: 0.9rem;
            }

            .btn-back {
                font-size: 1rem;
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
    <%@include file="/WEB-INF/views/userHeader.jsp" %>

    <div class="container">
        <h1>문의 상세 보기</h1>

        <div class="qna-detail">
            <div class="qna-item">
                <label>제목:</label>
                <input type="text" value="${qnaDetail.UQNA_TITLE}" readonly>
            </div>
            <div class="qna-item">
                <label>문의 내용:</label>
                <textarea rows="4" readonly>${qnaDetail.UQNA_CONTENT}</textarea>
            </div>
            <div class="qna-item">
                <label>문의일:</label>
                <input type="text" value="${qnaDetail.UQNA_WDATE}" readonly>
            </div>
            <div class="qna-item">
                <label>처리 상태:</label>
                <input type="text" value="${qnaDetail.UQNA_STAT == 0 ? '처리 대기' : '처리 완료'}" readonly>
            </div>
            <c:if test="${qnaDetail.UQNA_ANSWER != null}">
                <div class="qna-item">
                    <label>답변:</label>
                    <textarea rows="4" readonly>${qnaDetail.UQNA_ANSWER}</textarea>
                </div>
            </c:if>
        </div>

        <div class="button-group">
            <button onclick="window.history.back();" class="btn-back">돌아가기</button>
        </div>
    </div>
    <%@include file="../../userFooter.jsp" %>
    <script type="text/javascript" src="/js/userHeader.js"></script>
</body>
</html>
