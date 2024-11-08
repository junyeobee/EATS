<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 문의 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f4ec;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 800px;
            background-color: #fff5e4;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2e7d5;
        }
        .action-buttons {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 10px;
        }
        .button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            margin-left: 5px;
            cursor: pointer;
        }
        .inquiry-btn {
            background-color: #ffa07a;
            color: white;
        }
        .delete-btn {
            background-color: #dc143c;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">1:1 문의 목록</div>
        
        <div class="action-buttons">
            <button class="button inquiry-btn">문의하기</button>
            <button class="button delete-btn">삭제</button>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>선택</th>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="qna" items="${qnaList}">
                    <tr>
                        <td><input type="checkbox" name="selectQna" value="${qna.qnaIdx}"></td>
                        <td>${qna.qnaIdx}</td>
                        <td>${qna.qnaTitle}</td>
                        <td>${qna.qnaWriter}</td>
                        <td>${qna.qnaDate}</td>
                        <td>${qna.qnaStatus}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
