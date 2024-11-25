<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp" %>

<h2>1:1 문의 리스트</h2>
 <link rel="stylesheet" href="../css/manager/headerCss.css"> <!-- 헤더 CSS -->
 <link rel="stylesheet" href="../css/manager/navigationCss.css"> <!-- 네비게이션 CSS -->
 <link rel="stylesheet" href="/css/manager/qnaCss.css"> <!-- CSS -->
<!-- 드롭다운 메뉴 -->
<form method="get" action="/admin/qna">
    <select name="type" id="qnaType" onchange="this.form.submit()">
        <option value="user" ${type == 'user' ? 'selected' : ''}>사용자 문의</option>
        <option value="store" ${type == 'store' ? 'selected' : ''}>매장 문의</option>
    </select>
    <input type="text" name="searchKeyword" value="${searchKeyword}" placeholder="검색어 입력">
    <button type="submit">검색</button>
</form>

<!-- 문의 리스트 테이블 -->
<table>
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>문의일</th>
            <th>처리상태</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="qna" items="${qnaList}">
            <tr>
                <!-- 번호 -->
                <td>${qna.uqna_idx}</td>

                <!-- 제목 -->
                <td>
                    <a href="/admin/qna/${type}/${qna.uqna_idx}">${qna.uqna_title}</a>
                </td>

                <!-- 문의일 -->
                <td>${qna.uqna_wdate}</td>

                <!-- 처리상태 -->
                <td>
                    <c:choose>
                        <c:when test="${qna.uqna_stat == 1}">처리완료</c:when>
                        <c:otherwise>대기중</c:otherwise>
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

<%@ include file="../common/footer.jsp" %>
