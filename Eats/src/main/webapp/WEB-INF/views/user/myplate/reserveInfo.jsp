<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/user/userHeader.css">
<link rel="stylesheet" href="/css/user/userFooter.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<style>
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video, textarea {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	font-family: "Noto Sans KR", sans-serif;
}
body{
	background-color: #FFE8E4;
}
.content-wrapper{
	display: flex;
	width: 50%;
	margin:50px auto 150px auto;
	justify-content: center;
	background-color: #fefefe;
	border-radius: 10px;
	padding: 30px 15px;
	flex-direction: column;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}
.reserve-info{
	display: flex;
	border: 2px solid #f3553c;
	border-radius: 10px;
	flex-wrap: wrap;
	width: 90%;
	margin: 30px auto;
}
.reserve-info .store-img-wrap{
	width: 30%;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
}
.reserve-info .store-img-wrap img{
	width: 100%;
	height: auto;
}
.reserve-info .text-area{
	display:flex;
	flex-direction: row;
	gap:15px;
	width: 70%;
}
.reserve-info .text-area ul{
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    list-style: none;
}
.reserve-info .text-area ul .reserve-info-li{
    display: flex;
    flex-direction: row;
    gap:10px;
    border:0;
    font-size: 12px;
}
.reserve-info .text-area ul .store-name{
	font-size: 15px;
	font-weight: 800;
}
.reserve-info .text-area ul .reserve-info-li img{
	width:20px;
}
.state{
	color:#f3553c;
}
.btn-wrapper{
	width:90%;
	margin:10px auto;
}
.btn-disabled{
	border:2px solid #f3553c;
	color:#f3553c;
	border-radius: 10px;
	width: 100%;
	padding: 15px;
}
.btn-able{
	background-color: #f3553c;
    color: #fefefe;
    border-radius: 10px;
    width: 100%;
    border: 0;
    padding: 15px;
}
.req-wrapper{
	width: 90%;
	margin: 10px auto;
}
.req-wrapper textarea{
	width: 95%;
	margin: 10px auto;
	min-height: 300px;
	border:2px solid gray;
	padding: 15px;
}
.rev-wrapper p{
	margin-left: 5%;
}
/*리뷰*/

.rev-box {
  border: 2px solid #f3553c;
  border-radius: 8px;
  padding: 20px;
  width: 85%;
  margin: 10px auto;
}

/* 작성자 정보 */
.writer-box {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 15px;
}

.profile-img-wrap img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
}

/* 리뷰 이미지 영역 */
.rev-img-box {
  display: flex;
  gap: 10px;
  margin-bottom: 15px;
  overflow-x: auto;
}

.rev-img-box img {
  width: 120px;
  height: 120px;
  border-radius: 8px;
  object-fit: cover;
}

/* 별점 및 날짜 */
.rev-box-middle {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
}

.star-wrapper {
  display: flex;
  gap: 2px;
}

.star {
  display: inline-block;
  width: 20px;
  height: 20px;
  background: url(/img/user/star_active.png) no-repeat;
  background-size: contain;
}

.date-wrapper {
  color: #666;
  font-size: 14px;
}

/* 리뷰 내용 */
.rev-info-box textarea {
  width: 95%;
  min-height: 80px;
  border: 1px solid #eee;
  resize: none;
  margin-bottom: 15px;
  font-size: 15px;
  line-height: 1.5;
  padding:10px;
}

/* 메뉴 태그 */
.menu-box {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 10px;
}

.menu-list {
  background-color: #FFF8E7;
  color: #FF9F1C;
  padding: 5px 10px;
  border-radius: 15px;
  font-size: 14px;
}

/* 태그 */
.tag-box {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.tag-list {
  background-color: #f5f5f5;
  color: #666;
  padding: 5px 10px;
  border-radius: 15px;
  font-size: 14px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/userHeader.jsp" %>
<section class="content-wrapper">
	<c:set var="r" value="${reserveDTO }"></c:set>
	<div class="reserve-info">
		<div class="store-img-wrap">
			<img src="../img/storeUploadImg/${r.store_img }">
		</div>
		<div class="text-area">
			<ul>
				<li class="store-name">${r.store_name }</li>
				<li class="reserve-info-li">
					<img src="../img/user/storeInfo/cal_icon.png">
					<span>${r.reserve_date }</span>
				</li>
				<li class="reserve-info-li">
					<img src="../img/user/storeInfo/watch_icon.png">
					<span>${r.reserve_time }</span>
				</li>
				<li class="reserve-info-li">
					<img src="../svg/group_icon.svg">
					<span>${r.reserve_count }명</span>
				</li>
				<li class="reserve-info-li, state">${state }</li>
			</ul>
			
		</div>
		<div class="btn-wrapper">
		<c:if test="${r.reserve_state==0 || r.reserve_state==1 }">
			<c:if test="${dDay>3 }">
			<input type="button" class="btn-able" value="예약취소" onclick="location.href='/user/cancelReserve?reserve_idx=${r.reserve_idx}'">
			</c:if>
			<c:if test="${dDay<=3 }">
			<input type="button" class="btn-disabled" value="취소 불가" disabled="disabled">
			</c:if>
		</c:if>
		</div>
	</div>
	<div class="req-wrapper">
		<p>요청사항</p>
		<textarea readonly="readonly">${r.request }</textarea>
	</div>
	<c:if test="${r.reserve_state==3 }">
	<div class="rev-wrapper">
		<c:if test="${!revExist }">
			<div class="rev-btn">
				<input type="button" class="btn-rev" onclick="location.href='/user/writeReview?reserve_idx=${r.reserve_idx}'" value="리뷰 쓰기">
			</div>
		</c:if>
		<c:if test="${revExist }">
			<p>REVIEW</p>
			<div class="rev-box">
				
				<c:if test="${!empty revInfoMap.imgList }">
				<div class="rev-img-box">
					<c:forEach var="img" items="${revInfoMap.imgList}">
					<img src="/img/user/review/${img }">
					</c:forEach>
				</div>
				</c:if>
				<div class="rev-box-middle">
					<div class="star-wrapper">
					<c:forEach step="1" begin="1" end="${revInfoMap.REV_SCORE }">
						<span class="star"></span>
					</c:forEach>
					</div>
					<div class="date-wrapper">
						<span>작성일: ${revInfoMap.REV_WRITEDATE }</span>
					</div>
				</div>
				<div class="rev-info-box">
					<textarea rows="" cols="">${revInfoMap.REV_CONTENT }</textarea>
					<div class="menu-box">
						<c:forEach var="menu" items="${revInfoMap.revMenulist }">
						<span class="menu-list">${menu.MENU_NAME }</span>
						</c:forEach>
					</div>
					<div class="tag-box">
						<c:forEach var="tag" items="${revInfoMap.revTagList }">
						<span class="tag-list">${tag }</span>
						</c:forEach>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	</c:if>
</section>
<%@include file="/WEB-INF/views/userFooter.jsp" %>
<script type="text/javascript" src="../js/userHeader.js"></script>
</body>
</html>