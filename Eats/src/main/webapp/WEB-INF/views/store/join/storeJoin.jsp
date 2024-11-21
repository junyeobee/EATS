<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/js/ajaxJs.js"></script>
<title>입점 신청</title>
<style>
body {
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	background-color: #f0f8ff;
}

.container {
	width: 800px; /* 배경 가로 너비 증가 */
	padding: 40px;
	background-color: #f0f8ff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

h2 {
	text-align: center;
}

.joinForm {
	display: flex;
	flex-direction: column;
	row-gap: 30px;
}

.form-group {
	display: flex;
	align-items: center;
}

.form-group label {
	width: 180px; /* 라벨의 고정 너비 증가 */
	margin-right: 10px;
	font-weight: bold;
	text-align: right; /* 오른쪽 정렬 */
}

input[type="text"], input[type="password"] {
	flex: 1; /* 입력 필드가 가능한 공간을 차지하도록 설정 */
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	height: 40px; /* 모든 입력 필드 높이를 동일하게 설정 */
}

.btn-check {
	background-color: #00a2ff;
	color: white;
	padding: 10px 20px; /* 버튼 크기 증가 */
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px; /* 버튼 폰트 크기 증가 */
	margin-left: 10px; /* 입력 필드와 버튼 간격 조정 */
	white-space: nowrap;
	height: 40px; /* 버튼 높이를 입력 필드와 동일하게 설정 */
	display: flex;
	align-items: center;
	justify-content: center;
}

.btn-check:hover {
	background-color: #008ae6;
}

.checkbox-container {
	display: flex;
	align-items: center;
	justify-content: center; /* 가운데 정렬 */
	margin-bottom: 15px;
	width: 100%; /* 체크박스와 텍스트가 한 줄에 나오도록 너비를 설정 */
	white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
}

.checkbox-container input[type="checkbox"] {
	width: auto;
	margin-right: 10px;
}

.privacy-button {
	display: block;
	background-color: transparent;
	border: none;
	color: blue;
	cursor: pointer;
	text-decoration: underline;
	text-align: center; /* 버튼을 가운데 정렬 */
	margin: 10px auto; /* 가운데 정렬을 위한 여백 설정 */
}

.form-buttons {
	display: flex;
	justify-content: center;
	gap: 10px;
}

.btn {
	padding: 12px 25px;
	font-size: 16px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.btn-primary {
	background-color: black;
	color: white;
}

.btn-secondary {
	background-color: #ccc;
}

/* Popup Styles */
.popup-overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	justify-content: center;
	align-items: center;
}

.popup-content {
	background: white;
	padding: 30px;
	border-radius: 8px;
	max-width: 500px;
	width: 90%;
	text-align: center;
}

.popup-content h3 {
	margin-top: 0;
}

.form-container {
	position: relative;
}

.alert-text {
margin-top:5px;
	position: absolute;
	left: 195px;
	color: #4c4c4c;
	font-size: 14px;
}

.check-from {
	justify-content: center;
	font-size: 18px;
	color: red;
}
</style>
</head>
<body>

	<div class="container">
		<h2>입점 신청</h2>
		<form class="joinForm" method="Post" action="/store/apply" onsubmit="return checkValid();">
			<div class="form-group">
				<label for="sj_name">신청자 매장 이름</label> <input type="text"
					id="sj_name" name="sj_name" class="form-control" />
			</div>
			<div class="form-container">
				<div class="form-group">
					<label for="biz_num">사업자 등록 번호</label> <input type="text"
						id="biz_num" name="biz_num" class="form-control" placeholder="예시) 123-45-78910"/>
				</div>
				<div class="alert-text" id="checkBiz">
				</div>
			</div>
			<div class="form-group">
				<label for="owner_name">점주 이름</label> <input type="text"
					id="owner_name" name="owner_name" class="form-control" />
			</div>
			<div class="form-container">
				<div class="form-group">
					<label for="owner_tel">점주 연락처</label> <input type="text"
						id="owner_tel" name="owner_tel" class="form-control"
						placeholder="예시) 010-1234-5678"/>
				</div>
				<div class="alert-text" id="checkTel">
				</div>
			</div>
			<div class="form-container">
				<div class="form-group">
					<label for="sj_email">점주 이메일</label> <input type="text"
						id="sj_email" name="sj_email" class="form-control"
						placeholder="예시) id@email.com"/>
				</div>
				<div class="alert-text" id="checkEmail">
				</div>
			</div>
			<div class="form-group">
				<label for="sj_addr">매장 주소</label> <input type="text" id="sj_addr"
					name="sj_addr" class="form-control" disabled/> <input type="button"
					class="btn-check" onclick="getPostCode()" value="주소 찾기">
			</div>
			<div class="form-group">
				<label for="sj_daddr">매장 상세 주소</label> <input type="text"
					id="sj_daddr" name="sj_daddr" class="form-control"
					placeholder="예시) 101동 101호, 2층" />
			</div>
			<div class="form-container">
				<div class="form-group">
					<label for="sj_id">승인 시 사용할 아이디</label> <input type="text"
						id="sj_id" name="sj_id" class="form-control" placeholder="아이디 입력" oninput="checkIdValid(this.value)"/>
					<button type="button" class="btn-check"
						onclick="checkDuplicateId()">중복 체크</button>
				</div>
				<div class="alert-text" id="checkId">
					4~12자의 영문자 또는 숫자만 사용 가능합니다.
				</div>
			</div>
			<div class="form-container">
				<div class="form-group">
					<label for="sj_pwd">승인 시 사용할 비밀번호</label> <input type="password"
						id="sj_pwd" name="sj_pwd" class="form-control"
						placeholder="비밀번호 입력" oninput="checkPwdValid(this.value)"/>
				</div>
				<div class="alert-text" id="checkPwd">
					8~15자의 영대소문자, 특수문자, 숫자를 모두 조합하여야 합니다.
				</div>
			</div>
			<div class="form-group checkbox-container">
				<input type="checkbox" id="agree" required /> <label for="agree">개인정보
					수집에 동의합니다.</label>
			</div>
			<div class="form-group check-from" id="finalCheck"></div>
			<div class="form-buttons">
				<button type="submit" class="btn btn-primary">신청</button>
				<button type="reset" class="btn btn-secondary">취소</button>
			</div>
		</form>

	</div>

	<!-- 팝업 -->
	<div id="privacy-popup" class="popup-overlay" onclick="hidePopup()">
		<div class="popup-content">
			<h3>개인정보 수집 및 이용 안내</h3>
			<p>개인정보 수집 및 이용에 관한 내용</p>
		</div>
	</div>

</body>

<script>
var finalCheck = document.getElementById('finalCheck');
const regId =/^[0-9a-z]{4,12}$/;
const regPwd = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{8,15}$/;
const regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const regBiz = /^\d{3}-\d{2}-\d{5}$/;
const regTel = /^\d{3}-\d{4}-\d{4}$/;

var cnt = 0;
function checkValid() {
	cnt=0;
	
	var allForm = document.getElementsByClassName('form-control');
	for(var i=0; i<allForm.length; i++){
		if(allForm[i].value==null || allForm[i].value=='') {
			finalCheck.innerText='모든 정보를 기입해주세요.';
			console.log(allForm[i])
			cnt++;	
		} else {
			finalCheck.innerText='';
		}
	}
	
	if(document.getElementById('checkId').style.color=='red') {
		finalCheck.innerText='아이디 사용 조건을 확인해주세요.';
		cnt++;
	}
	if(document.getElementById('checkPwd').style.color=='red'){
		finalCheck.innerText='비밀번호 사용 조건을 확인해주세요.';
		cnt++;	
	}
	
	checkAnyInput('checkBiz', 'biz_num', regBiz, '유효하지 않은 형식입니다.','');
	checkAnyInput('checkTel', 'owner_tel', regTel, '유효하지 않은 전화번호 형식입니다.','');
	checkAnyInput('checkEmail', 'sj_email', regEmail, '유효하지 않은 이메일 형식입니다.','');

	if(cnt>0) {
		console.log(cnt);
		return false;
	}
}

function checkIdValid(inId) {
	var checkId = document.getElementById('checkId');
	
	if(!regId.exec(inId)) {
		checkId.style.color='red';
		checkId.innerText = '4~12자의 영문자 또는 숫자만 사용 가능합니다.';
	} else {
		checkId.style.color='blue';
		checkId.innerText='사용 가능한 아이디입니다.';
	}
}

function checkPwdValid(inPwd) {
	var checkPwd = document.getElementById('checkPwd');

	if(!regPwd.exec(inPwd)) {
		checkPwd.style.color='red';
		checkPwd.innerText = '영대소문자, 특수문자, 숫자를 조합한 8~15자만 사용 가능합니다.';
	} else {
		checkPwd.style.color='blue';
		checkPwd.innerText='사용 가능한 비밀번호입니다.';
	}
}

function checkAnyInput(divId,valueId, regs,str1, str2) {
	var divbox = document.getElementById(divId);
	var value = document.getElementById(valueId).value;
	
	if(!regs.exec(value)) {
		divbox.innerText = str1;
		divbox.style.color = 'red';

		cnt++;
	} else {
		divbox.style.color = 'blue';
		divbox.innerText=str2;
	}
}

window.addEventListener('load', function() {
	var result = '${result}';
	
	if(result!=null && result!='') {
		if(result>0){
			alert("입점 신청이 접수되었습니다.");
		} else {
			alert('입점 신청 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
		}
		location.href='${goUrl}';
	}
})
    function showPopup() {
        document.getElementById("privacy-popup").style.display = "flex";
    }

    function hidePopup() {
        document.getElementById("privacy-popup").style.display = "none";
    }

    function checkDuplicateId() {
        const id = document.getElementById("sj_id").value;
		
         if (id) {
            //alert("중복 확인 중...");
            // 실제 중복 확인 로직 추가
            var param = 'approvalId='+id;
            sendRequest('/store/checkJoinId', param, showCheckJoinId, 'GET');
        } else {
            //alert("아이디를 입력해주세요.");
        } 
    }
    
    function showCheckJoinId(){
    	if(XHR.readyState==4){
    		if(XHR.status==200){
    			var data=XHR.responseText;
    			if(data=='true') {
    				alert('이미 사용중인 아이디입니다.');
    				var inputId = document.getElementById("sj_id");
    				
    				inputId.value='';
    			} else {
    				alert('사용 가능한 아이디입니다.');
    			}
    		}
    	}
    }
    
	var width = 500; //팝업의 너비
	var height = 600; //팝업의 높이
    
    function getPostCode() {    	
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 예제를 참고하여 다양한 활용법을 확인해 보세요.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname != '' && /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById("sj_addr").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sj_daddr").focus();
					}
				}).open({
					left: -((window.screen.width/2) + (width / 2)),
				    top:0,
				    popupTitle: '장소 검색'
				});	
	}
</script>
</html>

