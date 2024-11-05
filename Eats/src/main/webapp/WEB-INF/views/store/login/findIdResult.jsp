<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.store-findid, .store-findid * {
	box-sizing: border-box;
}

.store-findid {
	background: #ffffff;
	height: 1024px;
	position: relative;
	overflow: hidden;
}

.rectangle-6 {
	background: #ffffff;
	width: 24.99px;
	height: 24.31px;
	position: absolute;
	left: 462.68px;
	top: 660.57px;
}

.frame-156 {
	background: var(--storeblue2, #349ffb);
	border-radius: 12px;
	padding: 26px 62px 26px 62px;
	display: flex;
	flex-direction: row;
	gap: 10px;
	align-items: center;
	justify-content: center;
	width: 280px;
	position: absolute;
	left: 726px;
	top: 643px;
}

.div {
	color: #ffffff;
	text-align: left;
	font-family: "NotoSansKr-Bold", sans-serif;
	font-size: 21px;
	font-weight: 700;
	position: relative;
}

.frame-157 {
	background: var(--gray1, rgba(117, 117, 117, 0.29));
	border-radius: 12px;
	padding: 26px 62px 26px 62px;
	display: flex;
	flex-direction: row;
	gap: 10px;
	align-items: center;
	justify-content: center;
	width: 280px;
	position: absolute;
	left: 435px;
	top: 643px;
}

.div2 {
	color: #000000;
	text-align: left;
	font-family: "NotoSansKr-Bold", sans-serif;
	font-size: 21px;
	font-weight: 700;
	position: relative;
}

.div3 {
	color: #000000;
	text-align: left;
	font-family: "NotoSansKr-Medium", sans-serif;
	font-size: 36px;
	font-weight: 500;
	position: absolute;
	left: calc(50% - 245px);
	top: 282px;
}

.div4 {
	color: #000000;
	text-align: left;
	font-family: "NotoSansKr-Medium", sans-serif;
	font-size: 36px;
	font-weight: 500;
	position: absolute;
	left: calc(50% - 44px);
	top: 432px;
}
</style>
</head>
<body>

	<div class="store-findid">

		<div class="rectangle-6"></div>
		<div class="frame-156">
			<div class="div">로그인 하기</div>
		</div>
		<div class="frame-157">
			<div class="div2">
				<a href="/storeFindPwdPage">비밀번호 찾기</a>
			</div>
		</div>

		<div class="div3">회원님의 아이디를 확인해주세요.</div>
		<div class="div4">

			<c:choose>
				<c:when test="${empty findId || empty findId.store_id}">
					<p>아이디를 찾을 수 없습니다.</p>
					<p>${message}</p>
				</c:when>

				<c:otherwise>
  					${findId.store_id}
  				</c:otherwise>
			</c:choose>
		</div>




	</div>

</body>
</html>