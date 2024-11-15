<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eat's - 관리자 로그인</title>
</head>
<body>
<form id="admin_login_form" name="admin_login_form" action="adminLogin" method="post">
	<div class="login-wrapper">
		<div class="logo-wrapper">
			<a href="/"><img src="/img/eats_logo.png"></a>
		</div>
		<div class="login-title">관리자</div>
		<div class="text-wrapper">
			<input type="text" id="adminId" name="adminId" placeholder="아이디">
			<input type="password" id="adminPwd" name="adminPwd" placeholder="비밀번호">
		</div>
		<div class="button-wrapper">
			<input type="submit" id="button-login" value="로그인">
		</div>
	</div>
</form>
</body>
</html>