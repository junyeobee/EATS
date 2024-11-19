<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EATS - SHOW USER'S ID</title>
<script>
document.addEventListener('DOMContentLoaded', function(){
	var user_id='${sessionScope.userId}';
	if(!user_id || user_id===null || user_id ===''){
		alert('잘못된 접근입니다.');
		location.href='/';
	}
});
</script>
</head>
<!-- noto sans kr font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/user/showIdCSS.css">
<body>
<div class="id-show-wrapper">
	<div class="logo-wrapper">
		<a href="/"><img src="img/eats_logo.png"></a>
	</div>
	<div class="id-wrapper">
		<p>아이디는</p>
		<div class="id-content-wrapper">
		<span>"</span><h1>${userId }</h1><span class="last-span">"</span>
		</div>
		<p>입니다</p>
	</div>
	<div class="link-wrapper">
		<input type="button" value="로그인" onclick="location.href='/user/login'">
		<a href="/user/findPwd">비밀번호도 잊으셨나요?</a>
	</div>
</div>
</body>
</html>