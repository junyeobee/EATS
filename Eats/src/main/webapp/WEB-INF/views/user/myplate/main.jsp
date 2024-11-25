<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EATS - MY PLATE</title>
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
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	font-family: "Noto Sans KR", sans-serif;
}
body{
	position: relative;
}
.myplate-wrapper{
	display: flex;
	width: 90%;
	margin:50px auto 150px auto;
	justify-content: center;
}
/*메뉴바*/
/* 메뉴바를 포함한 첫 번째 section만 sticky 적용 */
.myplate-wrapper:first-of-type {
    position: sticky;
    top: 0;
    z-index: 100;
    background-color: #fff; /* 필요한 경우 배경색 지정 */
}
.myplate-wrapper .menu-bar{
	width:80%;
	display: flex;
	list-style: none;
	justify-content: flex-start;
	padding: 20px 40px;
	background-color: #f3553c;
	border: 0;
	border-radius: 10px;
	gap: 10px;
}
.myplate-wrapper .menu-bar li{
	padding: 0px;
}
.myplate-wrapper .menu-bar li a:hover{
	background-color: #fefefe;
	color:#f3553c;
	opacity: 0.7;
}
.myplate-wrapper .menu-bar li a{
	text-decoration: none;
	color: #fefefe;
	font-size: 18px;
	padding: 10px 20px;
	border-radius: 10px;
}
/* 활성화된 메뉴 스타일 추가 */
.myplate-wrapper .menu-bar li.active a{
    background-color: #fefefe;
    color: #f3553c;
    font-weight: bold;
    opacity: 1;
}

/*먹캘린더*/
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
	height: 500px;
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

/*나의 예약*/
.myplate-wrapper .reserve-wrapper{
	width: 90%;
}
.tab-wrap .tab-list{
	display: flex;
	font-size: 0;
	gap:10px;
	margin-left: 2%;
}
.tab-wrap .tab-list li{
	display: inline-block;
	padding: 10px 20px;
	border: 2px solid #f3553c;
	font-size: 18px;
	background-color: #fefefe;
	color: #f3553c;
	border-radius: 30px;
}
.tab-wrap .tab-list li:hover{
	background-color: #ffe8e4;
}
.tab-wrap .tab-list li.on{
	background-color:#f3553c;
}
.tab-wrap .tab-list li a{
	color:none;
	text-decoration: none;
}
.tab-wrap .tab-list li .state-list{
	color: #f3553c;
}
.tab-wrap .tab-list li.on .state-list{
	color: #fefefe;
}
.tab-contents{
	padding: 30px 40px;
	width: 100%;
}
.tab-contents .tab-panel{
	width: 100%;
}
.tab-contents .tab-panel .reserve-cnt{
	font-size: 20px;
}
.tab-contents img{
	width: 100px;
}
.reserve-list{
	width: 100%;
	list-style: none;
	margin: 10px auto;
}
.reserve-list .list-item{
	display: flex;
    flex-direction: column;
    border: 2px solid #f3553c;
    border-radius: 10px;
    padding-left: 15px;
    /* margin: 15px auto; */
    cursor: pointer;
    width: 90%;
    margin-top: 15px;
}
.reserve-list .list-item .info-top{
	display: flex;
	gap: 20px;
	padding: 20px 0px;
	align-items: center;
}
.reserve-list .list-item .info-top .d-day{
	font-size: 20px;
}
.reserve-list .list-item .info-top .cancle{
	border: 1px solid #f3553c;
	border-radius: 30px;
	padding: 10px 20px;
}
.reserve-list .list-item .info-bottom{
	display: flex;
}
.reserve-list .list-item .info-bottom .store-img-wrap{
	width: 20%;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
}
.reserve-list .list-item .info-bottom .store-img-wrap img{
	width: 100%;
}
.reserve-list .list-item .info-bottom .text-area{
	display:flex;
	flex-direction: row;
	gap:15px;
}
.reserve-list .list-item .info-bottom .text-area ul{
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
}
.reserve-list .list-item .info-bottom .text-area ul li{
    display: flex;
    flex-direction: row;
    gap:10px;
    border:0;
}
.reserve-list .list-item .info-bottom .text-area ul .store-name{
	font-size: 20px;
}
.reserve-list .list-item .info-bottom .text-area ul li img{
	width:30px;
}
.rev-btn{
	width: 90%;
    margin: 20px auto;
    padding: 15px;
    background-color: #f3553c;
    border: 0;
    border-radius: 10px;
    color: #fefefe;
    font-size: 15px;
    z-index: 100;
}
.rev-btn-n{
	width: 90%;
    margin: 20px auto;
    padding: 15px;
    background-color: #fefefe;
    border: 2px solid #f3553c;
    border-radius: 10px;
    color: #f3553c;
    font-size: 15px;
}
.tab-contents .tab-panel{
	display: none;
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
    justify-content: space-evenly;
    align-items: center;
    padding: 10px;
    margin-bottom: 10px;
}

