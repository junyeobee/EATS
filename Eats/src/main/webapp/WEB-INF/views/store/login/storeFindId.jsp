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
  top: 433px;
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
  top: 526px;
}
.rectangle-6 {
  background: #ffffff;
  width: 24.99px;
  height: 24.31px;
  position: absolute;
  left: 446.68px;
  top: 660.57px;
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
  top: 643px;
}
.div {
  color: #ffffff;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 21px;
  font-weight: 700;
  position: absolute;
  left: 666px;
  top: 669px;
}
.div2 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 36px;
  font-weight: 500;
  position: absolute;
  left: calc(50% - 87px);
  top: 282px;
}
.div3 {
  color: #505050;
  text-align: left;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 18px;
  font-weight: 400;
  position: absolute;
  left: 472px;
  top: 454px;
}
.eats-email-com {
  color: #505050;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 18px;
  font-weight: 400;
  position: absolute;
  left: 471.66px;
  top: 550px;
}
.div4 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 20px;
  font-weight: 500;
  position: absolute;
  left: calc(50% - 156px);
  top: 355px;
}

</style>
</head>
<body>
<form name ="findId" id="findId" action="storeFindId" method="post">
<div class="store-findid">
  <div class="rectangle-3"></div>
  <div class="rectangle-4"></div>
  <div class="rectangle-6"></div>
  <div class="rectangle-5"></div>
  <div class="div"><input type="submit" value="아이디 찾기" ></div>
  <div class="div2">아이디 찾기</div>
  <input type="text" name="store_ceo" placeholder="이름을 입력하세요." class="div3">
 <input type="email" name="store_email" placeholder="이메일 예) eats@email.com" class="eats-email-com">
  <div class="div4">가입된 회원정보로 아이디를 확인하세요.</div> 
</div>
</form>
</body>
</html>