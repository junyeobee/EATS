<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
		rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
	<link rel="stylesheet" href="../css/user/storeDetail/reset.css">
	<link rel="stylesheet" href="../css/user/storeDetail/storeDetailCss.css">
	<link rel="stylesheet" href="../css/user/storeDetail/reserveCal.css">
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	
	<!-- 지도를 위한 카카오맵 라이브러리 -->
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9201b2fc722dd09f6ce9211e3b210a1&libraries=services"></script>
	
	
<title>EATS - STORE INFOMATION</title>
<link rel="stylesheet" href="/css/user/userHeader.css">
<link rel="stylesheet" href="/css/user/userFooter.css">
</head>
<body>
<%@include file="/WEB-INF/views/userHeader.jsp" %>
	<div class="wrapper">		
		<section id="content">
			<c:set var="stInfo" value="${storeTotalInfo }"></c:set>
			<!-- 왼쪽 컨텐츠 영역 (s) -->
			<div class="content-wrap">
				<div class="store-wrap">
					<div class="tit-area">
						<strong class="tit">${stInfo.storeDTO.store_name }</strong>
						<span class="cate">
							<span>${stInfo.storeDTO.parent_area_name }&nbsp;${stInfo.storeDTO.area_name }</span>
							<c:if test="${!empty stInfo.foodType }">
								<c:forEach var="type" items="${stInfo.foodType}" varStatus="cnt">
								<span>${stInfo.foodType } </span>
								</c:forEach>
							</c:if>
							
						</span>
					</div>
					<div class="info">
						<span class="start">${stInfo.avgRevScore }</span>
						<span class="review">리뷰 <em>${stInfo.revCount }</em></span>
					</div>
					<c:if test="${empty sessionScope.user_idx }">
					<div class="recommend-non">${stInfo.jjimCnt }</div>
					</c:if>
					<c:if test="${!empty sessionScope.user_idx }">
						<div class="${!isJjimed?"recommend-non":"recommend"}" id="jjim_t" onclick="sssshow(${!isJjimed?1:0})">${stInfo.jjimCnt }</div>
					</c:if>
					
				</div>

				<!-- 상단 가게 이미지 영역 (s) -->
				<div class="swiper swp-store">
					<div class="swiper-wrapper">
						<c:forEach var="img" items="${stInfo.storeImgList }">
						<div class="swiper-slide"><img src="/img/storeUploadImg/${img.store_img }" alt="가게사진${img.img_order }"/></div>
						</c:forEach>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
				<!-- 상단 가게 이미지 영역 (e) -->

				<!-- 위치, 시간, 편의시설 (s) -->
				<div class="bg-box">
					<div class="inner">
						<div class="acco-wrap">
							<div class="acco-head" onclick="relayoutMap();">
								<a href="#" class="openMap">
									<i class="map"></i>
									<span>${stInfo.storeDTO.store_addr }</span>
									<span class="open-map-span">지도로 보기</span>
								</a>
							</div>
							<div class="acco-body">
							<input type="hidden" id="getMapPos" value="${stInfo.storeDTO.store_lat},${stInfo.storeDTO.store_lng}">
								<!-- 지도 들어갈 영역 (s) -->
								<div class="map-area" id="map">								
								</div>
								<!-- 지도 영역 (e) -->
							</div>
						</div>
					</div>
					
					<div class="inner">
						<div class="acco-wrap">
							<div class="acco-head">
								<a href="#" class="btn-acco">
									<i class="clock"></i>
									<span id="today-day"></span>
									<c:if test="${empty stInfo.todayTime.stime_start }">
									<span>오늘 휴무</span>
									</c:if>
									<c:if test="${!empty stInfo.todayTime.stime_start }">
									<span>${stInfo.todayTime.stime_start }-${stInfo.todayTime.stime_end }</span>
									</c:if> 
								</a>
							</div>
							<div class="acco-body">
								<ul class="time-list">
									<c:forEach var="day" items="${dayList}">
							        <li>
							            <span class="item">${day}</span>
							            <span class="val">
							                <c:set var="isOpen" value="false" />
							                <c:forEach var="time" items="${stInfo.storeTimeList}">
							                    <c:if test="${time.stime_day == day}">
							                        <c:set var="isOpen" value="true" />
							                        <c:choose>
							                            <c:when test="${empty time.stime_start || empty time.stime_end}">
							                                휴무
							                            </c:when>
							                            <c:otherwise>
							                                ${time.stime_start} - ${time.stime_end}
							                                <c:if test="${!empty time.stime_break}">
							                                    <p>Break Time ${time.stime_break}</p>
							                                </c:if>
							                            </c:otherwise>
							                        </c:choose>
							                    </c:if>
							                </c:forEach>
							                <c:if test="${!isOpen}">
							                    휴무
							                </c:if>
							            </span>
							        </li>
							    	</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<c:if test="${!empty stInfo.convList }">
					<div class="inner txt">
						<strong class="tit">편의시설</strong>
						<ul class="convenience-list">
							<c:forEach var="conv" items="${stInfo.convList }">
							<li>${conv.cate_value_name }</li>
							</c:forEach>
						</ul>
					</div>
					</c:if>

				</div>
				<!-- 위치, 시간, 편의시설 (e) -->

				<!-- 공지사항 (s) -->
				<c:if test="${!empty stInfo.storeNewsList }">
				<div class="bg-box">
					<div class="swiper swp-noti">
						<div class="swiper-wrapper">
							<c:forEach var="news" items="${stInfo.storeNewsList }">
							<div class="swiper-slide">
								<div class="inner txt">
									<c:if test="${!empty news.s_news_img }">
									<div class="news-img-wrap">
										<img src="/img/storeNewsImg/${news.s_news_img }">
									</div>
									</c:if>
									<strong class="tit">${news.s_news_title }</strong>
									<div class="btn-area">
										<button type="button" class="btn-more">더보기</button>
									</div>
									<div class="inner-content">
										<p class="desc">${news.s_news_content }</p>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
				</c:if>
				<!-- 공지사항 (e) -->
			
				<!-- 리뷰 버튼 (s) -->
				<!-- <a href="#" class="btn-review">리뷰 보러 가기</a> -->
				<!-- 리뷰 버튼 (e) -->

				<!-- 메뉴 리스트 (s) -->
				<div class=" bg-box">
					<div class="tab-wrap">
						<ul class="tab-list">
							<c:forEach var="mcate" items="${stInfo.menuCateList }" varStatus="cnt">
								<c:if test="${cnt.index==0 }">
								<li class="on">
									<a href="#panel_${mcate.m_cate_idx }">
										<span class="tit">${mcate.m_cate_name}</span>
									</a>
								</li>
								</c:if>
								<c:if test="${cnt.index!=0 }">
								<li>
									<a href="#panel_${mcate.m_cate_idx }">
										<span class="tit">${mcate.m_cate_name}</span>
									</a>
								</li>
								</c:if>
							</c:forEach>
						</ul>
						<div class="tab-contents">
							<c:forEach var="mcate" items="${stInfo.menuCateList }">
							<div class="tab-panel" id="panel_${mcate.m_cate_idx }">
								<c:forEach var="menu" items="${stInfo.menuList }">
								<ul class="menu-list">
									<c:if test="${mcate.m_cate_idx eq menu.m_cate_idx }">
									<li>
										<div class="menu-img-wrap">
											<img src="../img/menu/${menu.menu_img }" alt="${mcate.m_cate_name }_${menu.menu_idx}"/>
										</div>
										<div class="txt-area">
											<div>
												<strong>${menu.menu_name }</strong>
												<span class="price">${menu.menu_price }</span>
											</div>
											<c:if test="${!empty menu.menu_info }">
											<p>${menu.menu_info }</p>
											</c:if>
										</div>
									</li>
									</c:if>
								</ul>
								<button type="button" class="btn-menu-more">메뉴 더보기</button>
								</c:forEach>
							</div>
							</c:forEach>
						</div>
					</div>
					<!-- icoTab (e) -->
				</div>
				<!-- 메뉴 리스트 (e) -->
			</div>
			<!-- 왼쪽 컨텐츠 영역 (e) -->

			<!-- 오른쪽 예약 영역 (s) -->
			<div class="reservation">
				<input type="hidden" id="runningDayList" value="${runningDayList}">
				<c:if test="${empty reserve_date }">
				<input type="hidden" id="reserve_date" value="${empty reserve_date?'':reserve_date }">
				</c:if>
				<c:if test="${!empty reserve_date }">
				<input type="hidden" id="reserve_date" value="${reserve_date }">
				</c:if>
				<input type="hidden" name="reserve_time" id="reserve_time">
				<input type="hidden" name="reserve_table" id="reserve_table">
				<!-- 캘린더 영역(s) -->
				<div class="cal-wrapper">
					<div id="calendar"></div>
				</div>
				<!-- 캘린더 영역(e) -->
				
				<!-- 인원 선택 영역(s) -->
				<div class="cnt-wrapper">
					<span>인원</span>
					<div>
						<input type="button" value="-" id="cntMinusBtn" onclick="changeCnt('minus')">
						<c:if test="${!empty reserve_count }">
						<input type="text" value="${reserve_count}" id="reserve_cnt" readonly="readonly">
						</c:if>
						<c:if test="${empty reserve_count }">
						<input type="text" value="2" id="reserve_cnt" readonly="readonly">
						</c:if>
						<input type="button" value="+" id="cntPlusBtn" onclick="changeCnt('plus')">
					</div>	
				</div>
				<!-- 인원 선택 영역(e) -->
				
				<!-- 시간 선택 영역(s) -->
				<div class="time-wrapper" id="time_wrapper">
					<div class="label-area">
						<div>
							<span class="yellow-label"> </span>
							<span>알림신청</span>
						</div>
						<div>
							<span class="red-label"> </span>
							<span>예약 가능</span>
						</div>
					</div>
					<div class="time-area" id="time_area"></div>
				</div>
				<!-- 시간 선택 영역(e) -->
				
				<!-- 테이블 선택 영역(s) -->
				<div class="table-wrapper" id="table_wrapper">
					
				</div>
				<!-- 테이블 선택 영역(e) -->
				
				<!-- 버튼 영역 (s) -->
				<div class="btn-wrapper" id="btn_wrapper" style="padding:0px;">
					
				</div>
				<!-- 버튼 영역 (e) -->
			</div>
			<!-- 오른쪽 예약 영역 (e) -->
		</section>
	</div>
