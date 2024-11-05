<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
  background: var(--color-6, #daf0ff);
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
  background: #e5f3ff;
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
.rectangle-6 {
  background: #e2e2e2;
  border-radius: 4px;
  width: 20px;
  height: 19px;
  position: absolute;
  left: 451px;
  top: 606px;
}
.rectangle-5 {
  background: var(--storeblue2, #349ffb);
  border-radius: 12px;
  width: 548.32px;
  height: 83.73px;
  position: absolute;
  left: 446px;
  top: 681px;
}
.div {
  color: #ffffff;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 21px;
  font-weight: 700;
  position: absolute;
  left: 667px;
  top: 708px;
}
.div2 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 20.258302688598633px;
  font-weight: 400;
  position: absolute;
  left: 589px;
  top: 820px;
}
.div3 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 16px;
  font-weight: 400;
  position: absolute;
  left: 480px;
  top: 603px;
  width: 78px;
}
.div4 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 36px;
  font-weight: 500;
  position: absolute;
  left: calc(50% - 121px);
  top: 319.84px;
}
.div5 {
  color: #505050;
  text-align: left;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 18px;
  font-weight: 400;
  position: absolute;
  left: 471px;
  top: 445px;
}
.div6 {
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
  position: absolute;
  inset: 0;
}
.clip-path-group {
  width: 183.1px;
  height: 86.88px;
  position: absolute;
  left: 623px;
  top: 175px;
  overflow: visible;
}
.store {
  color: rgba(117, 117, 117, 0.58);
  text-align: left;
  font-family: "NotoSansKr-Black", sans-serif;
  font-size: 31.112558364868164px;
  font-weight: 900;
  position: absolute;
  left: 677.45px;
  top: 250.84px;
}

</style>
<body>
<form name="store_login_form" id="store_login_form" action="storeLogin" method="post">

<div class="store-login">
  <div class="rectangle-3"></div>
  <div class="rectangle-4"></div>
  <div class="rectangle-6"></div>
  <div class="rectangle-5"></div>
  <div><input type="submit" value="로그인하기" class="div"></div>
  <div class="div2"><a href="/storeFindId">아이디 찾기</a> | 비밀번호 찾기</div>
  <div class="div3">
  <input type="checkbox" name="check" <c:if test="${!empty cookie.saveid}">checked</c:if>>
  아이디 저장</div>
  <div class="div4">매장회원 로그인</div>
  <input type="text" name="storeId" id="storeId" class="div5" placeholder="아이디를 입력해주세요." value="${cookie.saveid.value}">
  <input type="password" name="storePwd" id="storePwd" class="div6" placeholder="비밀번호를 입력해주세요.">
  <img class="clip-path-group" src="img/store_logo.png"/>
</div>

</form>
</body>
</html>