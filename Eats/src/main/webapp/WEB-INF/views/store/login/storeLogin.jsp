<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: "Noto Sans KR", sans-serif;
}

#store_login_form {
	width: 50%;
	margin: 100px auto;
}

.login-wrapper {
	width: 100%;
	margin: auto;
	text-align: center;
}

.logo-wrapper {
	width: 20%;
	margin: 20px auto;
}

.logo-wrapper img {
	width: 150px;
}

.text-wrapper {
	width: 50%;
	margin: auto;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.text-wrapper input {
	width: 95%;
	margin-top: 20px;
	background-color: #DAF0FF;
	border: 1px solid gray;
	height: 30px;
	border-radius: 5px;
	padding: 10px 5px 10px 10px;
	color: black;
}

.saveId-wrapper {
	margin: auto;
	width: 50%;
	display: flex;
	flex-direction: row;
}

.button-wrapper {
	display: flex;
	flex-direction: column;
	width: 50%;
	margin: auto;
}

#button-login {
	font-size: 15px;
	padding: 20px 0px;
	margin: 10px 0px;
	border-radius: 5px;
	border: 0;
	font-family: "Noto Sans KR", sans-serif;
}

#button-login {
	background-color: #349FFB;
	color: #FFF8EB;
}

.findAcc-wrapper {
	text-align: center;
	margin-top: 20px;
	color: gray;
}

.findAcc-wrapper a {
	text-decoration: none;
	color: gray;
}

.findAcc-wrapper a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>


	<form name="store_login_form" id="store_login_form" action="storeLogin"
		method="post">

		<%-- <div class="store-login">
  <div class="rectangle-3"></div>
  <div class="rectangle-4"></div>
  <div class="rectangle-6"></div>
  <div class="rectangle-5"></div>
  <div><input type="submit" value="로그인하기" class="div"></div>
  <div class="div2"><a href="/storeFindIdPage">아이디 찾기</a> | <a href="/storeFindPwdPage">비밀번호 찾기</a></div>
  <div class="div3">
  <input type="checkbox" name="check" <c:if test="${!empty cookie.saveid}">checked</c:if>>
  아이디 저장</div>
  <div class="div4">매장회원 로그인</div>
  <input type="text" name="store_id" id="store_id" class="div5" placeholder="아이디를 입력해주세요." value="${cookie.saveid.value}">
  <input type="password" name="store_pwd" id="store_pwd" class="div6" placeholder="비밀번호를 입력해주세요.">
  <img class="clip-path-group" src="img/store_logo.png"/>
</div> --%>


		<div class="login-wrapper">
			<div class="logo-wrapper">
				<a href="/"><img src="/img/store_logo.png"></a>
			</div>
			<div class="text-wrapper">
				<input type="text" name="store_id" id="store_id"
					placeholder="아이디를 입력해주세요." value="${cookie.saveid.value}">
				<input type="password" name="store_pwd" id="store_pwd"
					placeholder="비밀번호를 입력해주세요.">
			</div>
			<div class="saveId-wrapper">
				<input type="checkbox" name="check"
					<c:if test="${!empty cookie.saveid}">checked</c:if>> 아이디 저장
			</div>
		</div>
		<div class="button-wrapper">
			<input type="submit" value="로그인" id="button-login">

		</div>
		<div class="findAcc-wrapper">
			<a href="/storeFindIdPage">아이디 찾기</a> &nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="/storeFindPwdPage">비밀번호 찾기</a>
		</div>
		<div>
			
		</div>
	</form>
</body>
</html>