<%@include file="/WEB-INF/views/userFooter.jsp" %>
</body>
<script>
const store_idx=${storeTotalInfo.storeDTO.store_idx};
var maxCnt=parseInt(${max_people_cnt});
const user_idx = '${sessionScope.user_idx}';  // 서버에서 세션값 가져오기

function sssshow(sw){
	if(sw==0){
		var user_idx='${sessionScope.user_idx}';
    	var jjimParam='user_idx='+user_idx+'&store_idx='+store_idx;
    	sendRequest('/user/deleteJjim', jjimParam, showJjimDltResult, 'POST');
	}else{
		var user_idx='${sessionScope.user_idx}';
    	var jjimParam='user_idx='+user_idx+'&store_idx='+store_idx;
    	sendRequest('/user/insertJjim', jjimParam, showJjimResult, 'POST');
	}
}

function changeCnt(change){
	var crCnt=document.getElementById('reserve_cnt');
	var newCnt=parseInt(crCnt.value);
	var minusBtn=document.getElementById('cntMinusBtn');
	var plusBtn=document.getElementById('cntPlusBtn');
	
	minusBtn.style.cursor='pointer';
	plusBtn.style.cursor='pointer';
	
	if(crCnt && change){
		if(change==='minus'){
			newCnt--;
		}else{
			newCnt++;
		}
	}
	
	crCnt.value=newCnt;
	
	if(crCnt.value==1){
		minusBtn.disabled=true;
	}else{
		minusBtn.disabled=false;
	}	
	
	if(crCnt.value==maxCnt){
		plusBtn.disabled=true;
	}else{
		plusBtn.disabled=false;
	}
}

