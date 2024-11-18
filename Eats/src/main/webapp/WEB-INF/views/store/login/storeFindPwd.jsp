<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
	var idCheckState = false;
	var sendState = false;

	function idExist() {
		var inputId = document.getElementById('store_id').value;
		if (inputId != null && inputId != '') {
			var params = 'store_id=' + inputId;
			sendRequest('storeIdExist', params, showIdMessage, 'POST');
		}
	}

	function showIdMessage() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var jsondata = JSON.parse(data).value;
				if (jsondata === 'true') {
					idCheckState = true;
					document.getElementById('id-message').textContent = '';
				} else {
					document.getElementById('id-message').textContent = '아이디가 존재하지 않습니다.';
				}
			}
		}
	}

	//코드 전송
	function sendCode() {
		if (idCheckState == true) {
			var inputId=document.getElementById('store_id').value;
			var inputEmail = document.getElementById('store_email').value;
			
			alert(inputId+inputEmail);
			
			if(idCheckState){
				if(inputEmail===null || inputEmail===''){
					document.getElementById('email-message').textContent='이메일을 입력해주세요';
					document.getElementById('email-message').style.color='red';
					return;
				} else {
		            document.getElementById('email-message').textContent = ''; // 초기화
		        }
					
					//이메일 형식 확인
					var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
					if(!emailPattern.test(inputEmail)){
						document.getElementById('email-message').textContent='이메일 형식을 확인해주세요';
						document.getElementById('email-message').style.color='red';
						return;
					}
					
					
						var params='store_id=' + inputId + '&store_email=' + inputEmail;
						sendRequest('/storesendCodeForFindPwd', params, showSendResult, 'POST');
						sendState=true;
				
			}
		}
	}
		

	
	
	//전송 후 alert창 띄우기
	function showSendResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var jsondata = JSON.parse(data).value;
				alert(jsondata);
			}
		}
	}

	
	
	function storevalidateCode() {
		if (sendState === true) {

			var inputCode = document.getElementById('storeCode').value;

			var params = 'storeCode=' + inputCode;
			sendRequest('storecheckCode', params, showResult, 'POST');
		} else {
			alert('인증번호를 발송하지 않았습니다.')
		}

	}

	
	function showResult() {
		if (XHR.readyState == 4) {

			if (XHR.status == 200) {
				var data = XHR.responseText;

				var errorMsg = document.getElementById('code-message');

				var jsondata = JSON.parse(data);

				if (jsondata.value == '0') {

					errorMsg.textContent = '시간이 만료되었습니다.';

				} else if (jsondata.value == '2') {
					errorMsg.textContent = '인증번호가 일치하지 않습니다.';
					alert('블일치');

				} else if (jsondata.value == '1') {
					location.href = 'storeUpdatePwd';
				}
			}
		}

	}
</script>


<style>
.store-update-pwd {
	max-width: 400px;
	margin: 20px auto;
	padding: 20px;
	font-family: Arial, sans-serif;
}

.div2 {
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.div5 {
	text-align: center;
	color: #666;
	font-size: 14px;
	margin-bottom: 30px;
}

input[type="text"], input[type="email"] {
	width: 100%;
	padding: 15px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-sizing: border-box;
	font-size: 14px;
}

input[type="text"]::placeholder, input[type="email"]::placeholder {
	color: #999;
}

input[type="button"], input[type="submit"] {
	width: 100%;
	padding: 15px;
	background-color: #349FFB;
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
	margin-bottom: 10px;
}

.frame-8 input[type="button"] {
	background-color: #E8F0FE;
	color: #4B89FF;
}

.div4 {
	display: flex;
	gap: 10px;
	margin-top: 15px;
}

.div4 input[type="text"] {
	flex: 2;
}

.div4 input[type="button"] {
	flex: 1;
	white-space: nowrap;
}

#email-message, #id-message, #code-message {
	color: #666;
	font-size: 10px;
	margin-top: 5px;
	margin-left: 5px;
}

#id-message, #code-message {
	color: red;
}

.eats-email-com, .div3 {
	margin-bottom: 15px;
}

/* 에러 메시지 스타일 */
.error-message {
	color: red;
	font-size: 12px;
	margin-top: 5px;
	padding-left: 5px;
}

/* 버튼 호버 효과 */
input[type="button"]:hover, input[type="submit"]:hover {
	opacity: 0.9;
}

</style>
</head>
<body>

	<div class="store-update-pwd">
		<div class="rectangle-3"></div>
		<div class="rectangle-4"></div>
		<div class="rectangle-7"></div>
		<div class="rectangle-5"></div>
		<div class="div"></div>


		<div class="div2">비밀번호 찾기</div>
		<div class="div5">이메일로 인증번호를 발송해드려요.</div>

		<div class="div3">
			<input type="text" name="store_id" id="store_id" placeholder="아이디를 입력하세요." onblur="idExist()">
			<div id="id-message" style="margin-top: 5px; font-size: 10px; text-align: start; color: red;"></div>
		</div>

		<div class="eats-email-com">
			<input type="text" name="store_email" id="store_email" placeholder="이메일 예) eats@email.com">
			<div id="email-message" style="margin-top: 5px; font-size: 10px; text-align: start;">이메일을 입력해주세요.</div>
		</div>
		
		<div class="frame-8">
			<div class="div6">
				<input type="button" value="인증번호 발송" onclick="sendCode()">
			</div>
		</div>

		<div class="div4">
			<input type="text" name="storeCode" id="storeCode"
				placeholder="인증번호 입력">
			<div id="code-message"
				style="color: red; font-size: 10px; margin-top: 5px; text-align: start; padding-left: 20px;"></div>
			<input type="button" value="인증번호 확인" onclick="storevalidateCode();">
		</div>
		<input type="submit" value="비밀번호 찾기">





	</div>

</body>
</html>