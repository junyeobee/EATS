<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 관리</title>
    <!--  <link rel="stylesheet" href="/css/manager/noticeCss.css">-->
</head>
<body>
    <div class="main-content">
        <h1>공지사항 관리</h1>
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>상세보기</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="notice" items="${noticeList}">
                    <tr>
                        <td>${notice.ntc_idx}</td>
                        <td>${notice.ntc_title}</td>
                        <td><fmt:formatDate value="${notice.ntc_wdate}" pattern="yyyy-MM-dd" /></td>
                        <td><a href="/admin/notice/detail/${notice.ntc_idx}">보기</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="pagination">
           <!-- 이전 페이지 -->
           <c:if test="${page > 1}">
               <a href="?page=${page - 1}">&lt;</a>
           </c:if>
           <c:if test="${page <= 1}">
               <span class="disabled">&lt;</span>
           </c:if>

        <!-- 페이지 번호 -->
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${i == page}">
                    <span>${i}</span>
                </c:when>
                <c:otherwise>
                    <a href="?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <!-- 다음 페이지 -->
           <c:if test="${page < totalPages}">
               <a href="?page=${page + 1}">&gt;</a>
           </c:if>
           <c:if test="${page >= totalPages}">
               <span class="disabled">&gt;</span>
           </c:if>
       </div>

        <a href="/admin/notice/write" class="write-btn">글쓰기</a>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
