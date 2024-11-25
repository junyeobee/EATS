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

	function isId(ivalue) {
		let regExp = /^[a-z][a-z0-9]{3,13}$/;
		
		return regExp.test(ivalue);
	}
	
	function isPwd(pvalue) {
		let regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
		
		return regExp.test(pvalue);
	}
	
	function isPhoneNumber(pnValue) {
		let cleanPhoneNumber = pnValue.replace(/-/g, '');
		let regExp = /^01(?:0|1|[6-9])(?:\d{7}|\d{8})$/;
	 
		return regExp.test(cleanPhoneNumber);
	}
	
	function isEmail(eValue) {
		let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
		return regExp.test(eValue);
	}