<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

.form-group {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
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
</style>
</head>
<body>

	<div class="container">
		<h2>입점 신청</h2>
		<form method="post" action="/store/apply">
			<div class="form-group">
				<label for="sj_name">신청자 매장 이름</label> <input type="text"
					id="sj_name" name="sj_name" class="form-control" />
			</div>
			<div class="form-group">
				<label for="biz_num">사업자 등록 번호</label> <input type="text"
					id="biz_num" name="biz_num" class="form-control" />
			</div>
			<div class="form-group">
				<label for="owner_name">점주 이름</label> <input type="text"
					id="owner_name" name="owner_name" class="form-control" />
			</div>
			<div class="form-group">
				<label for="owner_tel">점주 연락처</label> <input type="text"
					id="owner_tel" name="owner_tel" class="form-control" />
			</div>
			<div class="form-group">
				<label for="sj_email">점주 이메일</label> <input type="text"
					id="sj_email" name="sj_email" class="form-control" />
			</div>
			<div class="form-group">
				<label for="sj_addr">매장 주소</label> <input type="text" id="sj_addr"
					name="sj_addr" class="form-control" /> <input type="button"
					class="btn-check" onclick="getPostCode()" value="우편번호 찾기">
			</div>
			<div class="form-group">
				<label for="sj_daddr">매장 상세 주소</label> <input type="text"
					id="sj_daddr" name="sj_daddr" class="form-control" />
			</div>
			<div class="form-group">
				<label for="sj_id">승인 시 사용할 아이디</label> <input type="text"
					id="sj_id" name="sj_id" class="form-control" />
				<button type="button" class="btn-check" onclick="checkDuplicateId()">중복
					체크</button>
			</div>
			<div class="form-group">
				<label for="sj_pwd">승인 시 사용할 비밀번호</label> <input type="password"
					id="sj_pwd" name="sj_pwd" class="form-control" />
			</div>
			<div class="form-group checkbox-container">
				<input type="checkbox" id="agree" required /> <label for="agree">개인정보
					수집에 동의합니다.</label>
			</div>

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
    function showPopup() {
        document.getElementById("privacy-popup").style.display = "flex";
    }

    function hidePopup() {
        document.getElementById("privacy-popup").style.display = "none";
    }

    function checkDuplicateId() {
        const id = document.getElementById("approvalId").value;
        if (id) {
            alert("중복 확인 중...");
            // 실제 중복 확인 로직 추가
        } else {
            alert("아이디를 입력해주세요.");
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
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
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

