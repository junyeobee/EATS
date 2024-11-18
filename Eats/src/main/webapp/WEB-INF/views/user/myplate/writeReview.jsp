<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/user/userHeader.css">
<style>
/* reset */
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
}

article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
html {
	font-family: SpoqaHanSansNeo, -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen",
		"Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue",
		'Noto Sans KR','Nanum Gothic', sans-serif;
	font-weight: 400;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
html, body{
	margin:auto;
	line-height:1.5;
}
body {
	-webkit-text-size-adjust:none; 
	text-size-adjust:none;
	color: #000;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

/* common */
* {
	box-sizing: border-box;
	padding: 0px;
	margin: 0px;    
	outline: none;
}
a {
	margin: 0px;
	text-decoration: none;
	color: inherit;
}
button {
	border: 0;
	cursor: pointer;
	font-family: inherit;
}
ul {
	list-style: none;
	padding: 0;
	margin: 0;
}
.blind {
	display:inline-block; 
	position:absolute !important; 
	width:1px; height:1px; 
	margin:-1px; border:0; 
	overflow:hidden; 
	clip:rect(1px, 1px, 1px, 1px); 
	clip-path:inset(50%);
}

#content {
	position: relative;
	max-width: 1190px;
	margin: 0 auto 63px auto;
}

#content.flex {
	display: flex;
	justify-content: space-between;
}
@charset "utf-8";

/* header */
header {width: 100%; height: 103px; box-shadow: 0px 5px 10px rgba(0,0,0,0.12);}
header .inner {position: relative; display: flex; justify-content: right; align-items: center; max-width: 1190px; height: 100%; margin:0 auto;}
header .inner .logo {position: absolute; top: 50%; left: 50%; transform:translate(-50%,-50%);}
header .inner .user-area {display: flex; flex-direction: column; justify-content: center; height: 74px; padding-left: 92px; background: url(../images/img_user.png) no-repeat left center;}
header .inner .user-area .user {display: inline-block; max-width: 84px;  overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; font-size: 21px;}
header .inner .user-area .noti {font-size: 16px;}

/* contents */
.content-wrap {display: inline-block; width: 836px;}
.store-wrap {position: relative; margin-top: 42px;}

