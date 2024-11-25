<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eat's - 회원가입</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/user/userJoinCss.css">
<script src="../js/userJoin.js"></script>
</head>
<body>
<form id="user_join_form" name="user_join_form" action="userJoin" method="post">
<div class="user_join_wrap">
	<div class="logo-wrapper">
		<a href="/"><img src="/img/eats_logo.png"></a>
		<hr>
	</div>
	<div class="user_join_title"><p>회 원 가 입</p></div>
	<div class="user_join_box1">
		<div class="join_set">
			<div class="user_join_section">
				<div class="join_left">
					<label>ID</label>
				</div>
				<div class="join_middle">
					<input type="text" id="user_id" name="user_id" placeholder="아이디 입력">
				</div>
				<div class="join_right">
					<input type="button" id="id_check" name="id_check" onclick="checkId();" value="중복체크">
				</div>
			</div>
			<div class="join_bot">
				<div class="id_regExp" id="id_regExp"></div>
			</div>
			<div class="user_join_section">
				<div class="join_left">
					<label>PWD</label>
				</div>
				<div class="join_middle">
					<input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호 입력">
				</div>
				<div class="join_right"></div>
			</div>
			<div class="join_bot">
				<div class="pwd_regExp" id="pwd_regExp"></div>
			</div>
			<div class="user_join_section">
				<div class="join_left">	
					<label>PWD 확인</label>
				</div>
				<div class="join_middle">
					<input type="password" id="checkPwd" name="checkPwd" placeholder="비밀번호 확인">
				</div>
				<div class="join_right"></div>
			</div>
			<div class="join_bot">
				<div class="pwd_check" id="pwd_check"></div>
			</div>
			<div class="user_join_section">
				<div class="join_left">	
					<label>휴대폰</label>
				</div>
				<div class="join_middle">
					<input type="text" id="user_tel" name="user_tel" maxlength="13" placeholder="휴대폰 번호 입력" onkeyup="autoHyphen(value)">
				</div>
				<div class="join_right"></div>
			</div>
		</div>
	</div>
	<div class="user_join_box2">
		<div class="join_set">
			<div class="user_join_section">
				<div class="join_left">	
					<label>닉네임</label>
				</div>
				<div class="join_middle">
					<input type="text" id="user_nickname" name="user_nickname" placeholder="닉네임 입력">
				</div>
				<div class="join_right">
					<input type="button" id="nick_check" name="nick_check" onclick="checkNick();" value="중복체크">
				</div>
			</div>
			<div class="join_bot"></div>
			<div class="user_join_section">
				<div class="join_left">
					<label>이름</label>
				</div>
				<div class="join_middle">
					<input type="text" id="user_name" name="user_name" placeholder="이름 입력">
				</div>
				<div class="join_right"></div>
			</div>
			<div class="join_bot"></div>
			<div class="user_join_section">
				<div class="join_left">
					<label>E-mail</label>
				</div>
				<div class="join_middle">
					<input type="text" id="user_email" name="user_email" placeholder="이메일 형식에 맞게 입력해주세요">
				</div>
				<div class="join_right">
					<input type="button" id="email_check" name="email_check" onclick="checkEmail();" value="인증번호 발송">
				</div>
			</div>
			<div class="join_bot"></div>
			<div class="user_join_section">
				<div class="join_left">
					<label>인증번호</label>
				</div>
				<div class="join_middle">
					<input type="text" id="checkNum" name="checkNum" placeholder="인증번호를 입력해주세요">
					<span id="timeLeft"></span>
				</div>
				<div class="join_right">
					<input type="button" id="check_code" name="check_code" onclick="checkCode();" value="인증번호 확인">
				</div>
			</div>
		</div>
	</div>
	<div class="user_join_box3">
		<div class="join_set">
			<div class="user_join_section">
				<div class="join_left">
					<label>나이</label>
				</div>
				<div class="join_middle">
					<input type="date" id="user_birth" name="user_birth" min="1900-01-01">
				</div>
				<div class="join_right"></div>
			</div>
			<div class="join_bot"></div>
			<div class="user_join_section">
				<div class="join_left">
					<label>성별</label>
				</div>
				<div class="join_middle">
				<select name="user_gender">
					<option value="0">성별 선택</option>
					<option value="1">남성</option>
					<option value="2">여성</option>
					<option value="0">선택안함</option>
				</select>
				</div>
				<div class="join_right"></div>
			</div>
		</div>
	</div>
	<div class="user_noti_box">
		<div class="user_allnoti_btn">
			<input type="checkbox" id="check_all" onclick="noti_check();"><span> 전체동의</span>
		</div>
		<div class="user_noti_section">
			<p><input type="checkbox" id="check_1" onclick="noti_indicheck();"> [필수] 만 14세 이상입니다.</p>
			<p><input type="checkbox" id="check_2" onclick="noti_indicheck();"> [필수] Eat's 이용 약관 동의</p>
			<p><input type="checkbox" id="check_3" onclick="noti_indicheck();"> [필수] 개인정보 수집 및 이용 약관 동의</p>
			<p><input type="checkbox" id="check_4" onclick="noti_indicheck();"> [필수] 개인정보 제 3자 제공 동의</p>
			<p><input type="checkbox" id="check_5" onclick="noti_indicheck();"> [선택] 마케팅 이용 동의</p>
		</div>
	</div>
	<div class="user_join_btn">
		<input type="hidden" id="join_method" name="join_method" value="NORMAL">
		<input type="button" id="join_auth" name="join_auth" onclick="checkJoin();" value="가 입 하 기">
	</div>