document.addEventListener('DOMContentLoaded', function() {
	//alert('${isJjimed}');
    let lastReserveDate = '';
    let lastReserveCnt = '';

    // 날짜나 인원 변경 시 체크
    function checkChanges() {
        const currentReserveDate = document.getElementById('reserve_date').value;
        const currentReserveCnt = document.getElementById('reserve_cnt').value;
        
        // 날짜와 인원이 모두 선택되어 있고, 둘 중 하나라도 변경된 경우
        if (currentReserveDate && currentReserveCnt && 
            (currentReserveDate !== lastReserveDate || currentReserveCnt !== lastReserveCnt)) {
            
            // 1. 새로운 시간 목록 불러오기
            getTimeList();
            
            // 2. 시간 선택 초기화
            document.getElementById('reserve_time').value = '';
            
            // 3. 테이블 목록 초기화
            resetTableList();
            
            // 4. 마지막 선택 값 업데이트
            lastReserveDate = currentReserveDate;
            lastReserveCnt = currentReserveCnt;
        }
    }

    // 시간 목록 가져오기
    function getTimeList() {
        const currentReserveDate = document.getElementById('reserve_date').value;
        const currentReserveCnt = document.getElementById('reserve_cnt').value;
        
        var params = 'store_idx=' + store_idx + 
                    '&reserve_date=' + currentReserveDate + 
                    '&reserve_cnt=' + currentReserveCnt;
        sendRequest('/user/getTimeList', params, showTimeList, 'GET');
    }

    // 테이블 목록 가져오기
    function getTableList() {
        const currentReserveDate = document.getElementById('reserve_date').value;
        const currentReserveCnt = document.getElementById('reserve_cnt').value;
        const currentReserveTime = document.getElementById('reserve_time').value;
        
        // 세 값이 모두 있는 경우에만 테이블 목록 요청
        if (currentReserveDate && currentReserveCnt && currentReserveTime) {
            var tableParam = 'store_idx=' + store_idx + 
                           '&reserve_date=' + currentReserveDate + 
                           '&reserve_cnt=' + currentReserveCnt + 
                           '&reserve_time=' + currentReserveTime;
            sendRequest('/user/getTableList', tableParam, showTableList, 'GET');
        }
    }

    // 테이블 목록 리셋
    function resetTableList() {
    	var tableWrapper=document.getElementById('table_wrapper');
    	var btnWrapper=document.getElementById('btn_wrapper');
    	
    	tableWrapper.innerHTML = '';
    	tableWrapper.style.height='0px';
    	tableWrapper.style.padding='0px';
    	btnWrapper.innerHTML='';
    	btnWrapper.style.heigh='0px';
    	btnWrapper.style.padding='0px';
    }
    
    

    // DOM 변화 감시
    const changeFinder = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
            if (mutation.type === 'attributes' && mutation.attributeName === 'value') {
                checkChanges();
            }
        });
    });

    // 관찰 대상 설정 (날짜와 인원만 감시)
    const reserveDateInput = document.getElementById('reserve_date');
    const reserveCntInput = document.getElementById('reserve_cnt');

    changeFinder.observe(reserveDateInput, { attributes: true });
    changeFinder.observe(reserveCntInput, { attributes: true });

    // input 이벤트 리스너 추가
    reserveDateInput.addEventListener('input', checkChanges);
    reserveCntInput.addEventListener('input', checkChanges);

    // changeCnt 함수(+/- 버튼) 확장
    const originalChangeCnt = changeCnt;
    changeCnt = function(change) {
        originalChangeCnt(change);  // 기존 인원 변경 로직 실행
        checkChanges();             // 변경 사항 체크
    };

    // 시간 선택 클릭 이벤트
    document.addEventListener('click', function(e) {
    	var ytimeList=document.querySelectorAll('.time-list-y');
    	var ntimeList=document.querySelectorAll('.time-list-n');
        if (e.target.classList.contains('time-list-y')) {
            // 선택한 시간 저장
            const selectedTime = e.target.textContent;
            document.getElementById('reserve_time').value = selectedTime;
            ytimeList.forEach(time=>time.classList.remove('on'));
            ntimeList.forEach(time=>time.classList.remove('on'));
           	e.target.classList.add('on');
            
            getTableList();
        }else if(e.target.classList.contains('time-list-n')){
        	const alarmTime=e.target.textContent;
        	//선택한 시간 저장
        	document.getElementById('reserve_time').value = alarmTime;
        	ytimeList.forEach(time=>time.classList.remove('on'));
            ntimeList.forEach(time=>time.classList.remove('on'));
        	e.target.classList.add('on');
        	
        	resetTableList();
        	
        	var aramBtnHtml='<input type="button" value="알림신청" id="alarm_btn" class="alarm-btn">';
        	document.getElementById('btn_wrapper').style.heigth='fit-content';
        	document.getElementById('btn_wrapper').style.padding='10px';
        	document.getElementById('btn_wrapper').innerHTML=aramBtnHtml;
        	
        }else if (e.target.classList.contains('table-list')){
        	const tableList=document.querySelectorAll('.table-list');
        	tableList.forEach(table=>table.classList.remove('on'));
        	e.target.classList.add('on');
        	const selectedTable=e.target.textContent;
        	document.getElementById('reserve_table').value=selectedTable;
        	
      		document.getElementById('btn_wrapper').style.height='fit-content';
      		document.getElementById('btn_wrapper').style.padding='10px';
      		
        	var btnHtml='<input type="button" value="예약하기" id="reserve_btn" class="reserve-btn">';
        	document.getElementById('btn_wrapper').innerHTML=btnHtml;
        	
        }else if(e.target.classList.contains('reserve-btn')){
        	
        	var reserveParam='?store_idx='+store_idx+'&reserve_date='+reserve_date.value+'&reserve_cnt='+reserve_cnt.value+'&reserve_time='+reserve_time.value+'&reserve_table='+reserve_table.value;
        	
        	

        	if (!user_idx || user_idx === 'null' || user_idx === '') {
        	    alert('로그인 후 이용해주세요');
        	    location.href = '/user/login';  // 로그인 페이지로 리다이렉트
        	} else {
        	    location.href = '/user/reserveConfirm' + reserveParam;
        	}
        }else if(e.target.classList.contains('alarm-btn')){
        	var alarmParam='?store_idx='+store_idx+'&s_alarm_date='+reserve_date.value+'&s_alarm_count='+reserve_cnt.value+'&s_alarm_time='+reserve_time.value;
        	
        	if (!user_idx || user_idx === 'null' || user_idx === '') {
        	    alert('로그인 후 이용해주세요');
        	    location.href = '/user/login';  // 로그인 페이지로 리다이렉트
        	} else {
        		//alert(alarmParam);
        	    location.href = '/user/sendAlarmRequest' + alarmParam;
        	}
        }
    });

    

    function showTimeList(){
		if(XHR.readyState===4){
			if(XHR.status===200){
				var data=XHR.responseText;
				var jsondata=JSON.parse(data);
				document.getElementById('time_wrapper').style.height='120px';
				document.getElementById('time_wrapper').style.overflowY='auto';
				document.getElementById('time_wrapper').style.padding='10px';
				var html='<table class="time-list-table"><tr>';
				for(var i=0; i<jsondata.length; i++){
					if(jsondata[i].AVAILABLE==='N'){
						html+='<td><span class="time-list-n">'+jsondata[i].RESERVE_HOUR+'</span></td>';
					}else{
						html+='<td><span class="time-list-y">'+jsondata[i].RESERVE_HOUR+'</span></td>';
					}
					
					if(i%4===3){
						html+='</tr><tr>'
					}
				}
				html+='</tr></table>'
				document.getElementById('time_area').innerHTML=html;
				resetTableList();
			}
		}
	}

    function showTableList(){
		if(XHR.readyState===4){
			if(XHR.status===200){
				var data=XHR.responseText;
				var jsondata=JSON.parse(data);
				
				var tableWrapper=document.getElementById('table_wrapper');
				tableWrapper.style.height='70px';
				tableWrapper.style.padding='10px';
				tableWrapper.style.overflowY='auto';
				
				
				var html='';
				for(var i=0; i<jsondata.length; i++){
					if(jsondata[i].COUNT != 0){
						html+='<span class="table-list">'+jsondata[i].TABLE_TYPE+'</span>';
					}
				}
				document.getElementById('table_wrapper').innerHTML=html;
			}
		}
	}
    

});

