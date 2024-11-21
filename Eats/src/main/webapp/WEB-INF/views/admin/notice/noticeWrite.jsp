<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
<link rel="stylesheet" href="/css/manager/noticeWriteCss.css">

</head>
<body>
<div class="container">
    <h1>공지사항 작성</h1>
    <form action="/admin/notice/save" method="post">
        <div class="form-group">
            <label for="ntc_title">제목</label>
            <input type="text" id="ntc_title" name="ntc_title" placeholder="공지사항 제목을 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="ntc_content">내용</label>
            <textarea id="ntc_content" name="ntc_content" placeholder="공지사항 내용을 입력하세요" required></textarea>
        </div>
        <div class="form-group">
            <label for="ntc_stat">상태</label>
            <select id="ntc_stat" name="ntc_stat" required>
                <option value="1">활성</option>
                <option value="0">비활성</option>
            </select>
        </div>
        <div class="button-group">
            <button type="submit" class="btn_save">저장</button>
            <a href="/admin/notice" class="btn_cancel">취소</a>
        </div>
    </form>
</div>
</body>
</html>
