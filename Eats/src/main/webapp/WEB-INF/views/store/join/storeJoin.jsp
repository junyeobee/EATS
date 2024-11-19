<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
        <label for="sj_name">신청자 매장 이름</label>
        <input type="text" id="sj_name" name="sj_name" class="form-control" />
    </div>
    <div class="form-group">
        <label for="biz_num">사업자 등록 번호</label>
        <input type="text" id="biz_num" name="biz_num" class="form-control" />
    </div>
    <div class="form-group">
        <label for="owner_name">점주 이름</label>
        <input type="text" id="owner_name" name="owner_name" class="form-control" />
    </div>
    <div class="form-group">
        <label for="owner_tel">점주 연락처</label>
        <input type="text" id="owner_tel" name="owner_tel" class="form-control" />
    </div>
    <div class="form-group">
        <label for="sj_email">점주 이메일</label>
        <input type="text" id="sj_email" name="sj_email" class="form-control" />
    </div>
    <div class="form-group">
        <label for="sj_addr">매장 주소</label>
        <input type="text" id="sj_addr" name="sj_addr" class="form-control" />
    </div>
    <div class="form-group">
        <label for="sj_daddr">매장 상세 주소</label>
        <input type="text" id="sj_daddr" name="sj_daddr" class="form-control" />
    </div>
    <div class="form-group">
        <label for="sj_id">승인 시 사용할 아이디</label>
        <input type="text" id="sj_id" name="sj_id" class="form-control" />
        <button type="button" class="btn-check" onclick="checkDuplicateId()">중복 체크</button>
    </div>
    <div class="form-group">
        <label for="sj_pwd">승인 시 사용할 비밀번호</label>
        <input type="password" id="sj_pwd" name="sj_pwd" class="form-control" />
    </div>
    <div class="form-group checkbox-container">
        <input type="checkbox" id="agree" required />
        <label for="agree">개인정보 수집에 동의합니다.</label>
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
</script>

</body>
</html>

