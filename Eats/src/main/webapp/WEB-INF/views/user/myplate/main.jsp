<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EATS - MY PLATE</title>
<link rel="stylesheet" href="/css/user/userHeader.css">
<style>
.myplate-wrapper{
	display: flex;
	width: 90%;
	margin:50px auto;
	justify-content: space-evenly;
}
.myplate-wrapper .cal-wrapper{
	width: 40%;
	/*border:1px solid black;*/
}
.myplate-wrapper .info-wrapper p{
	width:90%;
	margin:10px auto;
}
#calendar{
	/*border:1px solid black;*/
	width:90%;
	margin:10px auto;
	height: fit-content;
}
.myplate-wrapper div{
	border-radius:10px;
}
.myplate-wrapper .info-wrapper{
    width: 40%;
    /* border: 1px solid black; */
    display: flex;
    flex-direction: column;
    gap: 10px;
    padding: 5px 0px;
    justify-content: center;
}
.myplate-wrapper .info-wrapper .reserve-box{
	width:90%;
	background-color: #FFF8EB;
	margin:0px auto;
	height: 45%;
}
.myplate-wrapper .info-wrapper .reserve-box div:first-child{
	margin: 10px;
    display: flex;
    align-items: center;
    gap: 10px;
}  
.myplate-wrapper .info-wrapper .reserve-box img, .myplate-wrapper .info-wrapper .alarm-box img{
	width:20px;
}
.myplate-wrapper .info-wrapper .alarm-box{
	width:90%;
	background-color: #FECBC3;
	margin: 0px auto;
	height: 45%;
}
.myplate-wrapper .info-wrapper .alarm-box div:first-child{
	margin: 10px;
    display: flex;
    align-items: center;
    gap: 10px;
}
</style>

<!-- 달력 -->
<style>
.calendar {
    width: 300px;
    margin: 0 auto;
    font-family: Arial, sans-serif;
}

.calendar-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    background: #f0f0f0;
    margin-bottom: 10px;
}

.calendar-header button {
    padding: 5px 10px;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    cursor: pointer;
}

.calendar-header button:hover {
    background: #f8f8f8;
}

.calendar-header h2 {
    margin: 0;
    font-size: 1.2em;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    text-align: center;
    padding: 10px;
    border: 1px solid #ddd;
}

th {
    background: #f5f5f5;
    font-weight: bold;
}

td.selectable {
    cursor: pointer;
}

td.selectable:hover {
    background: #f0f0f0;
}

td.selected {
    background: #007bff;
    color: white;
}

td.selected:hover {
    background: #0056b3;
}

td:empty {
    background: #f9f9f9;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/userHeader.jsp" %>
<section class="myplate-wrapper">
	<div class="cal-wrapper">
		
		<div id="calendar"></div>
	</div>
	<div class="info-wrapper">
		<p id="selected_date"></p>
		<div class="reserve-box">
			<div>
				<img src="/img/user/storeInfo/cal_icon.png">
				<span>예약</span>
			</div>
		</div>
		<div class="alarm-box">
			<div>
				<img src="/img/user/storeInfo/bell_icon.png">
				<span>알림신청</span>
			</div>
		</div>
	</div>
</section>
<section class="myplate-wrapper">
	
</section>
</body>
<script type="text/javascript" src="/js/myplate/myplateCal.js"></script>
<script type="text/javascript" src="/js/userHeader.js"></script>
</html>