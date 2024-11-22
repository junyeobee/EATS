<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/user/userHeader.css">
<style>
.content-wrapper{
	display: flex;
	width: 90%;
	margin:50px auto 150px auto;
	justify-content: center;
}
.reserve-info{
	display: flex;
	border: 2px solid #f3553c;
	border-radius: 10px;
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
}
.reserve-info .text-area ul{
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
}
.reserve-info .text-area ul li{
    display: flex;
    flex-direction: row;
    gap:10px;
    border:0;
}
.reserve-info .text-area ul .store-name{
	font-size: 20px;
}
.reserve-info .text-area ul li img{
	width:30px;
}
.state{
	color:#f3553c;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/userHeader.jsp" %>
<section class="content-wrapper">
	<c:set var="r" value="${reserveDTO }"></c:set>
	<div class="reserve-info">
		<div class="store-img-wrap">
			<img src="${r.store_img }">
		</div>
		<div class="text-area">
			<ul>
				<li class="store-name">${r.store_name }</li>
				<li class="reserve-info">
					<img src="../img/user/storeInfo/cal_icon.png">
					<span>${r.reserve_date }</span>
				</li>
				<li class="reserve-info">
					<img src="../img/user/storeInfo/watch_icon.png">
					<span>${r.reserve_time }</span>
				</li>
				<li class="reserve-info">
					<img src="../svg/group_icon.svg">
					<span>${r.reserve_count }명</span>
				</li>
				<li class="reserve-info, state">${state }</li>
			</ul>
		</div>
	</div>
</section>
</body>
<script type="text/javascript" src="../js/userHeader.js"></script>
</html>