</div>
</form>
</body>
</html>
<script>
	const autoHyphen = (number) => {
	    number = number.replace(/[^0-9]/g, '');
	    let temp = '';
	    if (number.length < 4) {
	      temp = number;
	    } else if (number.length < 8) {
	      temp += number.substr(0, 3);
	      temp += '-';
	      temp += number.substr(3, 4);
	    } else if (number.length < 12) {
	      temp += number.substr(0, 3);
	      temp += '-';
	      temp += number.substr(3, 4);
	      temp += '-';
	      temp += number.substr(7);
	    }
	    const PHONE_NUMBER_WITH_HYPHEN = temp;
	    const PHONE_INPUT_BOX = document.querySelector('#user_tel');
	    PHONE_INPUT_BOX.value = PHONE_NUMBER_WITH_HYPHEN;
	    PHONE_INPUT_BOX.setAttribute('value', PHONE_NUMBER_WITH_HYPHEN);
	  };
	  
	  let mdate = new Date();
	  mdate.setDate(mdate.getDate());
	  let mdateStr = mdate.toISOString().split('T')[0];
	  $("input[name=user_birth]").prop("max", mdateStr);
</script>
<script>
	let inputId = $("input[name='user_id']");
	let altId = $("#id_regExp");
	let inputPwd = $("input[name='user_pwd']");
	let altPwd = $("#pwd_regExp");
	let checkPwd = $("input[name='checkPwd']");
	let altpCheck = $("#pwd_check");
	
	inputId.on('input', function () {
		if(inputId.val() === "") {
			altId.html('');
		} else if(inputId.val().trim != "" && !isId(inputId.val())){
			altId.html('4~20자의 영문/숫자 조합으로 입력해주세요.');
			altId.addClass("error-text");
			altId.removeClass("info-text");
		} else if(isId(inputId.val())) {
			altId.html('올바른 아이디 형식입니다.');
			altId.addClass("info-text");
			altId.removeClass("error-text");
		} 
	});
	
	inputPwd.on('input', function () {
		if(inputPwd.val() === "") {
			altPwd.html('');
		} else if(inputPwd.val().trim != "" && !isPwd(inputPwd.val())){
			altPwd.html('8자리 이상 20자리 이하의 영문/숫자/특수문자 조합으로 입력해주세요.');
			altPwd.addClass("error-text");
			altPwd.removeClass("info-text");
		} else if(isPwd(inputPwd.val())) {
			altPwd.html('올바른 비밀번호 형식입니다.');
			altPwd.addClass("info-text");
			altPwd.removeClass("error-text");
		} 
	});
	
	checkPwd.on('input', function () {
		if(checkPwd.val() === "") {
			altpCheck.html('');
		} else if(checkPwd.val() !== inputPwd.val()){
			altpCheck.html('위의 비밀번호와 일치하지 않습니다.');
			altpCheck.addClass("error-text");
			altpCheck.removeClass("info-text");
		} else if(checkPwd.val() === inputPwd.val()) {
			altpCheck.html('위의 비밀번호와 일치합니다.');
			altpCheck.addClass("info-text");
			altpCheck.removeClass("error-text");
		} 
	});
</script>