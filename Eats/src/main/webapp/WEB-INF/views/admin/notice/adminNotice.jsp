<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 관리</title>
    <link rel="stylesheet" href="<c:url value='/css/manager/noticeCss.css'/>">
</head>
<body>
    <div class="container">
        <h2>공지사항 관리</h2>
        <table class="custom-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>상세보기</th>
                </tr>
            </thead>
            <tbody>
                <!-- 공지사항 목록 반복 출력 -->
                <c:forEach var="notice" items="${noticeList}">
                    <tr>
                        <td>${notice.ntc_idx}</td>
                        <td>${notice.ntc_title}</td>
                        <td>관리자</td> <!-- 작성자 하드코딩 -->
                        <td>${notice.ntc_wdate}</td>
                        <td>0</td> <!-- 조회수 하드코딩 -->
                        <td>
                            <a href="noticeDetail.do?id=${notice.ntc_idx}" class="custom-btn">상세보기</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="pagination">
            <ul>
                <!-- 페이지네이션 구현 -->
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="<c:if test='${currentPage == i}'>active</c:if>'">
                        <a href="noticeList.do?page=${i}">${i}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="button-container">
            <a href="noticeWrite.do" class="write-btn">글쓰기</a>
        </div>
    </div>
</body>
</html>
