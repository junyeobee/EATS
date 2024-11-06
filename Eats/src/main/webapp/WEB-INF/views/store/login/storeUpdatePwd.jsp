<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.store-findid,
.store-findid * {
  box-sizing: border-box;
}
.store-findid {
  background: #ffffff;
  height: 1024px;
  position: relative;
  overflow: hidden;
}
.rectangle-3 {
  background: var(--color-6, #daf0ff);
  border-radius: 10px;
  border-style: solid;
  border-color: var(--gray1, rgba(117, 117, 117, 0.29));
  border-width: 1px;
  width: 548.32px;
  height: 69px;
  position: absolute;
  left: 447px;
  top: 441px;
}
.rectangle-4 {
  background: var(--color-6, #daf0ff);
  border-radius: 10px;
  border-style: solid;
  border-color: var(--gray1, rgba(117, 117, 117, 0.29));
  border-width: 1px;
  width: 548.32px;
  height: 69px;
  position: absolute;
  left: 447px;
  top: 534px;
}
.rectangle-6 {
  background: #ffffff;
  width: 24.99px;
  height: 24.31px;
  position: absolute;
  left: 446.68px;
  top: 668.57px;
}
.group-156 {
  position: absolute;
  inset: 0;
}
.rectangle-5 {
  background: var(--storeblue2, #349ffb);
  border-radius: 12px;
  width: 548.32px;
  height: 83.73px;
  position: absolute;
  left: 447px;
  top: 651px;
}
.div {
  color: #ffffff;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 21px;
  font-weight: 700;
  position: absolute;
  left: 651px;
  top: 677px;
}
.div2 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 36px;
  font-weight: 500;
  position: absolute;
  left: calc(50% - 119px);
  top: 290px;
}
.div3 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 20px;
  font-weight: 500;
  position: absolute;
  left: calc(50% - 135px);
  top: 363px;
}

.rectangle-3 input, .rectangle-4 input {
    width: 100%; /* 부모 요소의 너비에 맞춤 */
    height: 100%; /* 부모 요소의 높이에 맞춤 */
    border: none; /* 기본 테두리 제거 */
    border-radius: 10px; /* 테두리 반경 설정 */
    padding: 10px; /* 여백 설정 */
    font-size: 16px; /* 글자 크기 설정 */
    background: transparent; /* 배경 투명하게 설정 */
    outline: none; /* 포커스 시 기본 테두리 제거 */
}

/* Placeholder 스타일 */
.rectangle-3 input::placeholder, .rectangle-4 input::placeholder {
    color: #ccc; /* Placeholder 색상 설정 */
}

.rectangle-5 input{
    width: 100%; /* 부모 요소의 너비에 맞춤 */
    height: 100%; /* 부모 요소의 높이에 맞춤 */
    border: none; /* 기본 테두리 제거 */
    border-radius: 10px; /* 테두리 반경 설정 */
    padding: 10px; /* 여백 설정 */
    font-size: 16px; /* 글자 크기 설정 */
    background: transparent; /* 배경 투명하게 설정 */
    outline: none; /* 포커스 시 기본 테두리 제거 */
}

</style>
</head>
<body>

<form name="storeUpdatePwd" action="storeUpdatePwd" method="post">
<div class="store-findid">
  <div class="rectangle-3"><input type="text" name="newPwd" id="newPwd" placeholder="새 비밀번호를 입력해주세요."></div>
  <!-- <div class="rectangle-4"><input type="text" name="newPwdCf" id="newPwdCf" placeholder="새 비밀번호를 확인해주세요."></div> -->

  <div class="rectangle-5"><input type="submit" value="비밀번호 재설정"></div>
  <div class="div">비밀번호 재설정</div>
  <div class="div2">비밀번호 재설정</div>
  <div class="div3">새로운 비밀번호를 입력해주세요.</div>
</div>
</form>


</body>
</html>