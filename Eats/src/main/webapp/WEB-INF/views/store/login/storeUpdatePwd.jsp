<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<style>
.store-findid {
	display: flex; /* Flexbox 사용 */
	flex-direction: column; /* 세로 방향으로 정렬 */
	align-items: center; /* 수평 중앙 정렬 */
	justify-content: center; /* 수직 중앙 정렬 */
	height: 100vh; /* 화면 전체 높이 */
	background: #ffffff; /* 배경색 */
}

.rectangle-3, .rectangle-4, .rectangle-5 {
	background: var(--color-6, #daf0ff);
	border-radius: 10px;
	border: 1px solid rgba(117, 117, 117, 0.29);
	width: 548.32px;
	margin: 10px 0; /* 각 입력 필드 사이에 간격 추가 */
}

.rectangle-3 input, .rectangle-4 input, .rectangle-5 input {
	width: 100%;
	height: 100%;
	border: none;
	border-radius: 10px;
	padding: 10px;
	font-size: 16px;
	background: transparent;
	outline: none;
}

.rectangle-5 input {
	background-color: #349ffb;
	color:#fff;
	height:60px;
}
/* Placeholder 스타일 */
.rectangle-3 input::placeholder, .rectangle-4 input::placeholder {
	color: #ccc;
}

#message {
	margin-top: 5px; /* 메시지와 입력 필드 간의 간격 */
	font-size: 13px;
	color: red;
	text-align: left; /* 왼쪽 정렬 */
}

.div2 {
	color: #000000;
	text-align: center; /* 중앙 정렬 */
	font-family: "NotoSansKr-Medium", sans-serif;
	font-size: 36px;
	font-weight: 500;
	margin-top: 20px; /* 제목과 입력 필드 사이 간격 */
}

.div3 {
	color: #000000;
	text-align: center; /* 중앙 정렬 */
	font-family: "NotoSansKr-Medium", sans-serif;
	font-size: 20px;
	font-weight: 500;
	margin-top: 10px; /* 설명 텍스트와 입력 필드 사이 간격 */
}
</style>
</head>
<body>

	<form name="storeUpdatePwd" action="storeUpdatePwd" method="post"
		onsubmit="return PwdCheck();">

		<div class="store-findid">
			<div class="div2">비밀번호 재설정</div>
			<div class="div3">새로운 비밀번호를 입력해주세요.</div>
			<div class="rectangle-3">
				<input type="password" name="newPwd" id="newPwd"
					placeholder="새 비밀번호를 입력해주세요.">
			</div>
			<div class="rectangle-4">
				<input type="password" name="newPwdCf" id="newPwdCf"
					placeholder="새 비밀번호를 확인해주세요.">
			</div>
			<div id="message">메시지</div>
			<!-- 여기에 메시지 위치 -->

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