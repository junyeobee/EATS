<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eat's - 회원가입</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	.user_join_wrap {
		position: sticky;
		width: 700px;
		height: 1800px;
		margin: 0 auto;
	}
	
	.logo-wrapper img{
		width:100px;
		padding-left: 300px;
	}
	
	hr {
		border: 1.5px solid #ccc;
	}
	
	.user_join_title {
		width: 100%;
		padding-top: 10px;
	}
	
	.user_join_title p {
		text-align: center;
		letter-spacing: 0.1px;
		font-family: 'Noto Sans KR';
		font-style: normal;
		font-weight: 700;
		font-size: 28px;
		line-height: 20px;
		color: #000000;
	}
	
	.user_join_box1 {
		width: 100%;
		height: 370px;
		padding-top: 10px;
		margin-top: 50px;
		background: #FFF8EB;
	}
	
	.user_join_box2 {
		width: 100%;
		height: 370px;
		padding-top: 10px;
		margin-top: 50px;
		background: #FFF8EB;
	}
	
	.user_join_box3 {
		width: 100%;
		height: 230px;
		padding-top: 10px;
		margin-top: 50px;
		background: #FFF8EB;
	}
	
	.join_set {
		margin-top: 40px;
	}
	
	.join_left {
		flex: 190px;
		text-align: right;
	}
	
	.join_middle {
		flex: 300px;
		margin-top:5px;
		text-align: center;
	}
	
	.join_right {
		flex: 190px;
		text-align: left;
		margin-top:5px;
		margin-left: 20px;
	}
	
	.join_bot {
		height: 15px;
		text-align: center;
	}
	
	.user_join_section {
		display: flex;
		padding: 10px 10px 3px 10px;

	}
	
	.user_join_section label {
		font-family: 'Noto Sans KR';
		font-style: normal;
		font-weight: 600;
		font-size: 17px;
		line-height: 43px;
		text-align: left;
		padding-right: 30px;
		color: #000000;
	}
	
	.user_join_section input[type=text], input[type=password] {
		display: flex;
		width: 300px;
		height: 32px;
		box-sizing: border-box;
		border-radius: 2px;
		background: #FDFDFD;
		border: 1px solid rgba(175, 175, 175, 0.9);
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.25);
	}
	
	.user_join_section input[type=date], select {
		width: 200px;
		height: 32px;
		box-sizing: border-box;
		border-radius: 2px;
		background: #FDFDFD;
		border: 1px solid rgba(175, 175, 175, 0.9);
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.25);
		color: #5D5D5D;
	}
	
	.user_join_section input[type=button] {
		font-family: 'Noto Sans KR';
		font-style: normal;
		font-weight: 700;
		font-size: 14px;
		background: #FFB53C;
		border: none;
		border-radius: 10px;
		height: 30px;
		text-align: center;
		letter-spacing: 0.1px;
		color: #FFFFFF;
	}
	
	.user_noti_box {
		width: 100%;
		height: 300px;
		padding-top: 60px;
		padding-bottom: 40px;
		font-family: 'Noto Sans KR';
		font-style: normal;
		font-weight: 550;
		font-size: 14px;
		line-height: 29px;
		
		color: #000000;
	}
	
	.user_allnoti_btn {
		padding-bottom: 10px;
		margin-left: 10px;
	}
	
	.user_noti_section {
		padding-top: 10px;
		padding-bottom: 10px;
		padding-left: 10px;
		background: rgba(175, 175, 175, 0.29);
	}
	
	.user_join_btn {
		text-align: center;
	}
	
	.user_join_btn input[type=button] {
		font-family: 'Noto Sans KR';
		font-style: normal;
		font-weight: 600;
		font-size: 20px;
		background: #FFB53C;
		border: none;
		border-radius: 10px;
		width: 160px;
		height: 60px;
		letter-spacing: 0.1px;
	}
	
	.info-text {
      color: blue;
      font-size: 12px;
	}
	
	.error-text {
      color: red;
      font-size: 12px;
	}
