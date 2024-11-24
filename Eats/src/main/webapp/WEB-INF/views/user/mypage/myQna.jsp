<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의</title>
    <link rel="stylesheet" href="/css/user/myPageCss.css"> <!-- 스타일 시트 -->
    <link rel="stylesheet" href="/css/user/userHeader.css">
</head>
<body>
    <!-- 헤더 포함 -->
    <%@include file="/WEB-INF/views/userHeader.jsp" %>

    <div class="container">
        <h1>1:1 문의</h1>

        <!-- 검색 영역 -->
        <form action="/user/mypage/myQna" method="get" class="search-container">
            <label for="keyword">질문 및 상태를 선택하여 검색하세요.</label>
            <input type="text" id="keyword" name="keyword" placeholder="제목 검색" value="${keyword}">
            <select id="status" name="status">
                <option value="">전체</option>
                <option value="0" ${status == '0' ? 'selected' : ''}>처리 대기</option>
                <option value="1" ${status == '1' ? 'selected' : ''}>처리 완료</option>
            </select>
            <button type="submit" class="search-btn">검색</button>
        </form>

        <!-- 테이블 영역 -->
        <table class="qna-table">
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>문의일</th>
                <th>처리완료일</th>
                <th>처리상태</th>
            </tr>
            </thead>
            <tbody>
<c:forEach var="qna" items="${qnaList}">
    <tr>
        <td>${qna.UQNA_IDX}</td>
        <td>${qna.UQNA_TITLE}</td>
        <td>${qna.UQNA_WDATE}</td>
        <td>
            <!-- 답변이 있을 때만 답변을 표시 -->
            <c:choose>
                <c:when test="${qna.UQNA_ANSWER != null}">
                    ${qna.UQNA_ANSWER}
                </c:when>
                <c:otherwise>
                    <!-- 답변이 없으면 "-" 표시 -->
                    -
                </c:otherwise>
            </c:choose>
        </td>
        <td>
            <c:choose>
                <c:when test="${qna.UQNA_STAT == 0}">
                    <span style="color: red;">처리 대기</span>
                </c:when>
                <c:otherwise>
                    <span style="color: green;">처리 완료</span>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
</c:forEach>

            </tbody>
        </table>

        <!-- 페이지네이션 -->
        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="?page=${currentPage - 1}&keyword=${keyword}&status=${status}">&laquo;</a>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="page">
                <a href="?page=${page}&keyword=${keyword}&status=${status}" class="${page == currentPage ? 'active' : ''}">${page}</a>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <a href="?page=${currentPage + 1}&keyword=${keyword}&status=${status}">&raquo;</a>
            </c:if>
        </div>

        <!-- 글쓰기 버튼 -->
        <div class="write-btn-container">
            <button onclick="location.href='/user/mypage/writeQna'" class="write-btn">글쓰기</button>
        </div>
    </div>

    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        .search-container {
            margin-bottom: 20px;
        }

        .search-container label {
            font-size: 14px;
        }

        .search-container input, .search-container select, .search-container button {
            padding: 5px;
            margin-right: 5px;
        }

        .qna-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .qna-table th, .qna-table td {
            border: 1px solid #ddd;
            text-align: center;
            padding: 10px;
        }

        .qna-table th {
            background-color: #f4f4f4;
        }

        .pagination {
            text-align: center;
        }

        .pagination a {
            margin: 0 5px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            text-decoration: none;
        }

        .pagination a.active {
            font-weight: bold;
            background-color: #ddd;
        }

        .write-btn-container {
            text-align: right;
        }

        .write-btn {
            background-color: #007BFF;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            border-radius: 4px;
        }

        .write-btn:hover {
            background-color: #0056b3;
        }
    </style>
</body>
</html>
