<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<style>
body{
	font-family: "Noto Sans KR", sans-serif;
	margin:100px auto;
}

.store-findid {
    max-width: 400px;
    margin: 20px auto;
    padding: 20px;
    font-family: Arial, sans-serif;
}

.div2 {
    text-align: center;
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 15px;
}

.div3 {
    text-align: center;
    color: #666;
    font-size: 14px;
    margin-bottom: 30px;
}

.rectangle-3,
.rectangle-4 {
    margin-bottom: 15px;
}

input[type="password"] {
    width: 100%;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 14px;
    box-sizing: border-box;
      background-color: #DAF0FF;
}

input[type="password"]::placeholder {
    color: #999;
}

input[type="submit"] {
    width: 100%;
    padding: 15px;
    background-color: #349FFB;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    margin-top: 20px;
}

input[type="submit"]:hover {
    opacity: 0.9;
}

#message {
    font-size: 12px;
    color: red;
    margin: 10px 0;
    padding-left: 5px;
    min-height: 20px;
}

/* 비밀번호 입력 필드 포커스 효과 */
input[type="password"]:focus {
    outline: none;
    border-color: #4B89FF;
    box-shadow: 0 0 0 2px rgba(75, 137, 255, 0.1);
}

/* 에러 상태의 입력 필드 */
input[type="password"].error {
    border-color: #ff4b4b;
}

</style>
</head>
<body>

	<form name="storeUpdatePwdOk" action="storeUpdatePwdOk" method="post" onsubmit="return PwdCheck();">

		<div class="store-findid">
			<div class="div2">비밀번호 재설정</div>
			<div class="div3">새로운 비밀번호를 입력해주세요.</div>
			<div class="rectangle-3">
				<input type="password" name="newPwd" id="newPwd" placeholder="새 비밀번호를 입력해주세요.">
			</div>
			<div class="rectangle-4">
				<input type="password" name="newPwdCf" id="newPwdCf" placeholder="새 비밀번호를 확인해주세요.">
			</div>
			<div id="message"></div>
			

			<div class="rectangle-5">
				<input type="submit" value="비밀번호 재설정">
			</div>


		</div>
	</form>

	<script>
		function PwdCheck() {
			var newPwd = document.getElementById('newPwd').value;
			var newPwdCf = document.getElementById('newPwdCf').value;

			if (newPwd === null || newPwd.trim() === ""){
				document.getElementById('message').textContent = '비밀번호를 입력해주세요.';
				return false;
			}
			if (newPwd !== newPwdCf) {
				document.getElementById('message').textContent = '비밀번호가 일치하지 않습니다.';
				return false; // 폼 제출을 중지
			} else {
				document.getElementById('message').textContent = '비밀번호가 일치합니다.';
				return true; // 폼 제출 허용
			}
		}
	</script>

</body>
</html>