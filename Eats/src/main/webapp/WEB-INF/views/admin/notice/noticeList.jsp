<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/layout_component/header.jsp" %> <!-- 공통 헤더 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 관리</title>
    <link rel="stylesheet" href="../css/manager/headerCss.css"> <!-- 헤더 CSS -->
    <link rel="stylesheet" href="../css/manager/navigationCss.css"> <!-- 네비게이션 CSS -->
    <link rel="stylesheet" href="/css/manager/noticeCss.css"> <!-- 공지사항 CSS -->
</head>
<body>
    <!-- 전체 레이아웃 컨테이너 -->
    <div class="layout">
        <%@ include file="/layout_component/navigation.jsp" %> <!-- 공통 네비게이션 -->

        <!-- 메인 컨텐츠 -->
        <div class="main-content">
            <h1>공지사항 관리</h1>

            <!-- 숨겨진 입력 필드 (Form 데이터 전송용) -->
            <form id="noticeActionForm" method="post">
                <input type="hidden" name="ntc_idx" id="ntc_idx" value="">
                <input type="hidden" name="action_type" id="action_type" value="">
            </form>

            <!-- 공지사항 테이블 -->
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
                    <c:if test="${empty noticeList}">
                        <tr>
                            <td colspan="4" align="center">공지사항이 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:if test="${!empty noticeList}">
                        <c:forEach var="notice" items="${noticeList}">
                            <tr>
                                <td>${notice.ntc_idx}</td>
                                <td>${notice.ntc_title}</td>
                                <td><fmt:formatDate value="${notice.ntc_wdate}" pattern="yyyy-MM-dd" /></td>
                                <td>
                                    <!-- 상세보기 버튼 -->
                                    <input type="button" class="btn_gray" value="상세보기" 
                                        onclick="location.href='/admin/notice/detail/${notice.ntc_idx}'">
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>

            <!-- 페이지네이션 -->
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

            <!-- 공지사항 작성 버튼 -->
            <a href="/admin/notice/write" class="write-btn">글쓰기</a>
        </div>
    </div>

    <script src="../js/adminScript.js"></script> <!-- 스크립트 추가 -->
</body>
</html>
