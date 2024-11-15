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
<title></title>
<link rel="stylesheet" href="/css/user/userHeader.css">
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
							<span>이탈리안</span>
						</span>
					</div>
					<div class="info">
						<span class="start">4.7</span>
						<span class="review">리뷰 <em>192</em></span>
					</div>
					<div class="recommend">${stInfo.jjimCnt }</div>
				</div>

				<!-- 상단 가게 이미지 영역 (s) -->
				<div class="swiper swp-store">
					<div class="swiper-wrapper">
						<c:forEach var="img" items="${stInfo.storeImgList }">
						<div class="swiper-slide"><img src="${img.store_img }" alt="가게사진${img.img_order }"/></div>
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
							<div class="acco-head">
								<a href="#" class="btn-acco">
									<i class="map"></i>
									<span>${stInfo.storeDTO.store_addr }</span>
								</a>
							</div>
							<div class="acco-body">
								<ul class="addr-list">
								<!-- 후에 수정 필요 (s) -->
									<li>
										<span class="item">도로명</span>
										<span class="val" id="street_addr">서울 용산구 이태원로55가길 45</span>
										<span class="val">&nbsp;&nbsp;<a href="javascript:copyText();" class="copy-link">복사</a></span>
									</li>
									<li>
										<span class="item">지번</span>
										<span class="val">한남동 738-11</span>
									</li>
									<li>
										<span class="item">우편번호</span>
										<span class="val">04348</span>
									</li>
									<!-- 후에 수정 필요 (e) -->
								</ul>
							</div>
						</div>
						<!-- 후에 수정 필요 (s) -->
						<p class="desc">한강진역 1번 출구에서 500m 정도 걸어오시면 됩니다.</p>
						<!-- 후에 수정 필요 (e) -->
					</div>
					
					<div class="inner">
						<div class="acco-wrap">
							<div class="acco-head">
								<a href="#" class="btn-acco">
									<i class="clock"></i>
									<span id="today-day"></span>
									<span>${stInfo.todayTime.stime_start }-${stInfo.todayTime.stime_end }</span>
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

					<div class="inner txt">
						<strong class="tit">편의시설</strong>
						<ul class="convenience-list">
							<c:forEach var="conv" items="${stInfo.convList }">
							<li>${conv.cate_value_name }</li>
							</c:forEach>
						</ul>
					</div>

				</div>
				<!-- 위치, 시간, 편의시설 (e) -->

				<!-- 공지사항 (s) -->
				<div class="bg-box">
					<div class="swiper swp-noti">
						<div class="swiper-wrapper">
							<c:forEach var="news" items="${stInfo.storeNewsList }">
							<div class="swiper-slide">
								<div class="inner txt">
									<strong class="tit">${news.s_news_title }</strong>
									<p class="desc">${news.s_news_content }</p>
									<div class="btn-area">
										<button type="button" class="btn-more">더보기</button>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
				<!-- 공지사항 (e) -->
			
				<!-- 리뷰 버튼 (s) -->
				<a href="#" class="btn-review">리뷰 보러 가기</a>
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
											<img src="${menu.menu_img }" alt="${mcate.m_cate_name }_${menu.menu_idx}"/>
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
				<!-- 캘린더 영역(s) -->
				<div class="cal-wrapper">
					<div id="calendar"></div>
					<input type="hidden" id="runningDayList" value="${runningDayList}">
					<input type="hidden" id="reserve_date">
				</div>
				<!-- 캘린더 영역(e) -->
				
				<!-- 인원 선택 영역(s) -->
				<div class="cnt-wrapper">
					<span>인원</span>
					<div>
						<input type="button" value="-" id="cntMinusBtn" onclick="changeCnt('minus')">
						<input type="text" value="2" id="reserve_cnt" readonly="readonly">
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
					<input type="hidden" name="reserve_time" id="reserve_time">
				</div>
				<!-- 시간 선택 영역(e) -->
				
				<!-- 테이블 선택 영역(s) -->
				<div class="table-wrapper">
					
				</div>
				<!-- 테이블 선택 영역(e) -->
				
				<!-- 버튼 영역 (s) -->
				<div class="btn-wrapper">
					버튼
				</div>
				<!-- 버튼 영역 (e) -->
			</div>
			<!-- 오른쪽 예약 영역 (e) -->
		</section>
	</div>
</body>
<script>
const store_idx=${storeTotalInfo.storeDTO.store_idx};
var maxCnt=parseInt(${max_people_cnt});

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

</script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	   let lastReserveDate = '';
	   let lastReserveCnt = '2';

	   // 날짜 또는 인원에 변화가 생기면 새로운 시간 목록 불러옴
	   function checkChanges() {
	       const currentReserveDate = document.getElementById('reserve_date').value;
	       const currentReserveCnt = document.getElementById('reserve_cnt').value;

	       if (currentReserveDate && currentReserveCnt && (currentReserveDate !== lastReserveDate || currentReserveCnt !== lastReserveCnt)) {
	           //시간 목록 불러오는 거 비동기 처리하기
	           var params='store_idx='+store_idx+'&reserve_date='+currentReserveDate+'&reserve_cnt='+currentReserveCnt;
	           sendRequest('/user/getTimeList', params, showTimeList, 'GET');
	           
	           lastReserveDate = currentReserveDate;
	           lastReserveCnt = currentReserveCnt;
	       }
	   }
	   
	   //MutationObserver로 DOM변화 감시하기!
	   const changeFinder = new MutationObserver(function(mutations) {
	       mutations.forEach(function(mutation) {
	           if (mutation.type === 'attributes' && mutation.attributeName === 'value') {
	               checkChanges();
	           }
	       });
	   });

	   // 관찰 대상 = reserve_date & reserve_cnt
	   const reserveDateInput = document.getElementById('reserve_date');
	   const reserveCntInput = document.getElementById('reserve_cnt');
	   
	   changeFinder.observe(reserveDateInput, { attributes: true });
	   changeFinder.observe(reserveCntInput, { attributes: true });

	   // input 이벤트도 추가
	   reserveDateInput.addEventListener('input', checkChanges);
	   reserveCntInput.addEventListener('input', checkChanges);
	   
	   const originalChangeCnt = changeCnt;	// 기존 인원 수 변경하는 함수
	    changeCnt = function(change) {		// 함수 새로 정의
	        originalChangeCnt(change);		// 기존 기능은 그대로
	        checkChanges();	
	    };
	    
	    document.querySelectorAll('.time-list-y').forEach(cell => {
	    	cell.addEventListener('click', function(){
	    		do
	    	});
	    });
});
function showTimeList(){
	if(XHR.readyState===4){
		if(XHR.status===200){
			var data=XHR.responseText;
			var jsondata=JSON.parse(data);
			document.getElementById('time_wrapper').style.height='150px';
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
		}
	}
}
</script>
<script src="../js/storeInfo/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/storeInfo/storeInfo.js"></script>
<script type="text/javascript" src="../js/storeInfo/reserveCal.js"></script>
</html>