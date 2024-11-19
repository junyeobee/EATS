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
<title>EATS - STORE INFOMATION</title>
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
						<span class="start">${stInfo.avgRevScore }</span>
						<span class="review">리뷰 <em>${stInfo.revCount }</em></span>
					</div>
					<c:if test="${empty sessionScope.user_idx }">
					<div class="recommend-non">${stInfo.jjimCnt }</div>
					</c:if>
					<c:if test="${!empty sessionScope.user_idx }">
						<c:if test="${isJjimed }">
						<div class="recommend" id="jjim_true">${stInfo.jjimCnt }</div>
						</c:if>
						<c:if test="${!isJjimed }">
						<div class="recommend-non" id="jjim_false">${stInfo.jjimCnt }</div>
						</c:if>
					</c:if>
					
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
				</c:if>
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

document.addEventListener('DOMContentLoaded', function() {
	//alert('${isJjimed}');
    let lastReserveDate = '';
    let lastReserveCnt = '';

    // 날짜나 인원 변경 시 체크
    function checkChanges() {
        const currentReserveDate = document.getElementById('reserve_date').value;
        alert(currentReserveDate);
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
        if (e.target.classList.contains('time-list-y')) {
            // 1. 선택한 시간을 input에 설정
            const selectedTime = e.target.textContent;
            document.getElementById('reserve_time').value = selectedTime;
            
            // 2. 테이블 목록 불러오기
            getTableList();
        }else if (e.target.classList.contains('table-list')){
        	const selectedTable=e.target.textContent;
        	document.getElementById('reserve_table').value=selectedTable;
        	
      		document.getElementById('btn_wrapper').style.height='fit-content';
      		document.getElementById('btn_wrapper').style.padding='10px';
      		
        	var btnHtml='<input type="button" value="예약하기" id="reserve_btn" class="reserve-btn">';
        	document.getElementById('btn_wrapper').innerHTML=btnHtml;
        	
        }else if(e.target.classList.contains('reserve-btn')){
        	
        	var reserveParam='?store_idx='+store_idx+'&reserve_date='+reserve_date.value+'&reserve_cnt='+reserve_cnt.value+'&reserve_time='+reserve_time.value+'&reserve_table='+reserve_table.value;
        	
        	var user_idx = '${sessionScope.user_idx}';  // 서버에서 세션값 가져오기

        	if (!user_idx || user_idx === 'null' || user_idx === '') {
        	    alert('로그인 후 이용해주세요');
        	    var callback='?callback=/user/storeInfo'+reserveParam;
        	    location.href = '/user/login'+callback;  // 로그인 페이지로 리다이렉트
        	} else {
        	    location.href = '/user/reserveConfirm' + reserveParam;
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
    
	//찜 해제
	if(document.getElementById('jjim_true')){
		document.getElementById('jjim_true').addEventListener('click', function(){
	    	var user_idx='${sessionScope.user_idx}';
	    	var jjimParam='user_idx='+user_idx+'&store_idx='+store_idx;
	    	
	    	sendRequest('/user/deleteJjim', jjimParam, showJjimDltResult, 'POST');
	    });
	}
    
    
    function showJjimDltResult(){
    	if(XHR.readyState===4){
    		if(XHR.status===200){
    			var data=XHR.responseText;
    			var msg='';
    			if(data!==-1){
    				document.getElementById('jjim_true').textContent=data;
    				document.getElementById('jjim_true').classList.replace('recommend', 'recommend-non');
    				document.getElementById('jjim_true').setAttribute('id', 'jjim_false');
    				msg='콕! 해제 완료';
    			}else{
    				msg='콕! 해제 실패';
    			}
    			alert(msg);
    		}
    	}
    }
    
  	//찜
  	if(document.getElementById('jjim_false')){
  		document.getElementById('jjim_false').addEventListener('click', function(){
  	    	var user_idx='${sessionScope.user_idx}';
  	    	var jjimParam='user_idx='+user_idx+'&store_idx='+store_idx;
  	    	sendRequest('/user/insertJjim', jjimParam, showJjimResult, 'POST');
  	    });
  	}
    
    
    function showJjimResult(){
    	if(XHR.readyState===4){
    		if(XHR.status===200){
    			var data=XHR.responseText;
    			var msg='';
    			if(data!==-1){
    				document.getElementById('jjim_false').textContent=data;
    				document.getElementById('jjim_false').classList.replace('recommend-non', 'recommend');
    				document.getElementById('jjim_false').setAttribute('id', 'jjim_true');
    				msg='콕! 완료';
    			}else{
    				msg='콕! 실패';
    			}
    			alert(msg);
    		}
    	}
    }
});
</script>
<script type="text/javascript" src="../js/userHeader.js"></script>
<script src="../js/storeInfo/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/storeInfo/storeInfo.js"></script>
<script type="text/javascript" src="../js/storeInfo/reserveCal.js"></script>
</html>