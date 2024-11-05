<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.store-update-pwd, .store-update-pwd * {
	box-sizing: border-box;
}

.store-update-pwd {
	background: #ffffff;
	height: 1024px;
	position: relative;
	overflow: hidden;
	display: flex; /* Flexbox 사용 */
	flex-direction: column; /* 세로 방향으로 정렬 */
	align-items: center; /* 수평 중앙 정렬 */
	justify-content: center; /* 수직 중앙 정렬 */
}

.rectangle-3 {
	background: var(--color-6, #daf0ff);
	border-radius: 10px;
	border-style: solid;
	border-color: var(--gray1, rgba(117, 117, 117, 0.29));
	border-width: 1px;
	width: 548px;
	height: 69px;
	position: absolute;
	left: 447px;
	top: 344px;
}

.rectangle-4 {
	background: var(--color-6, #daf0ff);
	border-radius: 10px;
	border-style: solid;
	border-color: var(--gray1, rgba(117, 117, 117, 0.29));
	border-width: 1px;
	width: 548px;
	height: 69px;
	position: absolute;
	left: 447px;
	top: 436px;
}

.rectangle-7 {
	background: var(--color-6, #daf0ff);
	border-radius: 10px;
	border-style: solid;
	border-color: var(--gray1, rgba(117, 117, 117, 0.29));
	border-width: 1px;
	width: 548px;
	height: 69px;
	position: absolute;
	left: 448px;
	top: 528px;
}

.group-156 {
	position: absolute;
	inset: 0;
}

.rectangle-5 {
	background: #349ffb;
	border-radius: 12.83px;
	width: 548.32px;
	height: 83.73px;
	position: absolute;
	left: 447px;
	top: 641px;
}

.div {
	color: #ffffff;
	text-align: left;
	font-family: "NotoSansKr-Bold", sans-serif;
	font-size: 22.959409713745117px;
	font-weight: 700;
	position: absolute;
	left: 666px;
	top: 666px;
}

.div2 {
	color: #000000;
	text-align: left;
	font-family: "NotoSansKr-Medium", sans-serif;
	font-size: 36px;
	font-weight: 500;
	position: absolute;
	left: calc(50% - 103px);
	top: 194px;
}

.div3 {
	color: #505050;
	text-align: left;
	font-family: "NotoSansKr-DemiLight", sans-serif;
	font-size: 18px;
	font-weight: 400;
	position: absolute;
	left: 472px;
	top: 365px;
}

.eats-email-com {
	color: #505050;
	text-align: left;
	font-family: "NotoSansKr-Regular", sans-serif;
	font-size: 18px;
	font-weight: 400;
	position: absolute;
	left: 471.66px;
	top: 460px;
}

.div4 {
	color: #505050;
	text-align: left;
	font-family: "NotoSansKr-Regular", sans-serif;
	font-size: 18px;
	font-weight: 400;
	position: absolute;
	left: 472.66px;
	top: 552px;
}

.div5 {
	color: #000000;
	text-align: left;
	font-family: "NotoSansKr-Medium", sans-serif;
	font-size: 20px;
	font-weight: 500;
	position: absolute;
	left: calc(50% - 136px);
	top: 269px;
}

.frame-8 {
	background: #349ffb;
	border-radius: 11.24px;
	padding: 24.24px 191px 24.24px 191px;
	display: flex;
	flex-direction: row;
	gap: 5.91px;
	align-items: center;
	justify-content: center;
	width: 154px;
	height: 70px;
	position: absolute;
	left: 1015px;
	top: 435px;
}

.div6 {
	color: #ffffff;
	text-align: center;
	width: 100%;
	font-size: 14px;
	font-weight: 700;
	position: relative;
}

._3-00 {
	color: #ff3f3f;
	text-align: left;
	font-family: "NotoSansKr-Regular", sans-serif;
	font-size: 18px;
	font-weight: 400;
	position: absolute;
	left: 847px;
	top: 552px;
}
</style>
</head>
<body>
	
		<div class="store-update-pwd">
			<div class="rectangle-3"></div>
			<div class="rectangle-4"></div>
			<div class="rectangle-7"></div>
			<div class="rectangle-5"></div>
			<div class="div">
				<input type="submit" value="비밀번호 찾기">
			</div>
			<div class="div2">비밀번호 찾기</div>

			<form name="store_sendCode" action="store_sendCode" method="post">
				<div class="div3">
					<input type="text" name="store_id" placeholder="아이디를 입력하세요." value="${store_id}">
				</div>
				<div class="eats-email-com">
					<input type="text" name="store_email" placeholder="이메일 예) eats@email.com" value="${store_email}">
				</div>
				<div class="frame-8">
					<div class="div6">
						<input type="submit" value="인증번호 발송">
					</div>
				</div>
			</form>

			<form name="storecheckCode" action="storeCheckCode" method="post">
				<div class="div4">
					<input type="text" name="store_code" placeholder="인증번호 입력">
					<input type="submit" value="인증번호 확인">
				</div>
			</form>


			<div class="div5">이메일로 인증번호를 발송해드려요.</div>

			<div class="_3-00">남은시간(3:00)</div>
		</div>
	
</body>
</html>