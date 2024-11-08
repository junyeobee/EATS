<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<label>ID</label>
			<input type="text" id="joinId" name="joinId" placeholder="아이디 입력">
			<input type="button" value="중복체크">
		</div>
		<div>
			<label>PWD</label>
			<input type="password" id="joinPwd" name="joinPwd" placeholder="비밀번호 입력">
		</div>
		<div>
			<label>PWD 확인</label>
			<input type="password" id="checkPwd" name="checkPwd" placeholder="비밀번호 확인">
		</div>
		<div>
			<label>휴대폰</label>
			<input type="tel" id="joinTel" name="joinTel" placeholder="휴대폰 번호 입력">
		</div>
	</div>
	<div>
		<div>
			<label>닉네임</label>
			<input type="text" id="joinNick" name="joinNick" placeholder="닉네임 입력">
			<input type="button" value="중복체크">
		</div>
		<div>
			<label>이름</label>
			<input type="text" id="joinName" name="joinName" placeholder="이름 입력">
		</div>
		<div>
			<label>E-mail</label>
			<input type="text" id="joinEmail" name="joinEmail" placeholder="이메일 형식에 맞게 입력해주세요">
			<input type="button" value="인증번호 발송">
		</div>
		<div>
			<label>인증번호</label>
			<input type="text" id="checkNum" name="checkNum" placeholder="인증번호를 입력해주세요">
			<input type="button" value="인증번호 확인">
		</div>
	</div>
	<div>
		<div>
			<label>나이</label>
			<input type="text" id="joinAge" name="joinAge" placeholder="생년월일 입력">
		</div>
		<div>
			<label>성별</label>
			<section>
				<select>남성</select>
				<select>여성</select>
				<select>선택안함</select>
			</section>
		</div>
	</div>
</body>
</html>