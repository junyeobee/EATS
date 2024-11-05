<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .container {
        max-width: 500px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f0f8ff;
        border-radius: 10px;
    }
    h2 {
        text-align: center;
    }
    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    input[type="text"], input[type="password"], .checkbox-container {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    .checkbox-container {
        display: flex;
        align-items: center;
    }
    .checkbox-container input[type="checkbox"] {
        width: auto;
        margin-right: 10px;
    }
    .privacy-button {
        margin-top: 10px;
        display: block;
        background-color: transparent;
        border: none;
        color: blue;
        cursor: pointer;
        text-decoration: underline;
    }
    .buttons {
        display: flex;
        justify-content: center;
        gap: 10px;
    }
    .button {
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
    }
    .submit-btn {
        background-color: black;
        color: white;
    }
    .cancel-btn {
        background-color: #ccc;
    }
</style>
</head>
<body>
<div class="container">
	<h2>입점 신청</h2>
	    <form method="post" modelAttribute="store" action="/store/apply">
        <div class="form-group">
            <label for="storeName">신청자 매장 이름</label>
            <form:input path="storeName" id="storeName" cssClass="form-control"/>
        </div>
        <div class="form-group">
            <label for="registrationNumber">사업자 등록 번호</label>
            <form:input path="registrationNumber" id="registrationNumber" cssClass="form-control"/>
        </div>
        <div class="form-group">
            <label for="ownerName">점주 이름</label>
            <form:input path="ownerName" id="ownerName" cssClass="form-control"/>
        </div>
        <div class="form-group">
            <label for="ownerContact">점주 연락처</label>
            <form:input path="ownerContact" id="ownerContact" cssClass="form-control"/>
        </div>
        <div class="form-group">
            <label for="storeAddress">매장 주소</label>
            <form:input path="storeAddress" id="storeAddress" cssClass="form-control"/>
        </div>
        <div class="form-group">
            <label for="detailedAddress">매장 상세 주소</label>
            <form:input path="detailedAddress" id="detailedAddress" cssClass="form-control"/>
        </div>
        <div class="form-group">
            <label for="approvalId">승인 시 사용할 아이디</label>
            <form:input path="approvalId" id="approvalId" cssClass="form-control"/>
        </div>
        <div class="form-group">
            <label for="approvalPassword">승인 시 사용할 비밀번호</label>
            <form:password path="approvalPassword" id="approvalPassword" cssClass="form-control"/>
        </div>
        
        <div class="form-group">
            <input type="checkbox" id="agree" required>
            <label for="agree">개인정보 수집에 동의합니다.</label>
        </div>
        
        <div class="form-buttons">
            <button type="submit" class="btn btn-primary">신청하기</button>
            <button type="reset" class="btn btn-secondary">취소</button>
        </div>
    </form>
</div>
</body>
</html>