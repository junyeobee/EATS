<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*스터닝 산스*/
@font-face {
    font-family: 'STUNNING-Bd';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-2@1.0/STUNNING-Bd.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
/*프리텐다드*/
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 800;
    font-style: normal;
}
h2{
	margin-top: 20px;
	font-size: 20px;
}
.reserve-confirm-wrapper{
	font-family: 'STUNNING-Bd';
	width:70%;
	margin:30px auto;
	border-radius: 10px;
	background-color: #FECBC3;
}
.reserve-confirm-wrapper .content-wrapper{
	width:90%;
	padding-top:15px;
	margin:20px auto;
}
.reserve-confirm-wrapper .content-wrapper .contents{
	width: 100%;
	background-color: #fefefe;
	border-radius: 10px;
}
.reserve-confirm-wrapper .content-wrapper .contents{
	width: 90%;
	padding:20px;
}
table{
	width:100%;
}
.reserve-confirm-wrapper .content-wrapper .contents table td:first-child {
	width:30%;
	padding:10px 0px;
}
.reserve-confirm-wrapper .content-wrapper .contents table td:first-child div{
	display: flex;
    align-items: center;
    justify-content: space-evenly;
}
img{
	width: 20px;
}
.req-txt{
	width:90%;
	background-color: #fefefe;
	border-radius: 10px;
	border: 0;
	padding: 20px;
    margin-bottom: 20px;
    font-family: 'Pretendard-Regular';
    font-size: 12px;
    outline: none;
}
.btn-reserve{
	background-color: #f3553c;
    padding: 10px;
    border: 0;
    border-radius: 10px;
    text-align: center;
    font-size: 15px;
    color: #fefefe;
    width: 95%;
    margin: 0px auto 20px auto;
}
</style>
<link rel="stylesheet" href="/css/user/userHeader.css">
</head>
<body>
<%@include file="/WEB-INF/views/userHeader.jsp" %>
<section>
	
	<div class="reserve-confirm-wrapper">
		<div class="content-wrapper">
			<h2>예약 내용이 맞나요?</h2>
			<div class="contents">
				<table>
					<tr>
						<td>
							<div>
								<img src="/img/user/storeInfo/cal_icon.png">
								<span>예약 날짜</span>
							</div>
						</td>
						<td><span id="reserve_date">${reserve_date }</span></td>
					</tr>
					<tr>
						<td>
							<div>
								<img src="/img/user/storeInfo/watch_icon.png">
								<span>예약 시간</span>
							</div>
						</td>
						<td><span id="reserve_time">${reserve_time }</span></td>
					</tr>
					<tr>
						<td>
							<div>
								<img src="/svg/group_icon.svg">
								<span>예약 인원</span>
							</div>
						</td>
						<td><span id="reserve_count">${reserve_cnt }</span><span>명</span></td>
					</tr>
					<tr>
						<td>
							<div>
								<img src="/img/user/storeInfo/table_icon.png">
								<span>좌석 유형</span>
							</div>
						</td>
						<td><span id="reserve_table">${reserve_table }</span></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="content-wrapper">
			<h2>요청사항이 있으면 적어주세요</h2>
			<textarea rows="10" cols="10" class="req-txt" id="request"></textarea>
		</div>
		<div class="content-wrapper">
			<form name="reserve_form" action="/user/makeReserve">
				<input type="hidden" value="${user_idx }" name="user_idx" id="user_idx">
				<input type="hidden" value="${store_idx }" name="store_idx" id="store_idx">	
				<input type="hidden" name="reserve_date" value="${reserve_date }">
				<input type="hidden" name="reserve_time" value="${reserbe_time }">
				<input type="hidden" name="reserve_count" value="${reserve_count }">
				<input type="hidden" name="reserve_table" value="${reserve_table }">
				
 				<input type="button" value="예약하기" class="btn-reserve" onclick="makeReserve()">
			</form>			
			
		</div>
	</div>
	
</section>
</body>
<script>
function makeReserve(){
	//var user_idx=document.getElementById('user_idx').value;
	var store_idx=document.getElementById('store_idx').value;
	var reserve_date=document.getElementById('reserve_date').firstChild.nodeValue;
	var reserve_time=document.getElementById('reserve_time').firstChild.nodeValue;
	var reserve_count=document.getElementById('reserve_count').firstChild.nodeValue;
	var reserve_table=document.getElementById('reserve_table').firstChild.nodeValue;
	var request=document.getElementById('request').value;
	if(store_idx && reserve_date && reserve_time && reserve_count && reserve_table && request){
		var param='?store_idx='+store_idx+'&reserve_date='+reserve_date+'&reserve_time='+reserve_time+'&reserve_count='+reserve_count+'&reserve_table='+reserve_table+'&request='+request;
		//alert(param);
		location.href='resPayment'+param;
	}
}
</script>
</html>