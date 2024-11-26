<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의</title>
    <link rel="stylesheet" href="/css/user/myPageCss.css">
    <link rel="stylesheet" href="/css/user/userHeader.css">
    <link rel="stylesheet" href="/css/user/userFooter.css">
    <style>
/* 컨테이너 기본 스타일 */
.container {
    width: 80%;
    max-width: 1200px; /* 마이페이지와 동일한 최대 너비 */
    margin: 100px auto; /* 마이페이지와 동일한 중앙 정렬 */
    background-color: #FFFFFF;
    border-radius: 25px; /* 둥근 모서리 */
    padding: 50px; /* 내부 여백 추가 */
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2); /* 마이페이지와 비슷한 그림자 */
}

/* 제목 스타일 */
h1 {
    text-align: center;
    font-size: 2.2rem; /* 조금 더 큰 제목 폰트 크기 */
    font-weight: bold;
    color: #F3553C; /* 테마 빨간색 */
    margin-bottom: 40px; /* 제목 아래 여백 추가 */
}

/* 검색 영역 */
.search-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    gap: 15px; /* 요소 간 간격 */
}

.search-container input[type="text"] {
    flex: 2;
    height: 45px; /* 높이 증가 */
    padding: 0 15px; /* 내부 여백 증가 */
    font-size: 1.1rem; /* 폰트 크기 증가 */
    border: 1px solid #E0E0E0; /* 더 밝은 테두리 */
    border-radius: 8px;
}

.search-container select {
    flex: 1;
    height: 45px;
    padding: 0 15px;
    font-size: 1.1rem;
    border: 1px solid #E0E0E0;
    border-radius: 8px;
}

.search-container .search-btn {
    height: 45px;
    padding: 0 25px;
    font-size: 1.1rem;
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

/* 테이블 스타일 */
.qna-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.qna-table th, .qna-table td {
    border: 1px solid #E0E0E0;
    text-align: center;
    padding: 20px; /* 높이와 내부 여백 증가 */
    font-size: 1.1rem; /* 폰트 크기 증가 */
}

.qna-table th {
    background-color: #FFF8EB; /* 테마 베이지 */
    font-weight: bold;
}

.qna-table tr:nth-child(even) {
    background-color: #FAFAFA;
}

.qna-table tr:hover {
    background-color: #FFF4D9; /* 마우스 오버 시 강조 */
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
    margin-top: 30px;
    gap: 10px;
}

.pagination a {
    padding: 10px 20px;
    border: 1px solid #E0E0E0;
    border-radius: 8px;
    color: #333333;
    text-decoration: none;
    font-size: 1.1rem;
}

.pagination a.active {
    background-color: #F3553C;
    color: #FFFFFF;
    font-weight: bold;
}

.pagination a:hover {
    background-color: #FFE2D9;
}

/* 버튼 영역 */
.button-container {
    display: flex;
    justify-content: center; /* 버튼을 가운데 정렬 */
    gap: 20px; /* 버튼 간의 간격 */
    margin-top: 30px;
}

.button-container a, .button-container button {
    background-color: #F3553C;
    color: #FFFFFF;
    padding: 15px 30px; /* 버튼 크기 증가 */
    font-size: 1.1rem; /* 폰트 크기 증가 */
    border: none;
    border-radius: 10px; /* 둥근 모서리 */
    text-decoration: none;
    text-align: center;
    cursor: pointer;
    transition: background-color 0.3s;
}

.button-container a:hover, .button-container button:hover {
    background-color: #D84332;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .container {
        width: 95%;
        padding: 30px;
    }

    .search-container {
        flex-direction: column; /* 요소를 세로로 정렬 */
        gap: 10px;
    }

    .button-container {
        flex-direction: column;
        gap: 15px;
    }

    .button-container a, .button-container button {
        width: 100%; /* 버튼 너비를 100%로 설정 */
    }
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
            <th>답변</th>
            <th>처리상태</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="qna" items="${qnaList}">
            <tr>
                <td>${qna.UQNA_IDX}</td>
<td>
    <a href="/user/mypage/qnaDetail/${qna.UQNA_IDX}" style="color: #F3553C; text-decoration: none;">
        ${qna.UQNA_TITLE}
    </a>
</td>

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
    <%@include file="../../userFooter.jsp" %>
    <script type="text/javascript" src="/js/userHeader.js"></script>
</body>
</html>
