<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세보기</title>
    <link rel="stylesheet" href="/css/manager/noticeDetailCss.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>공지사항 상세보기</h1>
        </header>
        <div class="content">
            <div class="action-buttons-top">
                <a href="/admin/notice/edit/${notice.ntc_idx}" class="btn btn-edit">수정</a>
                <a href="/admin/notice/delete/${notice.ntc_idx}" onclick="return confirm('정말 삭제하시겠습니까?')" class="btn btn-delete">삭제</a>
            </div>
            <div class="title-box">
                <label>제목</label>
                <div class="title">${notice.ntc_title}</div>
            </div>
            <div class="content-box">
                <label>본문</label>
                <div class="content-text">${notice.ntc_content}</div>
            </div>
        </div>
        <footer>
            <div class="center-button">
                <a href="/admin/notice" class="btn btn-back">목록으로</a>
            </div>
        </footer>
    </div>
</body>
</html>

