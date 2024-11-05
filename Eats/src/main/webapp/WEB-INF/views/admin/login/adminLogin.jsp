<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eat's - 관리자 로그인</title>
<style>
.store-login,
.store-login * {
  box-sizing: border-box;
}
.store-login {
  background: #ffffff;
  height: 1024px;
  position: relative;
  overflow: hidden;
}
.rectangle-3 {
  background: #e7e7e7;
  border-radius: 10px;
  border-style: solid;
  border-color: var(--gray1, rgba(117, 117, 117, 0.29));
  border-width: 1px;
  width: 548px;
  height: 69px;
  position: absolute;
  left: 446px;
  top: 424px;
}
.rectangle-4 {
  background: #e7e7e7;
  border-radius: 10px;
  border-style: solid;
  border-color: var(--gray1, rgba(117, 117, 117, 0.29));
  border-width: 1px;
  width: 548px;
  height: 69px;
  position: absolute;
  left: 446px;
  top: 517px;
}
.rectangle-5 {
  background: #1e1e1e;
  border-radius: 12px;
  width: 548.32px;
  height: 83.73px;
  position: absolute;
  left: 446px;
  top: 632px;
}
.div {
  color: #ffffff;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 21px;
  font-weight: 700;
  position: absolute;
  left: 667px;
  top: 659px;
}
.div2 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 36px;
  font-weight: 500;
  position: absolute;
  left: calc(50% - 109px);
  top: 320px;
}
.div3 {
  color: #505050;
  text-align: left;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 18px;
  font-weight: 400;
  position: absolute;
  left: 471px;
  top: 445px;
}
.div4 {
  color: #505050;
  text-align: left;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 18px;
  font-weight: 400;
  position: absolute;
  left: 470.66px;
  top: 538px;
}
.group-185 {
  height: auto;
  position: absolute;
  left: 623px;
  top: 209px;
  overflow: visible;
}

/* Figma Styles of your File */
:root {
  /* Colors */
  /* Fonts */
  /* Effects */
  --shortandblur-box-shadow: 0px 2px 6px 0px rgba(0, 0, 0, 0.15);
  --btn-box-shadow: 0px 0px 4px 0px rgba(238, 179, 163, 1);
}

</style>
</head>
<body>
<form id="admin_login_form" name="admin_login_form" action="adminLogin" method="post">

<div class="store-login">
  <div class="rectangle-3"></div>
  <div class="rectangle-4"></div>
  <div class="rectangle-5"></div>
  <div class="div">
  	<input type="submit" value="로그인하기">
  </div>
  <div class="div2">관리자 로그인</div>
  <div class="div3">
  	<input type="text" id="userId" name="userId" placeholder="아이디">
  </div>
  <div class="div4">
  	<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호">
  </div>
  <img class="group-185" src="/svg/logo_icon.svg" />
</div>

</form>
</body>
</html>