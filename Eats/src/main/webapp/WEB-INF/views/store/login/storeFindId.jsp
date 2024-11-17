<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#findId{
	width:60%;
	margin:100px auto;
}
h2{
text-align: center;
}
.store-findid {
	max-width: 400px;
	margin: 20px auto;
	padding: 20px;
	font-family: Arial, sans-serif;
}

.store-logo {
	text-align: center;
	margin-bottom: 40px;
}

.store-logo h1 {
	color: #4B89FF;
	font-size: 48px;
	margin: 0;
}

.store-logo span {
	color: #999;
	font-size: 24px;
}

.div4 {
	text-align: center;
	color: #666;
	margin-bottom: 30px;
	font-size: 14px;
}

.div3, .eats-email-com {
	width: 100%;
	padding: 15px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 14px;
}

.div3::placeholder, .eats-email-com::placeholder {
	color: #999;
}

input[type="submit"] {
	width: 100%;
	padding: 15px;
	background-color: #349FFB;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	margin-top: 10px;
}

input[type="submit"]:hover {
	background-color: #3570E6;
}

.id-save {
	margin: 15px 0;
}

.id-save input[type="checkbox"] {
	margin-right: 5px;
}

.bottom-links {
	text-align: center;
	margin-top: 20px;
}

.bottom-links a {
	color: #666;
	text-decoration: none;
	margin: 0 10px;
	font-size: 14px;
}

.bottom-links a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<form name="findId" id="findId" action="storeFindId" method="post">
		<div class="store-findid">
			<div class="div2"><h2>아이디 찾기</h2></div>
			<div class="div4">가입된 회원정보로 아이디를 확인하세요.</div>
			<div class="rectangle-3"></div>
			<div class="rectangle-4"></div>
			<div class="rectangle-6"></div>
			<div class="rectangle-5"></div>


			<input type="text" name="store_ceo" placeholder="이름을 입력하세요."
				class="div3"> <input type="email" name="store_email"
				placeholder="이메일 예) eats@email.com" class="eats-email-com">
			<div class="div">
				<input type="submit" value="아이디 찾기">
			</div>

		</div>
	</form>
</body>
</html>