function showJjimDltResult(){
	if(XHR.readyState===4){
		if(XHR.status===200){
			var data=XHR.responseText;
			var msg='';
			if(data!==-1){
				document.getElementById('jjim_t').textContent=data;	//데이터 넣어주기
				document.getElementById('jjim_t').classList.replace('recommend', 'recommend-non'); //클래스 바꿔주기
				document.getElementById('jjim_t').setAttribute('onclick', 'sssshow(1)'); //온클릭이벤트 매개변수 바꿔주기
				//document.getElementById('jjim_true').setAttribute('id', 'jjim_false');
				msg='콕! 해제 완료';
			}else{
				msg='콕! 해제 실패';
			}
			alert(msg);
		}
	}
}

function showJjimResult(){
	if(XHR.readyState===4){
		if(XHR.status===200){
			var data=XHR.responseText;
			var msg='';
			if(data!==-1){
				document.getElementById('jjim_t').textContent=data;
				document.getElementById('jjim_t').classList.replace('recommend-non', 'recommend');
				document.getElementById('jjim_t').setAttribute('onclick', 'sssshow(0)');
				msg='콕! 완료';
			}else{
				msg='콕! 실패';
			}
			alert(msg);
		}
	}
}

const reviewLink=document.querySelector('.info');

reviewLink.addEventListener('click', function(){
	
	location.href='/user/storeInfo/reviewList?store_idx='+store_idx;
});

//지도 스크립트
var map;
var getMapPos = document.getElementById('getMapPos').value.split(',');
var lat = getMapPos[0];
var lng = getMapPos[1];

window.addEventListener('load', function(){
	var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var mapOptions = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3,
		//지도의 레벨(확대, 축소 정도)
	};

	map = new kakao.maps.Map(mapContainer, mapOptions); //지도 생성 및 객체 리턴
	var mapImageSrc = '/svg/gps_icon.svg',
		mapImageSize = new kakao.maps.Size(55, 59),
		mapImageOption = { offset: new kakao.maps.Point(27, 69) };
	
	var markerImage = new kakao.maps.MarkerImage(mapImageSrc, mapImageSize, mapImageOption),
    markerPosition = new kakao.maps.LatLng(lat, lng);
	
	var marker = new kakao.maps.Marker({
	    position: markerPosition, 
	    image: markerImage
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
})

function relayoutMap(){
	map.relayout();
	
	map.panTo(new kakao.maps.LatLng(lat,lng));
}
</script>
<script type="text/javascript" src="../js/userHeader.js"></script>
<script src="../js/storeInfo/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/storeInfo/storeInfo.js"></script>
<script type="text/javascript" src="../js/storeInfo/reserveCal.js"></script>
</html>