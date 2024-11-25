<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의</title>
    <link rel="stylesheet" href="/css/user/myPageCss.css">
    <link rel="stylesheet" href="/css/user/userHeader.css">
    <style>
        /* 컨테이너 기본 스타일 */
        .container {
            width: 80%;
            max-width: 900px;
            margin: 50px auto;
            background-color: #FFFFFF;
            border-radius: 20px;
            padding: 30px 40px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        /* 제목 */
        h1 {
            text-align: center;
            font-size: 2rem;
            font-weight: bold;
            color: #F3553C; /* 테마 빨간색 */
            margin-bottom: 30px;
        }

        /* 검색 영역 */
        .search-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            gap: 10px;
        }

        .search-container input[type="text"] {
            flex: 1;
            height: 40px;
            padding: 0 10px;
            font-size: 1rem;
            border: 1px solid #CCCCCC;
            border-radius: 8px;
        }

        .search-container select {
            height: 40px;
            padding: 0 10px;
            font-size: 1rem;
            border: 1px solid #CCCCCC;
            border-radius: 8px;
        }

        .search-container .search-btn {
            height: 40px;
            padding: 0 20px;
            font-size: 1rem;
            background-color: #F3553C;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-container .search-btn:hover {
            background-color: #D84332;
        }

        /* 테이블 */
        .qna-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .qna-table th, .qna-table td {
            border: 1px solid #E0E0E0;
            text-align: center;
            padding: 15px;
            font-size: 1rem;
        }

        .qna-table th {
            background-color: #F9F9F9;
            font-weight: bold;
        }

        .qna-table tr:nth-child(even) {
            background-color: #FAFAFA;
        }

        .qna-table tr:hover {
            background-color: #FFF8EB; /* 베이지 색상 */
        }

        /* 상태 컬러 */
        .status-pending {
            color: #F3553C; /* 빨간색 */
            font-weight: bold;
        }

        .status-done {
            color: #4CAF50; /* 녹색 */
            font-weight: bold;
        }

        /* 페이지네이션 */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            gap: 5px;
        }

        .pagination a {
            padding: 10px 15px;
            border: 1px solid #E0E0E0;
            border-radius: 8px;
            color: #333333;
            text-decoration: none;
            font-size: 1rem;
        }

        .pagination a.active {
            background-color: #F3553C;
            color: #FFFFFF;
            font-weight: bold;
        }

        .pagination a:hover {
            background-color: #FFE2D9;
        }

.button-container {
    display: flex;
    justify-content: center; /* 버튼을 가운데 정렬 */
    gap: 20px; /* 버튼 간의 간격 */
    margin-top: 20px;
}

.button-container a, .button-container button {
    background-color: #F3553C;
    color: #FFFFFF;
    padding: 10px 25px;
    font-size: 1rem;
    border: none;
    border-radius: 8px;
    text-decoration: none;
    text-align: center;
    cursor: pointer;
    transition: background-color 0.3s;
}

.button-container a:hover, .button-container button:hover {
    background-color: #D84332;
}

    </style>
</head>
<body>
    <!-- 헤더 포함 -->
    <%@include file="/WEB-INF/views/userHeader.jsp" %>

    <div class="container">
        <h1>1:1 문의</h1>

        <!-- 검색 영역 -->
        <form action="/user/mypage/myQna" method="get" class="search-container">
            <input type="text" id="keyword" name="keyword" placeholder="제목 검색" value="${keyword}">
            <select id="status" name="status">
                <option value="">전체</option>
                <option value="0" ${status == '0' ? 'selected' : ''}>처리 대기</option>
                <option value="1" ${status == '1' ? 'selected' : ''}>처리 완료</option>
            </select>
            <button type="submit" class="search-btn">검색</button>
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
                        <td>${qna.UQNA_IDX}</td>
                        <td>${qna.UQNA_TITLE}</td>
                        <td>${qna.UQNA_WDATE}</td>
                        <td>${qna.UQNA_ANSWER != null ? qna.UQNA_ANSWER : '-'}</td>
                        <td class="${qna.UQNA_STAT == 0 ? 'status-pending' : 'status-done'}">
                            ${qna.UQNA_STAT == 0 ? '처리 대기' : '처리 완료'}
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이지네이션 -->
        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="?page=${currentPage - 1}&keyword=${keyword}&status=${status}" class="prev-btn">이전</a>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="page">
                <a href="?page=${page}&keyword=${keyword}&status=${status}" class="${page == currentPage ? 'active' : ''}">${page}</a>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <a href="?page=${currentPage + 1}&keyword=${keyword}&status=${status}" class="next-btn">다음</a>
            </c:if>
        </div>

        <!-- 버튼 영역 -->
<div class="button-container">
    <a href="javascript:history.back()">뒤로가기</a>
    <button onclick="location.href='/user/mypage/writeQna'">글쓰기</button>
</div>
    </div>
</body>
</html>
