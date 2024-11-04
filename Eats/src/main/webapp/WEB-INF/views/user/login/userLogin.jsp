<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#user_login_form{
	width:50%;
	margin:200px auto;
}
.login-wrapper{
	width:100%;
	margin:auto;
	text-align:center;
}
.logo-wrapper{
	width:20%;
	margin:20px auto;
}
.logo-wrapper img{
	width:100%;
}
.text-wrapper{
	width: 50%;
    margin: auto;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.text-wrapper input{
	width:95%;
    margin-top: 20px;
    background-color: #FFF8EB;
    border: 1px solid gray;
    height: 30px;
    border-radius: 5px;
    padding: 10px 5px 10px 10px;
    color: #1E1E1E;
}
.saveId-wrapper{
	margin: auto;
    width: 50%;
    display: flex;
    flex-direction: row;
}
.button-wrapper{
	display: flex;
    flex-direction: column;
    width: 50%;
    margin: auto;
}
#button-login, #button-kakao{
    font-size: 15px;
    padding: 20px 0px;
    margin: 10px 0px;
    border-radius: 5px;
    border: 0;
}
#button-login{
	background-color:#FFB53C;
	color:#FFF8EB;
}
#button-kakao{
	box-shadow: 0 0 0 1px #FFB53C inset;
	background-color:#FFF8EB;
}
.findAcc-wrapper{
	text-align:center;
	margin-top:20px;
	color:gray;
}
.findAcc-wrapper a{
	text-decoration:none;
	color:gray;
}
.findAcc-wrapper a:hover{
	text-decoration:underline;
}
</style>
</head>
<body>
<form name="user_login_form" id="user_login_form" action="userLogin" method="post">
	<div class="login-wrapper">
		<div class="logo-wrapper">
			<img src="/img/eats_logo.png">
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
			<input type="button" value="카카오로 로그인" id="button-kakao">
		</div>
		<div class="findAcc-wrapper">
			<a href="#">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">비밀번호 찾기</a>
		</div>
	</div>
</form>
</body>
</html>