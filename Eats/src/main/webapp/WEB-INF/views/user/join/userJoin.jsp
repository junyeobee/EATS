<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eat's - 회원가입</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
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
						authTel = false;
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
	    let joinPwd = $("input[name='checkPwd']").val();
	    let joinTel = $("input[name='user_tel']").val();
	    let joinNick = $("input[name='user_nickname']").val();
	    let joinName = $("input[name='user_name']").val();
	    let joinEmail = $("input[name='user_email']").val();
	    let joinBirth = $("input[name='user_birth']").val();
	    
	    if(!joinId || !joinPwd || !joinTel || !joinNick || !joinName || !joinEmail || !joinBirth){
	    	 alert("모든 회원 정보를 채워주세요.");
	    	 return;
	    } else if(!authId){
	    	alert("아이디 중복 여부를 확인해주세요.");
	    	return;
	    } else if(!isPwd(joinPwd)){
	    	alert("비밀번호를 올바르게 입력해주세요.");
	    	return;
	    } else if(!isPhoneNumber(joinTel)){
	    	alert("휴대폰 번호를 올바르게 입력해주세요.");
	    	return;
	    } else if(!authTel){
	    	alert('이미 존재하는 휴대폰입니다.');
	    	return;
	    } else if(!authNick){
	    	alert("닉네임 중복 여부를 확인해주세요.");
	    	return;
	    } else if(!authEmail){
	    	alert("이메일 인증 완료 여부를 확인해주세요.");
	    	return;
	    } else {
	    	 $("input[name='user_pwd']").attr("disabled",true); 
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
</script>
</head>
<body>
<form id="user_join_form" name="user_join_form" action="userJoin" method="post">
	<div class="user-join">
		<div>
			<label>ID</label>
			<input type="text" id="user_id" name="user_id" placeholder="아이디 입력">
			<input type="button" id="id_check" name="id_check" onclick="checkId();" value="중복체크">
			<div id="id_regExp"></div>
		</div>
		<div>
			<label>PWD</label>
			<input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호 입력">
			<div id="pwd_regExp"></div>
		</div>
		<div>
			<label>PWD 확인</label>
			<input type="password" id="checkPwd" name="checkPwd" placeholder="비밀번호 확인">
			<div id="pwd_check"></div>
		</div>
		<div>
			<label>휴대폰</label>
			<input type="text" id="user_tel" name="user_tel" maxlength="13" placeholder="휴대폰 번호 입력" onkeyup="autoHyphen(value)">
		</div>
	</div>
	<div>
		<div>
			<label>닉네임</label>
			<input type="text" id="user_nickname" name="user_nickname" placeholder="닉네임 입력">
			<input type="button" id="nick_check" name="nick_check" onclick="checkNick();" value="중복체크">
		</div>
		<div>
			<label>이름</label>
			<input type="text" id="user_name" name="user_name" placeholder="이름 입력">
		</div>
		<div>
			<label>E-mail</label>
			<input type="text" id="user_email" name="user_email" placeholder="이메일 형식에 맞게 입력해주세요">
			<input type="button" id="email_check" name="email_check" onclick="checkEmail();" value="인증번호 발송">
		</div>
		<div>
			<label>인증번호</label>
			<input type="text" id="checkNum" name="checkNum" placeholder="인증번호를 입력해주세요">
			<span id="timeLeft"></span>
			<input type="button" id="check_code" name="check_code" onclick="checkCode();" value="인증번호 확인">
		</div>
	</div>
	<div>
		<div>
			<label>나이</label>
			<input type="date" id="user_birth" name="user_birth">
		</div>
		<div>
			<label>성별</label>
			<select name="user_gender">
				<option value="0">성별 선택</option>
				<option value="1">남성</option>
				<option value="2">여성</option>
				<option value="0">선택안함</option>
			</select>
		</div>
	</div>
	<div>
		<input type="checkbox"><span>전체동의</span>
		<div>
			<p><input type="checkbox">[필수] 만 14세 이상입니다.</p>
			<p><input type="checkbox">[필수] Eat's 이용 약관 동의</p>
			<p><input type="checkbox">[필수] 개인정보 수집 및 이용 약관 동의</p>
			<p><input type="checkbox">[필수] 개인정보 제 3자 제공 동의</p>
			<p><input type="checkbox">[선택] 마케팅 이용 동의</p>
		</div>
	</div>
	<div>
		<input type="hidden" id="join_method" name="join_method" value="NORMAL">
		<input type="button" id="join_auth" name="join_auth" onclick="checkJoin();" value="가입하기">
	</div>
</form>
</body>
</html>
<script>
	// 휴대폰 존재여부 확인후 있으면 가입 x
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
			altId.attr("class","error-text");
		} else if(isId(inputId.val())) {
			altId.html('올바른 아이디 형식입니다.');
			altId.attr("class","info-text");
		} 
	});
	
	inputPwd.on('input', function () {
		if(inputPwd.val() === "") {
			altPwd.html('');
		} else if(inputPwd.val().trim != "" && !isPwd(inputPwd.val())){
			altPwd.html('비밀번호는 8자리 이상 20자리 이하의 영문/숫자/특수문자 조합으로 입력해주세요.');
			altPwd.attr("class","error-text");
		} else if(isPwd(inputPwd.val())) {
			altPwd.html('올바른 비밀번호 형식입니다.');
			altPwd.attr("class","info-text");
		} 
	});
	
	checkPwd.on('input', function () {
		if(checkPwd.val() === "") {
			altpCheck.html('');
		} else if(checkPwd.val() !== inputPwd.val()){
			altpCheck.html('위의 비밀번호와 일치하지 않습니다.');
			altpCheck.attr("class","error-text");
		} else if(checkPwd.val() === inputPwd.val()) {
			altpCheck.html('위의 비밀번호와 일치합니다.');
			altpCheck.attr("class","info-text");
		} 
	});
</script>