</style>
<script>
	let authId = false;
	let authNick = false;
	let authEmail = false;
	let authTel = false;
	let ckValid = false;
	
	function checkDuplicate(type) {
		let userId = $("input[name='user_id']").val();
		let userNick = $("input[name='user_nickname']").val();
		let userTel = $("input[name='user_tel']").val();
		
		if (type == "userId" && (!userId || !isId(userId))) {
	        alert("아이디를 올바르게 입력해주세요.");
	        return;
	    }
		
	    if (type == "userNick" && (!userNick)) {
	        alert("닉네임을 올바르게 입력해주세요.");
	        return;
	    }
	    
	    if (type == "userTel" && (!userTel || !isPhoneNumber(userTel))) {
	        return;
	    }
		
		let form = {};
		form[type] = type == "userId" ? userId : type == "userNick" ? userNick : userTel;
		
		$.ajax({
			method: 'POST',
			url: 'userCheck',
			data: JSON.stringify(form),
			dataType: 'json',
			contentType:'application/json',
			success: function(result){
				if(type === "userId"){
					if(result.iresult == "1"){
						alert('이미 존재하는 아이디입니다.');
					} else {
						alert('사용 가능한 아이디입니다.');  
						authId = true;
					}
				} else if(type === "userNick"){
					if(result.nresult == "1"){
						alert('이미 존재하는 닉네임입니다.');
					} else {
						alert('사용 가능한 닉네임입니다.');  
						authNick = true;
					}
				} else if(type === "userTel"){
					if(result.tresult == "1"){
						alert('이미 존재하는 휴대폰입니다.');
					} else {
						authTel = true;
					}
				}
				
			},
			error:function(){   
				alert('서버 오류로 실패했습니다. 다시 시도해주세요.');
			}
		})
	}
	
	function checkId() {
		checkDuplicate("userId");
	}
	
	function checkNick() {
	    checkDuplicate("userNick");
	}
	
	function checkJoin() {
	    checkDuplicate("userTel");
	    
	    let joinId = $("input[name='user_id']").val();
	    let joinPwd = $("input[name='user_pwd']").val();
	    let ckPwd = $("input[name='checkPwd']").val();
	    let joinTel = $("input[name='user_tel']").val();
	    let joinNick = $("input[name='user_nickname']").val();
	    let joinName = $("input[name='user_name']").val();
	    let joinEmail = $("input[name='user_email']").val();
	    let joinBirth = $("input[name='user_birth']").val();
	    
	    if(!joinId || !joinPwd || !ckPwd || !joinTel || !joinNick || !joinName || !joinEmail || !joinBirth){
	    	 alert("모든 회원 정보를 채워주세요.");
	    	 return;
	    } else if(!authId){
	    	alert("아이디 중복 여부를 확인해주세요.");
	    	return;
	    } else if(!isPwd(joinPwd)){
	    	alert("비밀번호를 올바르게 입력해주세요.");
	    	return;
	    } else if(ckPwd != joinPwd){
	    	alert("비밀번호를 확인해주세요.");
	    	return;
	    } else if(!isPhoneNumber(joinTel)){
	    	alert("휴대폰 번호를 올바르게 입력해주세요.");
	    	return;
	    } else if(!authTel){
	    	return;
	    } else if(!authNick){
	    	alert("닉네임 중복 여부를 확인해주세요.");
	    	return;
	    } else if(!authEmail){
	    	alert("이메일 인증 완료 여부를 확인해주세요.");
	    	return;
	    } else if(!ckValid){
	    	alert("이용약관에 동의해주세요.");
	    	return;
	    } else {
	    	 $("input[name='checkPwd']").attr("disabled",true); 
	    	 $("input:checkbox").attr("disabled",true); 
	    	 $("#user_join_form").submit();
	    }
	    
	}
	
	let validCode = null;
	let validTime = 300;
	let timerInterval = null;
	
	function checkEmail() {
		let userEmail = $("input[name='user_email']").val();
		let checkNum = $("input[name='checkNum']");
		
		if (!userEmail || !isEmail(userEmail)) {
	        alert("유효한 이메일을 입력해주세요.");
	        return;
	    }
		
		clearInterval(timerInterval);
		validTime = 300;
	    $("#timeLeft").html("5:00");
	    $("#timeLeft").attr("class","error-text");
		
		$.ajax({
			method: 'POST',
            url: '/sendEcode',  
            contentType: 'application/json',
            data: JSON.stringify({ userEmail: userEmail }),
            dataType: 'json',
            success: function(result) {
                if (result.status === 'success') {
                    alert('인증번호가 이메일로 발송되었습니다.');
                    validCode = result.code;
                    startTimer();
                } else {
                    alert('이메일 발송에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
            	console.log("AJAX Error:");
                console.log("Status: " + xhr.status);  
                console.log("Status Text: " + xhr.statusText);  
                console.log("Response: " + xhr.responseText); 
                alert('서버와 연결에 문제가 발생했습니다.');
            }
        })   
	}
	
	function startTimer() {
	    timerInterval = setInterval(function() {
	        if (validTime <= 0) {
	            clearInterval(timerInterval);
	            $("#timeLeft").html("5:00");
	            $("#timeLeft").attr("class","error-text");
	            alert("인증 시간이 만료되었습니다. 다시 인증을 요청해주세요.");
	            validCode = null;
	            $("#email_check").attr("disabled", false); 
	        } else {
	            let minutes = Math.floor(validTime / 60);
	            let seconds = validTime % 60;
	            $("#timeLeft").html(minutes + ":" + (seconds < 10 ? '0' + seconds : seconds));
	            $("#timeLeft").attr("class","error-text");
	            validTime--;
	        }
	    }, 1000);
	}
	
	function checkCode() {
		let checkNum = $("input[name='checkNum']");
		
		if (!validCode) {
	        alert("인증번호가 발송되지 않았습니다. 먼저 이메일 인증을 요청해주세요.");
	        return;
	    }
		
		if(validCode == checkNum.val()){
			alert('인증에 성공하였습니다.');
			checkNum.attr("disabled",true); 
			$("input[name='email_check']").attr("disabled",true); 
			$("input[name='check_code']").attr("disabled",true); 
			$("#timeLeft").html("");
			clearInterval(timerInterval);
			authEmail = true;
		} else{
			alert('인증에 실패하였습니다. 다시 인증해주세요.');
			$("#email_check").attr("disabled", false);
	        clearInterval(timerInterval); 
	        $("#timeLeft").html("5:00");  
	        $("#timeLeft").attr("class","error-text");
	        validCode = null;
		}
	}
	
	function noti_check() {
		var allck = document.getElementById("check_all");
		var ck1 = document.getElementById("check_1");
		var ck2 = document.getElementById("check_2");
		var ck3 = document.getElementById("check_3");
		var ck4 = document.getElementById("check_4");
		var ck5 = document.getElementById("check_5");
		
		ck1.checked = allck.checked;
        ck2.checked = allck.checked;
        ck3.checked = allck.checked;
        ck4.checked = allck.checked;
        ck5.checked = allck.checked;
        
        if(allck.checked) ckValid = true;
	}
	
	function noti_indicheck() {
        var allck = document.getElementById("check_all");
        var ck1 = document.getElementById("check_1");
        var ck2 = document.getElementById("check_2");
        var ck3 = document.getElementById("check_3");
        var ck4 = document.getElementById("check_4");
		var ck5 = document.getElementById("check_5");

        allck.checked = ck1.checked && ck2.checked && ck3.checked && ck4.checked && ck5.checked;
        
        if(ck1.checked && ck2.checked && ck3.checked && ck4.checked || allck.ckehcked) ckValid = true;
        
    }
</script>
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
		<input type="button" id="join_auth" name="join_auth" onclick="checkJoin();" value="가입하기">
	</div>
</div>
</form>
</body>
</html>
<script>
	// 아이디 정규식
	function isId(ivalue) {
		let regExp = /^[a-z][a-z0-9]{3,13}$/;
		
		return regExp.test(ivalue);
	}
	
	// 비밀번호 정규식
	function isPwd(pvalue) {
		let regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
		
		return regExp.test(pvalue);
	}
	
	// 전화번호 정규식
	function isPhoneNumber(pnValue) {
		let cleanPhoneNumber = pnValue.replace(/-/g, '');
		let regExp = /^01(?:0|1|[6-9])(?:\d{7}|\d{8})$/;
	 
		return regExp.test(cleanPhoneNumber);
	}
	
	// 이메일 정규식
	function isEmail(eValue) {
		let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
		return regExp.test(eValue);
	}
</script>
<script>
	// 하이픈 번호 10자리일때 수정
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