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

function idExist(){
	var inputId=document.getElementById('store_id').value;
	if(inputId!=null && inputId!=''){
		var params='store_id='+inputId;
		sendRequest('storeIdExist', params, showIdMessage, 'GET');
	}
}


function showIdMessage(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var jsondata=JSON.parse(data).value;
			if(jsondata[0]==='true'){
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
		var inputEmail=document.getElementById('store_email').value;
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
				var params='store_email='+inputEmail;
				sendRequest('storesendCodeForFindPwd', params, showSendResult, 'POST');
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


	function storevalidateCode() {
		if (sendState === true) {

			var inputCode = document.getElementById('storeCode').value;

			var params = 'storeCode=' + inputCode;
			sendRequest('storecheckCode', params, showResult, 'GET');
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
				
				
				if (jsondata.value=='0'){
					
					errorMsg.textContent='시간이 만료되었습니다.';
					
				}else if(jsondata.value=='2'){
					errorMsg.textContent='인증번호가 일치하지 않습니다.';
					alert('블일치');
					
				}else if(jsondata.value=='1'){
					location.href='storeUpdatePwd';
				}
			}
		}

	}
</script>


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

		
			<div class="div3">
				<input type="text" name="store_id" id="store_id" placeholder="아이디를 입력하세요." onblur="idExist()">
						<div id="id-message" style="margin-top:5px; font-size:10px; text-algin:start; color:red;"></div>
			</div>
			
			<div class="eats-email-com">
				<input type="text" name="store_email" id="store_email" placeholder="이메일 예) eats@email.com" >
					<div id="email-message" style="margin-top:5px; font-size:10px; text-algin:start;">이메일을 입력해주세요.</div>
			</div>
			
			<div class="frame-8">
				<div class="div6">
					<input type="button" value="인증번호 발송ㄱㄱ" onclick="sendCode();">
				</div>
			</div>
		
		

		
			<div class="div4">
				<input type="text" name="storeCode" id="storeCode" placeholder="인증번호 입력">
				<div id="code-message" style="color: red; font-size: 10px; margin-top: 5px; text-align: start; padding-left: 20px;"></div>
				<input type="button" value="인증번호 확인" onclick="storevalidateCode();">
			</div>
		


		<div class="div5">이메일로 인증번호를 발송해드려요.</div>


	</div>

</body>
</html>