<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EATS - LOGIN</title>
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<script>
function checkForm(){
	var inputId=document.getElementById('userId').value;
	var inputPwd=document.getElementById('userPwd').value;
	
	var valid=true;
	
	if(inputId===null || inputId===''){
		valid=false;
	}
	if(inputPwd===null || inputPwd===''){
		valid=false;
	}
	return valid;
}
</script>
<!-- noto sans kr font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/user/userLoginCss.css">
</head>
<body>
<div class="empty">
	<img src="/img/user/girl.png" style="max-height: 500px;">
	<h1>WELCOME</h1>
	<!-- <img src="/img/user/chef.png" style="height: 300px; position: absolute; top: 30%; left: 20%;"> -->
	<img src="/img/user/boy.png" style="position: absolute; bottom: 0; right: 34.3%; max-height: 500px;">
</div>
<div data-aos="zoom-in" style="width:40%;">
<form name="user_login_form" id="user_login_form" onsubmit="return checkForm()" action="/user/login" method="post">
	<div class="login-wrapper">
		<div class="logo-wrapper">
			<a href="/"><img src="/svg/logo_icon_red.svg"></a>
		</div>
		<div class="text-wrapper">
			<input type="text" name="userId" id="userId" placeholder="아이디" value="${cookie.saveId.value }">
			<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호">
		</div>
		<div class="saveId-wrapper">
			<input type="checkbox" name="saveId" value="on" ${empty cookie.saveId?'':'checked'}>
			<p>&nbsp;아이디 저장</p>
		</div>
		<div class="button-wrapper">
			<input type="submit" value="로그인" id="button-login">
			<input type="button" value="카카오로 로그인" id="button-kakao" onclick="location.href='/user/kakaoLogin'">
		</div>
		<div class="findAcc-wrapper">
			<a href="/user/findId">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/user/findPwd">비밀번호 찾기</a>
		</div>
	</div>
	<input type="hidden" name="callback" value="${callback }">
</form>
</div>
<script> 
	AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
</script>
</body>
</html>