.calendar-header button {
	padding: 5px 10px;
    background: #fff;
    border: 0;
    border-radius: 4px;
    cursor: pointer;
    font-size: 25px;
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
    height: 90%;
}

th, td {
    text-align: center;
    padding: 10px;
    /* border: 1px solid #ddd; */
}

th {
    font-weight: bold;
    border-bottom: 1px solid black;
    padding-bottom: 20px;
}

td.selectable {
    cursor: pointer;
}

td.selectable:hover {
    background: #f3553c;
    opacity: 0.8;
    color: #fefefe;
    border-radius: 10% 50% 50% 10%;
}

td.selected {
    background: #f3553c;
    color: #fefefe;
    border-radius: 10% 50% 50% 10%;
}

td.selected:hover {
    background: #f3553c;
    border-radius: 10% 50% 50% 10%;
    opacity: 0.8;
}

td:empty {
    /* background: #f9f9f9; */
}

hr{
	width: 81%;
    margin: 50px auto;
    border: 1px solid #f3553c;
    border-radius: 10px;
}

h2{
	margin-left: 12%;
    font-size: 20px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/userHeader.jsp" %>
<section class="myplate-wrapper">
	<ul class="menu-bar">
		<li>
			<a href="#muk-calendar"><span>먹캘린더</span></a>
		</li>
		<li>
			<a href="#my-reserve"><span>나의 예약</span></a>
		</li>
		<li>
			<a href="#my-alarm"><span>나의 알림 신청</span></a>
		</li>
	</ul>
</section>
<section class="myplate-wrapper" id="muk-calendar">
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
<hr>
<h2>나의 예약</h2>
<section class="myplate-wrapper" id="my-reserve">
	<div class="reserve-wrapper">
		<div class="tab-wrap">
			<ul class="tab-list">
				<li class="on">
					<a href="#panel_0">
						<span class="state-list">방문예정</span>
					</a>
				</li>
				<li>
					<a href="#panel_1">
						<span class="state-list">방문완료</span>
					</a>
				</li>
				<li>
					<a href="#panel_2">
						<span class="state-list">취소/노쇼</span>
					</a>
				</li>
			</ul>
			<div class="tab-contents">
				<c:set var="rList" value="${reserveList }"></c:set>
				<!-- 방문예정 리스트 (s) -->
				<div class="tab-panel" id="panel_0">
					<span class="reserve-cnt">총 ${readyCnt}건</span>
					<ul class="reserve-list">
					<c:forEach var="r" items="${rList }">
						<c:if test="${r.RESERVE_STATE eq 0 || r.RESERVE_STATE eq 1}">
						<li class="list-item">
							<div class="info-top">
								<span class="d-day">D-${r.D_DAY eq 0 ? "DAY":r.D_DAY }</span>
								<span class="cancle">${r.D_DAY <= 3 ? "취소불가":"취소가능" }</span>
							</div>
							<div class="info-bottom" data-idx="${r.RESERVE_IDX }">
								<div class="store-img-wrap">
									<img src="../img/storeUploadImg/${r.STORE_IMG }">
								</div>
								<div class="text-area">
									<ul>
										<li class="store-name">${r.STORE_NAME }</li>
										<li class="reserve-info">
											<img src="../img/user/storeInfo/cal_icon.png">
											<span>${r.RESERVE_DATE }</span>
										</li>
										<li class="reserve-info">
											<img src="../img/user/storeInfo/watch_icon.png">
											<span>${r.RESERVE_TIME }</span>
										</li>
										<li class="reserve-info">
											<img src="../svg/group_icon.svg">
											<span>${r.RESERVE_COUNT }명</span>
										</li>
									</ul>
								</div>
							</div>
						</li>
						</c:if>
					</c:forEach>
					</ul>
				</div>
				<!-- 방문예정 리스트 (e) -->
				<!-- 방문완료 리스트 (s) -->
				<div class="tab-panel" id="panel_1">
					<span class="reserve-cnt">총 ${finCnt }건</span>
					<ul class="reserve-list">
					<c:forEach var="r" items="${rList }">
						<c:if test="${r.RESERVE_STATE eq 3 }">
						<li class="list-item">
							<div class="info-bottom" data-idx="${r.RESERVE_IDX }">
								<div class="store-img-wrap">
									<img src="../img/storeUploadImg/${r.STORE_IMG }">
								</div>
								<div class="text-area">
									<ul>
										<li class="store-name">${r.STORE_NAME }</li>
										<li class="reserve-info">
											<img src="../img/user/storeInfo/cal_icon.png">
											<span>${r.RESERVE_DATE }</span>
										</li>
										<li class="reserve-info">
											<img src="../img/user/storeInfo/watch_icon.png">
											<span>${r.RESERVE_TIME }</span>
										</li>
										<li class="reserve-info">
											<img src="../svg/group_icon.svg">
											<span>${r.RESERVE_COUNT }명</span>
										</li>
									</ul>
								</div>
							</div>
							<div class="btn-area">
								<c:if test="${r.REV_EXIST eq false }">
								<input type="button" class="rev-btn" value="리뷰 쓰러 가기" onclick="location.href='/user/writeReview?reserve_idx=${r.RESERVE_IDX}'">
								</c:if>
								<c:if test="${r.REV_EXIST eq true }">
								<input type="button" class="rev-btn-n" value="리뷰 작성 완료">
								</c:if>
							</div>
						</li>
						</c:if>
					</c:forEach>
					</ul>
				</div>
				<!-- 방문완료 리스트 (e) -->
				<!-- 취소/노쇼 리스트 (s) -->
				<div class="tab-panel" id="panel_2">
					<span class="reserve-cnt">총 ${cancledCnt }건</span>
					<ul class="reserve-list">
					<c:forEach var="r" items="${rList }">
						<c:if test="${r.RESERVE_STATE eq 2 || r.RESERVE_STATE eq 4}">
						<li class="list-item">
							<div class="info-top">
								<span class="cancle">${r.RESERVE_STATE eq 2 ? "취소":"노쇼" }</span>
							</div>
							<div class="info-bottom" data-idx="${r.RESERVE_IDX }">
								<div class="store-img-wrap">
									<img src="../img/storeUploadImg/${r.STORE_IMG }">
								</div>
								<div class="text-area">
									<ul>
										<li class="store-name">${r.STORE_NAME }</li>
										<li class="reserve-info">
											<img src="../img/user/storeInfo/cal_icon.png">
											<span>${r.RESERVE_DATE }</span>
										</li>
										<li class="reserve-info">
											<img src="../img/user/storeInfo/watch_icon.png">
											<span>${r.RESERVE_TIME }</span>
										</li>
										<li class="reserve-info">
											<img src="../svg/group_icon.svg">
											<span>${r.RESERVE_COUNT }명</span>
										</li>
									</ul>
								</div>
							</div>
						</li>
						</c:if>
					</c:forEach>
					</ul>
				</div>
				<!-- 취소/노쇼 리스트 (e) -->
			</div>
		</div>
	</div>
</section>
<hr>
<h2>나의 알림신청</h2>
<section class="myplate-wrapper" id="my-alarm">
	<div class="alarm-wrap">
		<c:if test="${empty alarmList }">
		<p>신청 내역이 없습니다.</p>
		</c:if>
		<ul class="reserve-list">
			<c:forEach var="a" items="${alarmList }">
				<li class="list-item">
					<div class="info-bottom" data-idx="${a.s_alarm_idx }">
						<div class="store-img-wrap">
							<img src="../img/storeUploadImg/${a.store_img }">
						</div>
						<div class="text-area">
							<ul>
								<li class="store-name">${a.store_name }</li>
								<li class="reserve-info">
									<img src="../img/user/storeInfo/cal_icon.png">
									<span>${a.s_alarm_date }</span>
								</li>
								<li class="reserve-info">
									<img src="../img/user/storeInfo/watch_icon.png">
									<span>${a.s_alarm_time }</span>
								</li>
								<li class="reserve-info">
									<img src="../svg/group_icon.svg">
									<span>${a.s_alarm_count }명</span>
								</li>
							</ul>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</section>
<%@include file="/WEB-INF/views/userFooter.jsp" %>
</body>
<script>
document.addEventListener('DOMContentLoaded', function() {
	  const tabList = document.querySelectorAll('.tab-list li');
	  const tabPanels = document.querySelectorAll('.tab-panel');
	  
	  // 초기 상태 설정 (첫 번째 탭만 보이게)
	  tabPanels.forEach(panel => panel.style.display = 'none');
	  tabPanels[0].style.display = 'block';
	  
	  tabList.forEach(tab => {
	    tab.addEventListener('click', function(e) {
	      e.preventDefault();
	      
	      // 모든 탭에서 'on' 클래스 제거
	      tabList.forEach(t => t.classList.remove('on'));
	      // 클릭한 탭에 'on' 클래스 추가
	      this.classList.add('on');
	      
	      // 모든 패널 숨기기
	      tabPanels.forEach(panel => panel.style.display = 'none');
	      
	      // 클릭한 탭에 해당하는 패널 보이기
	      const targetId = this.querySelector('a').getAttribute('href');
	      document.querySelector(targetId).style.display = 'block';
	    });
	  });
});

document.addEventListener('DOMContentLoaded', function() {
    const menuItems = document.querySelectorAll('.menu-bar li');
    
    // 클릭 이벤트 처리
    menuItems.forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            
            // 모든 메뉴에서 active 클래스 제거
            menuItems.forEach(menu => menu.classList.remove('active'));
            
            // 클릭된 메뉴에 active 클래스 추가
            this.classList.add('active');
            
            // 해당 섹션으로 스크롤
            const targetId = this.querySelector('a').getAttribute('href').substring(1);
            const targetSection = document.getElementById(targetId);
            if(targetSection) {
                targetSection.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });
    
    // 스크롤
    window.addEventListener('scroll', function() {
        const sections = document.querySelectorAll('section');
        const scrollPos = window.pageYOffset || document.documentElement.scrollTop;
        
        sections.forEach((section, index) => {
            const top = section.offsetTop;
            const height = section.offsetHeight;
            
            if(scrollPos >= top && scrollPos < top + height) {
                menuItems.forEach(menu => menu.classList.remove('active'));
                menuItems[index].classList.add('active');
            }
        });
    });
});

var reserveItems=document.querySelectorAll('.info-bottom');

	reserveItems.forEach(item=>{
		item.addEventListener('click', function(){
			location.href='/user/reserveInfo?reserve_idx='+this.dataset.idx;
		});
	});
</script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript" src="../js/userHeader.js"></script>
<script type="text/javascript" src="/js/myplate/myplateCal.js"></script>
</html>