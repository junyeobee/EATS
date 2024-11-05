<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function sendCode(){
	var inputName=document.getElementById('userName').value;
	var inputEmail=document.getElementById('userEmail').value;
	
	
}
</script>
</head>
<body>
	<div class="form-wrapper">
		<table>
			<tr>
				<td><input type="text" id="userName" placeholder="이름"></td>
			</tr>
			<tr>
				<td><input type="text" id="userEmail" placeholder="이메일 예)example@naver.com"></td>
				<td><input type="button" value="인증번호 발송" onclick="sendCode();"></td>
			</tr>
			<tr>
				<td><input type="text" id="userCode"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="다음"></td>
			</tr>
		</table>
		<form name="userFindId" action="sendCode" method="post">
			<div class="name-wrapper">
				<input type="text" name="user_name" id="user_name" placeholder="이름을 입력하세요">
			</div>
			<div class="email-wrapper">
				<input type="text" name="user_email" id="user_email" placeholder="이메일을 입력하세요">
				<input type="submit" value="인증번호 발송">
			</div>
		</form>
		<form name="checkCode" action="userCheckCode" method="post">
			<div class="code-wrapper">
				<input type="text" name="user_code" id="user_code" placeholder="인증번호를 입력해주세요">
				<input type="submit" value="인증번호 확인">
			</div>
		</form>
		<div class="button-wrapper">
			<input type="button" value="아이디 찾기">
		</div>
	</div>
</body>
</html>