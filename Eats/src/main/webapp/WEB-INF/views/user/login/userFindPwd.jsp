<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
var idCheckState=false;
var sendState=false;

//아이디가 존재하는지 학인
function idExist(){
	var inputId=document.getElementById('userId').value;
	if(inputId!=null && inputId!=''){
		var params='userId='+inputId;
		sendRequest('idExist', params, showIdMessage, 'POST');
	}
}
function showIdMessage(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var jsondata=JSON.parse(data).value;
			if(jsondata==='true'){
				idCheckState=true;
				document.getElementById('id-message').textContent='';
			}else{
				document.getElementById('id-message').textContent='아이디가 존재하지 않습니다.';
			}
		}
	}
}
//코드 전송
function sendCode(){
	if(idCheckState==true){
		var inputEmail=document.getElementById('userEmail').value;
		//alert(inputEmail);
		if(inputEmail===null || inputEmail===''){
			document.getElementById('email-message').textContent='이메일을 입력해주세요';
			document.getElementById('email-message').style.color='red';
		}else{
			//이메일 형식 확인
			var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			if(!emailPattern.test(inputEmail)){
				document.getElementById('email-message').textContent='이메일 형식을 확인해주세요';
				document.getElementById('email-message').style.color='red';
			}else{
				var params='userEmail='+inputEmail;
				sendRequest('sendCodeForFindPwd', params, showSendResult, 'POST');
				sendState=true;
			}
		}
	}
}
//전송 후 alert창 띄우기
function showSendResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var jsondata=JSON.parse(data).value;
			alert(jsondata);
		}
	}
}
//코드 일치 확인
function validateCode(){
	if(sendState===true){
		var inputCode=document.getElementById('userCode').value;
		
		var params='userCode='+inputCode;
		sendRequest('checkPwdCode', params, showResult, 'POST');
	}else{
		alert('인증번호를 발송하지 않았습니다.');
	}
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			
			var errorMsg=document.getElementById('code-message');
			
			var jsondata = JSON.parse(data);
			if(jsondata.value=='0'){
				errorMsg.textContent='시간이 만료되었습니다.';
				//alert('시간만료');
			} else if(jsondata.value=='2') {
				errorMsg.textContent='인증번호가 일치하지 않습니다.';
				alert('불일치');
			} else if(jsondata.value=='1'){
				location.href='userResetPwd';
			}
		}
	}
}
</script>
<!-- noto sans kr font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/user/userFindIdCss.css">
</head>
<body>
	<div class="form-wrapper">
		<div class="logo-wrapper">
			<img src="/img/eats_logo.png">
		</div>
		<div class="title-wrapper">
			<h3>비밀번호 찾기</h3>
			<p>가입된 회원정보로 비밀번호를 확인하세요</p>
		</div>
		<div class="table-wrapper">
			<table>
				<tr>
					<td>
						<input type="text" id="userId" placeholder="ID" onblur="idExist()">
						<div id="id-message" style="margin-top:5px; font-size:10px; text-algin:start; color:red;"></div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="userEmail" placeholder="이메일 예)example@naver.com">
						<div id="email-message" style="margin-top:5px; font-size:10px; text-algin:start;">이메일을 입력해주세요.</div>
					</td>
					<td>
						<input type="button" value="인증번호 발송" onclick="sendCode();">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="userCode">
						<div id="code-message" style="color:red; font-size:10px; margin-top:5px; text-align:start; padding-left:20px;"></div>
					</td>
					<td>
						<input type="button" value="인증번호 확인" onclick="validateCode();">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>