.store-wrap .tit-area {padding-right: 90px;}
.store-wrap .tit-area .tit {font-size: 40px;}
.store-wrap .tit-area .cate {display: inline-block; padding-left: 15px; font-size: 0;}
.store-wrap .tit-area .cate span {display: inline-block; font-size: 24px;}
.store-wrap .tit-area .cate span + span {position: relative; padding-left: 18px;}
.store-wrap .tit-area .cate span + span:before {content: ''; position: absolute; bottom: 0; left: 7px; width: 2px; height: 18px; background: #000; transform: translateY(-50%);}

.store-wrap .info {font-size: 24px;}
.store-wrap .info > span {display: inline-block;}
.store-wrap .info .start {padding-left: 30px; background: url(../images/icon_star.png) no-repeat left center;}
.store-wrap .info .review {padding-left: 20px;}
.store-wrap .recommend {position: absolute; top: 10px; right: 0; padding-left: 42px; background: url(../images/icon_fork.png) no-repeat left center; color: #ff533e; font-size: 24px; font-weight: 500;}

/* 가게 이미지 스와이프 */
.swp-store {height: 470px; margin-top: 20px; border: 1px solid #000;}
.swp-store .swiper-button-next, .swiper-button-prev {color: #000;}

/* bg 공통 박스 */
.bg-box {margin: 35px 0; padding: 15px; border-radius: 12px; background: #FFF8EB;}
.bg-box .inner {padding: 15px; border-radius: 12px; background: #fff;}
.bg-box .inner + .inner {margin-top: 24px;}
.bg-box .inner .tit {font-size: 24px; font-weight: 700;}
.bg-box .inner .desc {margin-top: 10px; font-size: 20px; font-weight: 700;}
.bg-box .inner .convenience-list li {display: inline-block; margin: 12px 12px 0 0; padding: 5px 15px; border: 1.5px solid #DFDFDF; border-radius: 40px; background:#fff; text-align: center;}

.bg-box .inner.txt {padding: 15px 38px;}
.bg-box.bg1 {background: rgba(243, 85, 60, 0.15);}
.bg-box.lg {padding: 30px;}

/* 아코디언 */
.acco-wrap .acco-head {font-size: 0;}
.acco-wrap .acco-head .btn-acco {position: relative; display: inline-block; padding-right: 36px; font-size: 24px;}
.acco-wrap .acco-head .btn-acco:after {content:''; position: absolute; right: 0; top: 50%; width: 20px; height: 20px; background: url(../images/icon_down.png) no-repeat center center; transform: translateY(-45%); transform-origin: center center;}
.acco-wrap .acco-head .btn-acco.on:after {transform: translateY(-45%) rotate(180deg);}
.acco-wrap .acco-head i {display: inline-block; width: 20px; height: 20px;}
.acco-wrap .acco-head i.map {background: url(../images/icon_map.png) no-repeat left center;}
.acco-wrap .acco-head i.clock {position: relative; top: 2px; background: url(../images/icon_clock.png) no-repeat left center;}
.acco-wrap .acco-body {display: none; margin-top: 5px; padding-left: 26px; font-size: 18px;}

.acco-wrap .acco-body .addr-list {display: block; width: 495px; padding: 16px; border: 1px solid rgba(0,0,0,0.5); border-radius: 10px;}
.acco-wrap .acco-body .addr-list li {display: flex;}
.acco-wrap .acco-body .addr-list li + li {margin-top: 5px;}
.acco-wrap .acco-body .addr-list li .item {flex-basis: 85px; flex-shrink: 0;}
.acco-wrap + .desc {padding-left: 26px; margin-top: 20px; font-size: 18px;}

.acco-wrap .acco-body .time-list {display: block;}
.acco-wrap .acco-body .time-list li {display: flex; font-size: 20px;}
.acco-wrap .acco-body .time-list li .item {flex-basis: 28px;}

/* 공지사항 스와이프 */
.swp-noti {position: relative; padding-bottom: 49px;}
.swp-noti .swiper-pagination-bullets .swiper-pagination-bullet {width: 10px; height: 10px; background: #ff533e;}
.swp-noti .btn-area {margin-top: 15px; text-align: center;}
.swp-noti .btn-area .btn-more {display: inline-block; padding: 5px 15px; border-radius: 10px; background: #FFF8EB; color:#5f420f; font-size: 14px; font-weight: 500;}

/* 리뷰 버튼 */
.btn-review {display: block; padding: 25px; border-radius: 10px; font-size: 24px; font-weight: 700; background: #FFF8EB; text-align: center;}

/* 공통 탭 */
.tab-wrap {padding: 10px 37px;}
.tab-wrap .tab-list {margin-bottom: 20px; font-size: 0;}
.tab-wrap .tab-list li {display: inline-block; padding: 8px 28px; border:2px solid orange; border-radius: 20px; font-size: 14px; font-weight: 500;}
.tab-wrap .tab-list li + li {margin-left: 24px;}
.tab-wrap .tab-list li.on {background: orange; color: #fff; font-weight: 700;}
.tab-wrap .tab-contents .tab-panel {display: none;}

.tab-wrap .tab-contents .menu-list li {display: flex; padding: 24px 20px; background: #fff;}
.tab-wrap .tab-contents .menu-list li img {margin-right: 20px;}
.tab-wrap .tab-contents .menu-list li .txt-area {position: relative;}
.tab-wrap .tab-contents .menu-list li .txt-area strong {display: block; padding-right: 62px; font-size: 20px; font-weight: 500;}
.tab-wrap .tab-contents .menu-list li .txt-area .price {position: absolute; top: 4px; right: 0; font-size: 15px; font-weight: 500;}
.tab-wrap .tab-contents .menu-list li .txt-area p {margin-top: 18px; font-size: 15px; font-weight: 500;}
.tab-wrap .tab-contents .menu-list li + li {margin-top: 32px;}
.tab-wrap .tab-contents .btn-menu-more {display: none; width: 100%; margin-top: 28px; padding: 18px 0; border-radius: 10px; background: orange; font-size: 24px; font-weight: 700; color: #fff; text-align: center;}

.tab-wrap.type1 {padding: 0;}

/* 오른쪽 예약 영역 */
.reservation {position: sticky; top: 0; right: 0; display: inline-block; min-width: 328px; width: 328px;  height: 742px; margin-top: 24px; background: #999;}


/************************ 리뷰 페이지 (s) ************************/
#content > section {margin: 60px 0;}
#content > section .tit-area {display: flex; align-items: center;}
#content > section textarea {display: block; width: 100%; height: 250px; padding: 24px; border: 1px solid #000; font-size: 20px;}
#content > section textarea::placeholder {color: #757575; font-size: 20px; font-weight: 700;}
#content > .btn-area {display: inline-block; width: 100%; margin-top: 45px; padding: 28px 0; border-radius: 10px; background: #ff533e; color: #fff; font-size: 24px; font-weight: 700; text-align: center;}

.tit-h2 {color: #000; font-size: 20px; font-weight: 700;}
.tit-area {margin-bottom: 30px;}

.ipt-start {position:relative; width:260px; height: 38px; margin-left: 40px; font-size:0; z-index:0; background:url(../images/img_start.png) no-repeat 0 -44px;}
.ipt-start .ipt {position: absolute; top: auto; margin: 0; padding: 0; opacity: 0; z-index: -1;}
.ipt-start .ipt + label {position: static; display: inline-block; width: 37px; height: 35px; margin-right: 15px; padding-left: 0; box-sizing: border-box; cursor: pointer;}
.ipt-start .ipt + label:after {content:''; position:absolute; width: 0; top:0; left:0; bottom:0; background:url(../images/img_start.png) no-repeat 0 0; z-index:-1;}
.ipt-start .ipt:nth-of-type(1):checked + label:after {width: 20%;}
.ipt-start .ipt:nth-of-type(2):checked + label:after {width: 40%;}
.ipt-start .ipt:nth-of-type(3):checked + label:after {width: 60%;}
.ipt-start .ipt:nth-of-type(4):checked + label:after {width: 80%;}
.ipt-start .ipt:nth-of-type(5):checked + label:after {width: 100%;}

.info-box {display: flex; padding: 28px 32px; border: 2px solid orange; border-radius: 15px; background: #fff;}
.info-box .img {margin-right: 20px;}
.info-box .img img {width: 190px; height: auto;}

.info-box .info .tit {font-size: 24px; font-weight: 500;}

.info-box .info ul {margin-top: 8px;}
.info-box .info ul li {color: #757575; font-size: 16px; font-weight: 700;}
.info-box .info ul li + li {margin-top: 5px;}
.info-box .info ul li i {display: inline-block; width: 18px; height: 18px; margin-right: 8px; background: url(../images/icon_calendar.png) no-repeat left center;}
.info-box .info ul li i.clock {background-image: url(../images/icon_clock_s.png);}
.info-box .info ul li i.people {background-image: url(../images/icon_people.png);}
.info-box .info .state {display: inline-block; margin-top: 12px; color: #ff533e; font-size: 20px; font-weight: 600;}

.label-file .btn-upload {display: inline-block; padding: 14px 68px; border-radius: 10px; background: orange; color: #fff; font-size: 20px; font-weight: 600; text-align: center;}
.label-file + input {position:static; width:1px; height:1px; clip:rect(0 0 0 0); overflow:hidden;}
.img-box {margin-top: 18px; padding: 0 18px 18px 18px; border: 1px solid #000; font-size: 0;}
.img-box .img {display: inline-block; width: 215px; height: 270px; margin: 18px 18px 0 0; background: #999;}

.list-check {display: flex; flex-wrap: wrap; padding: 4px 0 30px;}
.list-check li {margin: 26px 16px 0 0;}
.list-check li input[type=checkbox] {position: absolute; top: auto; margin: 0; padding: 0; opacity: 0; z-index: -1;}
.list-check li input[type=checkbox] + label {display: inline-block; padding: 8px 21px; border: 2px solid orange; border-radius: 20px; font-size: 14px; font-weight: 500; cursor: pointer;}
.list-check li input[type=checkbox]:checked + label {background: orange; color: #fff;}

.list-check.type1 li input[type=checkbox] + label {border-color: #ff533e; color: #ff533e;}
.list-check.type1 li input[type=checkbox]:checked + label {background: #ff533e; color: #fff;}

.btn-group {font-size: 0;}
.btn-group button {display: inline-block; margin: 20px 18px 0 0; padding: 8px 28px; border-radius: 20px; color: #fff; font-size: 14px; font-weight: 500; background: orange;}
.btn-group.type1 button {background: #ff533e;}

/************************ 리뷰 페이지 (e) ************************/
</style>
</head>
<body>
<%@include file="/WEB-INF/views/userHeader.jsp" %>
	<section id="content">
		<!-- 별점 영역 (s) -->
		<section>
			<div class="tit-area">
				<h2 class="tit-h2">파브리키친에서의 경험은 어떠셨나요?</h2>
				<div class="ipt-start">
					<input type="radio" class="ipt" name="star_group" id="star1_1">
					<label for="star1_1"><span class="blind">5점만점에 1점</span></label>
					<input type="radio" class="ipt" name="star_group" id="star1_2">
					<label for="star1_2"><span class="blind">5점만점에 2점</span></label>
					<input type="radio" class="ipt" name="star_group" id="star1_3">
					<label for="star1_3"><span class="blind">5점만점에 3점</span></label>
					<input type="radio" class="ipt" name="star_group" id="star1_4">
					<label for="star1_4"><span class="blind">5점만점에 4점</span></label>
					<input type="radio" class="ipt" name="star_group" id="star1_5">
					<label for="star1_5"><span class="blind">5점만점에 5점</span></label>
				</div>
			</div>
			<div class="info-box">
				<div class="img"><img src="./resources/images/img_store.png" alt="가게 이미지"/></div>
				<div class="info">
					<strong class="tit">파브리 키친</strong>
					<ul>
						<li>
							<i class="calendar"></i>
							<span>2024. 11. 02</span>
						</li>
						<li>
							<i class="clock"></i>
							<span>13:00</span>
						</li>
						<li>
							<i class="people"></i>
							<span>2명</span>
						</li>
					</ul>
					<span class="state">방문완료</span>
				</div>
			</div>
		</section>
		<!-- 별점 영역 (e) -->

		<!-- 리뷰 작성 영역 (s) -->
		<section>
			<div class="tit-area">
				<h2 class="tit-h2">파브리키친에서의 경험을 공유해주세요!</h2>
			</div>
			<textarea title="파브리키친에서의 경험 내용 입력" placeholder="잇츠님의 경험을 작성해주세요!"></textarea>
		</section>
		<!-- 리뷰 작성 영역 (e) -->

		<!-- 사진 첨부 영역 (s) -->
		<section>
			<label for="file_1" class="label-file">
				<span class="btn-upload">사진 첨부하기</span>
			</label>
			<input type="file" id="file_1" title="사진 첨부하기" multiple>
			<div class="img-box">
				<div class="img"></div>
				<div class="img"></div>
				<div class="img"></div>
			</div>
		</section>
		<!-- 사진 첨부 영역 (e) -->

		<!-- 메뉴 선택 영역 (s) -->
		<section>
			<div class="tit-area">
				<h2 class="tit-h2">어떤 메뉴를 드셨나요?</h2>
			</div>
			<div class="bg-box lg">
				<div class="tab-wrap type1">
					<ul class="tab-list">
						<li class="on">
							<a href="#panel_1">
								<span class="tit">메인</span>
							</a>
						</li>
						<li>
							<a href="#panel_2">
								<span class="tit">디저트</span>
							</a>
						</li>
						<li>
							<a href="#panel_3">
								<span class="tit">음료</span>
							</a>
						</li>
					</ul>
					<div class="tab-contents">
						<div class="tab-panel" id="panel_1">
							<div class="inner pt-0 pb-0 bdr-0">
								<ul class="list-check">
									<li>
										<input type="checkbox" class="ipt" name="" id="chk1_1">
										<label for="chk1_1">PPP 파스타</label>
									</li>
									<li>
										<input type="checkbox" class="ipt" name="" id="chk1_2">
										<label for="chk1_2"> 라구파스타</label>
									</li>
									<li>
										<input type="checkbox" class="ipt" name="" id="chk1_3">
										<label for="chk1_3">스페차티노 디 만조</label>
									</li>
									<li>
										<input type="checkbox" class="ipt" name="" id="chk1_4">
										<label for="chk1_4">폴로 알라 피자이올라</label>
									</li>
									<li>
										<input type="checkbox" class="ipt" name="" id="chk1_5">
										<label for="chk1_5">리조또 아이풍기</label>
									</li>
									<li>
										<input type="checkbox" class="ipt" name="" id="chk1_6">
										<label for="chk1_6">판자넬라 디 뽈포</label>
									</li>
									<li>
										<input type="checkbox" class="ipt" name="" id="chk1_7">
										<label for="chk1_7">살시챠 까르보나라</label>
									</li>
								</ul>
							</div>
						</div>
						<div class="tab-panel" id="panel_2">
							<div class="inner pt-0 pb-0 bdr-0">
								<ul class="list-check">
									<li>
										<input type="checkbox" class="ipt" name="" id="chk2_1">
										<label for="chk2_1">디저트1</label>
									</li>
									<li>
										<input type="checkbox" class="ipt" name="" id="chk2_2">
										<label for="chk2_2">디저트2</label>
									</li>
								</ul>
							</div>
						</div>
						<div class="tab-panel" id="panel_3">
							<div class="inner pt-0 pb-0 bdr-0">
								<ul class="list-check">
									<li>
										<input type="checkbox" class="ipt" name="" id="chk3_1">
										<label for="chk3_1">음료1</label>
									</li>
									<li>
										<input type="checkbox" class="ipt" name="" id="chk3_2">
										<label for="chk3_2">음료2</label>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="btn-group"></div>
			</div>
		</section>
		<!-- 메뉴 선택 영역 (e) -->

		<!-- 단어 선택 영역 (s) -->
		<section>
			<div class="tit-area">
				<h2 class="tit-h2">파브리키친을 잘 표현한 단어는 무엇인가요? (5개까지 선택 가능)</h2>
			</div>
			<div class="bg-box lg bg1">
				<div class="inner pt-0 pb-0 bdr-0">
					<ul class="list-check type1">
						<li>
							<input type="checkbox" class="ipt" name="" id="chk4_1">
							<label for="chk4_1">맛있어요</label>
						</li>
						<li>
							<input type="checkbox" class="ipt" name="" id="chk4_2">
							<label for="chk4_2">친절해요</label>
						</li>
						<li>
							<input type="checkbox" class="ipt" name="" id="chk4_3">
							<label for="chk4_3">데이트</label>
						</li>
						<li>
							<input type="checkbox" class="ipt" name="" id="chk4_4">
							<label for="chk4_4">인테리어</label>
						</li>
						<li>
							<input type="checkbox" class="ipt" name="" id="chk4_5">
							<label for="chk4_5">사진이 잘 나와요</label>
						</li>
						<li>
							<input type="checkbox" class="ipt" name="" id="chk4_6">
							<label for="chk4_6">조용해요</label>
						</li>
						<li>
							<input type="checkbox" class="ipt" name="" id="chk4_7">
							<label for="chk4_7">따뜻한 분위기</label>
						</li>
						<li>
							<input type="checkbox" class="ipt" name="" id="chk4_8">
							<label for="chk4_8">화장실이 깨끗해요</label>
						</li>
						<li>
							<input type="checkbox" class="ipt" name="" id="chk4_9">
							<label for="chk4_9">음식이 빨리 나와요</label>
						</li>
						<li>
							<input type="checkbox" class="ipt" name="" id="chk4_10">
							<label for="chk4_10">건강한 맛이에요</label>
						</li>
						<li>
							<input type="checkbox" class="ipt" name="" id="chk4_11">
							<label for="chk4_11">현지맛에 가까워요</label>
						</li>
					</ul>
				</div>
				<div class="btn-group type1"></div>
			</div>
		</section>
		<!-- 단어 선택 영역 (s) -->

		<div class="btn-area">
			<a href="#" class="btn-submit">리뷰 등록하기</a>
		</div>
	</section>
</body>
<script type="text/javascript" src="../js/userHeader.js"></script>
<script type="text/javascript" src="../js/myplate/reviewWrite.js"></script>
<script>
$(document).ready(function(){
	/* 초기화 */ 
	$('.tab-contents .tab-panel').eq(0).show(); // 첫번째 탭 활성화
	tabInit();

	// 아코디언
	$('.acco-head .btn-acco').on('click', function(e){
		e.preventDefault();

		if ($(this).hasClass('on')) {
			$(this).removeClass('on');
			$(this).closest('.acco-wrap').find('.acco-body').stop().slideUp(150);
		} else {
			$(this).addClass('on');
			$(this).closest('.acco-wrap').find('.acco-body').stop().slideDown(150);
		}
	});

	// 메뉴 탭
	$('.tab-list li').on('click', function(e){
		e.preventDefault();
		var idx;

		if (!$(this).hasClass('on')){
			$('.tab-list li').removeClass('on');
			$(this).addClass('on');
			idx = $(this).index();
			$('.tab-contents .tab-panel').hide();
			$('.tab-contents .tab-panel').eq(idx).show();

			if (!$(this).closest('.tab-wrap').hasClass('type1')){
				tabInit();	// 다른 탭 눌렀다가 돌아왔을 때 더보기가 이미 되어있는 상태를 원하면 삭제해도 됨.
			}
		}
	})


	$('.list-check input[type=checkbox]').on('change',function(e){
		var selChk = $(this).next().text(); 
		var btnTag = "<button type='button'>" + selChk + "</button>";

		if ($(this).is(':checked')){	// 체크 할 때
			if ($(this).closest('.tab-wrap').length > 0){
				$(this).closest('.tab-wrap').siblings('.btn-group').append(btnTag);
			}else {
				$(this).closest('.inner').siblings('.btn-group').append(btnTag);
			}

		}else {	// 체크 해제 할 때
			if ($(this).closest('.tab-wrap').length > 0){
				$(this).closest('.tab-wrap').siblings('.btn-group').find('button').each(function(){
					if ( $(this).text() == selChk) {
						$(this).remove();
					}
				})
			}else {
				$(this).closest('.inner').siblings('.btn-group').find('button').each(function(){
					if ( $(this).text() == selChk) {
						$(this).remove();
					}
				})
			}
		}
	})

	$(document).on("click", ".btn-group button", function(){
		var target = $(this);
		var selTxt = target.text();
		
		if ($(this).closest('.btn-group').siblings('.tab-wrap').length > 0){
			$(this).closest('.btn-group').siblings('.tab-wrap').find('label').each(function(){
				if (selTxt == $(this).text()){
					$(this).prev().prop('checked',false);
					target.remove();
				}
			});
		}else {
			$(this).closest('.btn-group').siblings('.inner').find('label').each(function(){
				if (selTxt == $(this).text()){
					$(this).prev().prop('checked',false);
					target.remove();
				}
			});
		}
		
	});

	// 탭 초기화 함수
	function tabInit() {
		$('.tab-contents .tab-panel .menu-list').each(function(){
			if ($(this).find('li').length > 5){
				$(this).siblings('.btn-menu-more').show();
	
				$(this).find('li:gt(4)').hide();
			}
		});
	}
})
</script>
</html>