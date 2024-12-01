<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의</title>
    <link rel="stylesheet" href="/css/store/storeContCss.css">
    <link rel="stylesheet" href="/css/store/store_Header.css">
    <style>
        /* 전체 컨테이너 스타일 */
        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 30px;
            background: #f9f9f9;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            color: #333;
            font-weight: bold;
        }

        /* 검색 영역 스타일 */
        .search-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .search-container label {
            font-size: 16px;
            color: #555;
            flex: 1;
            margin-right: 10px;
        }

        .search-container input,
        .search-container select,
        .search-container button {
            padding: 12px 15px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
        }

        .search-container button {
            background-color: #000;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-weight: bold;
        }

        .search-container button:hover {
            background-color: #333;
        }

        /* 테이블 스타일 */
        .qna-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
            font-size: 16px;
        }

        .qna-table th, .qna-table td {
            border: 1px solid #ddd;
            text-align: center;
            padding: 15px;
        }

        .qna-table th {
            background-color: #f4f4f4;
            font-weight: bold;
            color: #333;
        }

        .qna-table td {
            background-color: #fff;
        }

        /* 제목 링크 스타일 */
        .title-link {
            color: #000;
            font-weight: bold;
            text-decoration: none;
        }

        .title-link:hover {
            text-decoration: underline;
        }

        /* 상태 스타일 */
        .status-pending {
            color: #ff5722;
            font-weight: bold;
        }

        .status-complete {
            color: #4CAF50;
            font-weight: bold;
        }

        /* 페이지네이션 */
        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        .pagination a {
            margin: 0 8px;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-decoration: none;
            color: #000;
            font-weight: bold;
        }

        .pagination a.active {
            background-color: #000;
            color: white;
        }

        .pagination a:hover {
            background-color: #333;
            color: white;
        }

        /* 버튼 스타일 */
        .button-container {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }

        .back-btn,
        .write-btn {
            background-color: #000;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover,
        .write-btn:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <!-- 헤더 포함 -->
    <%@ include file="/WEB-INF/views/store/store_Header.jsp" %>

    <div class="container">
        <h1>1:1 문의</h1>

        <!-- 검색 영역 -->
        <form action="/store/qna" method="get" class="search-container">
            <label for="keyword">질문 및 상태를 선택하여 검색하세요.</label>
            <input type="text" id="keyword" name="keyword" placeholder="제목 검색" value="${keyword}">
            <select id="status" name="status">
                <option value="">전체</option>
                <option value="0" ${status == '0' ? 'selected' : ''}>처리 대기</option>
                <option value="1" ${status == '1' ? 'selected' : ''}>처리 완료</option>
            </select>
            <button type="submit">검색</button>
        </form>

        <!-- 테이블 -->
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
                        <td>${qna.SQNA_IDX}</td>
                        <td>
                            <a href="/store/qna/detail/${qna.SQNA_IDX}" class="title-link">
                                ${qna.SQNA_TITLE}
                            </a>
                        </td>
                        <td>${qna.SQNA_WDATE}</td>
                        <td>${qna.SQNA_ANSWER == null ? "-" : qna.SQNA_ANSWER_DATE}</td>
                        <td>
                            <c:choose>
                                <c:when test="${qna.SQNA_STAT == 0}">
                                    <span class="status-pending">처리 대기</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-complete">처리 완료</span>
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

        <!-- 버튼 -->
        <div class="button-container">
            <button class="back-btn" onclick="history.back();">이전</button>
            <button class="write-btn" onclick="location.href='/store/qna/write'">글쓰기</button>
        </div>
    </div>

    <!-- 푸터 포함 -->
    <%@ include file="/WEB-INF/views/store/common/footer.jsp" %>
</body>
</html>
