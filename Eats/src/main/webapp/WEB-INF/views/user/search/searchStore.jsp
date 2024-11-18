<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="./css/user/searchCss.css">
<link rel="stylesheet" href="./css/user/userHeader.css">
<link rel="stylesheet" href="./css/user/modalCss.css">
<link rel="stylesheet" href="../css/user/storeDetail/reserveCal.css">

<!-- noto sans kr font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<script src="js/ajaxJs.js"></script>

<style>
body {
	height: 100%;
}

a, button, input, select, h1, h2, h3, h4, h5, * {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border: none;
	text-decoration: none;
	background: none;
	-webkit-font-smoothing: antialiased;
}

menu, ol, ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}
</style>

<title>Document</title>
</head>

<body>
	<%@include file="../../userHeader.jsp"%>
	<div class="modal_background" id="modal">
		<div class="area-searching">
			<img class="exitbtn" id="exitbtn" src="/svg/exit.svg">
			<div class="area_container">
				<div class="mini_search_box">
					<input type="text" class="mini_search_input" placeholder="지역 검색">
					<img class="search_icon_yellow" src="/svg/search_icon_yellow.svg" />
				</div>
				<div class="area_box">
					<div class="area_big">
						<div class="area_big_key">시/도 선택</div>
						<div class="area_big_value scrollCss">
							<c:forEach var="city" items="${cityList }">
								<div class="area_big_value_text"
									onclick="selectCity(${city.area_idx}, this)">${city.area_name }</div>
							</c:forEach>
						</div>
					</div>

					<div class="area_small">
						<div class="area_small_key">시/구/군 선택</div>
						<div class="area_small_value_box scrollCss" id="unitbox">
							<div class="area_small_value_empty">시/도를 먼저 선택해주세요.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="search_body" id="main">
		<input type="hidden" id="parameters"
			value="word=${word }&areaWord=${areaWord}&selectedDate=${selectedDate}&selectedTime=${selectedTime}&tagWord=${tagWord}">
		<c:forEach var="tags" items="${tagList }">
			<input type="hidden" class="tagParam" value="${tags.keyidx},${tags.valueidx}">
		</c:forEach>
		<div class="filter_box">
			<div class="filter_reset" onclick="resetThisTag('all')">전체 필터 초기화</div>
			<div class="pick_group">
				<div class="pick_box pick_box_location"
					onclick="openAreaSelectBox()">
					<img class="pick_location_icon"
						src="/svg/location_icon${areaWord==null||areaWord==''?'':'_tomato_line' }.svg" />
					<div class="pick_area" id="pick_area">${areaWord==null||areaWord==''?"지역을 선택해주세요.":areaWord }</div>
					<input type="hidden" id="areaText">
				</div>
				<div class="pick_box">
					<div class="pick_box_date" onclick="openDateSelectBox()">
						<img class="pick_date_icon" id="pick_date_icon"
							src="/svg/calander_icon${selectedDate==null||selectedDate==''?'':'_tomato' }.svg" />
						<div class="pick_date" id="selected_date">${selectedDate==null||selectedDate==''?"날짜를 선택해주세요.":selectedDate}</div>
					</div>
					<!-- 캘린더 영역(s) -->
					<div class="cal-wrapper" id="calendar_box">
						<div id="calendar"></div>
					</div>
					<!-- 캘린더 영역(e) -->
				</div>
				<div class="pick_box">
					<div class="pick_box_time" onclick="openTimeSelectBox(this)">
						<img class="pick_time_icon"
							src="/svg/clock_icon${selectedTime==null||selectedTime==''?'':'_tomato' }.svg" />
						<div class="pick_time">${selectedTime==null||selectedTime==''?"시간을 선택해주세요.":selectedTime }</div>
					</div>
					<div class="time_paper">
							<ul id="time_selector">
								<c:forEach var="h" begin="9" end="22">
									<li onclick="selectThisTime(this)">
										<div>${h }</div>
										<div>:</div>
										<div>00</div>
									</li>
									<li onclick="selectThisTime(this)">
										<div>${h }</div>
										<div>:</div>
										<div>30</div>
									</li>
								</c:forEach>
							</ul>
					</div>
				</div>
			</div>
			<c:forEach var="keys" items="${mainValueList }">
				<div class="seat filter_group">
					<div class="filter_title_box">
						<div class="filter_title">${keys.key }</div>
						<div class="filter_title_option" onclick="resetThisTag(${mainKeyList[keys.key]})">초기화</div>
					</div>	
						<div class="filter_tag_box">
							<c:forEach var="values" items="${keys.value }">
								<div class="filter_tag" id="${mainKeyList[keys.key]},${values.cate_value_idx }"
									onclick="addThisTagToFilter(this)">
									<div class="filter_text" style="color: black;">${values.cate_value_name }</div>
								</div>
							</c:forEach>
						</div>
				</div>
			</c:forEach>
			<div class="price_group filter_group">
				<div class="filter_title_box">
					<div class="filter_title">가격</div>
					<div class="filter_title_option">초기화</div>
				</div>
				<div class="price_select_group">
					<div class="price_slide_box">
						<div class="wrapper">
							<div class="multi-range-slider">
								<input type="range" id="input-left" min="0" step="50" max="5000"
									value="1000"> <input type="range" id="input-right"
									min="0" step="50" max="5000" value="4000">

								<div class="slider">
									<div class="track"></div>
									<div class="range"></div>
								</div>
							</div>
							<div class="price__wrapper">
								<span class="price-from"></span> <span class="price-to"></span>
							</div>
						</div>
					</div>
					<div class="price_selected_group">
						<div class="filter_tag">
							<div class="price_selected_text">3만원 이하</div>
						</div>
						<div class="filter_tag">
							<div class="price_selected_text">5만원 이하</div>
						</div>
						<div class="filter_tag">
							<div class="price_selected_text">7만원 이하</div>
						</div>
						<div class="filter_tag">
							<div class="price_selected_text">10만원 대</div>
						</div>
						<div class="filter_tag">
							<div class="price_selected_text">20만원 대</div>
						</div>
						<div class="filter_tag">
							<div class="price_selected_text">30만원 대</div>
						</div>
					</div>
				</div>
			</div>
			<c:forEach var="keys" items="${subValueList }">
				<div class="filter_group">
					<div class="filter_title_box">
						<div class="filter_title">${keys.key }</div>
						<div class="filter_title_option" onclick="resetThisTag(${subKeyList[keys.key]})">초기화</div>
					</div>
					<div class="filter_tag_box">
						<c:forEach var="values" items="${keys.value }">
							<div class="filter_tag" id="${subKeyList[keys.key]},${values.cate_value_idx }"
								onclick="addThisTagToFilter(this)">
								<div class="filter_text" style="color: black;">${values.cate_value_name  }</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="location_box">
			<div class="location_map" id="map"></div>
			<input type="button" value="부드러운 이동" onclick="panTo()"> <input
				type="button" value="지도 확대" onclick="zoomIn()"> <input
				type="button" value="지도 축소" onclick="zoomOut()"> <span
				id="maplevel">${word }</span>
		</div>

		<div class="store_box">
			<div class="store_group">
				<div class="store_info_top">
					<img class="store_info_img" src="/img/banner_img.jpg" />
					<div class="store_info_title">
						<div class="store_name">멋진 헛간</div>
						<div class="store_score_box">
							<img class="store_star_icon" src="/svg/star_icon.svg" />
							<div class="store_star_point">4.2</div>
							<div class="store_review_cnt">(46)</div>
						</div>
						<div class="store_addr_box">
							<img class="store_location_icon" src="/svg/location_icon.svg" />
							<div class="store_addr">서울 성동구</div>
							<img class="store_arrow_icon" src="/svg/arrow_tomato.svg" />
						</div>
						<div class="store_time_box">
							<div class="store_break_time_box">
								<div class="store_break_time_text">브레이크 타임</div>
								<div class="store_break_time_time">15:30~17:00</div>
							</div>
							<div class="store_last_time_box">
								<div class="store_last_time_text">라스트오더</div>
								<div class="store_last_time_time">20:30</div>
							</div>
						</div>
					</div>
				</div>
				<div class="store_info_bottom">
					<div class="store_info_content">깔끔하게 지저분한 헛간에서 동물들과 함께 식사를
						해보세요! 새로운 경험!</div>
				</div>
			</div>
		</div>

	</div>


</body>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9201b2fc722dd09f6ce9211e3b210a1&libraries=services"></script>
<script type="text/javascript" src="/js/sliderScript.js"></script>
<script type="text/javascript" src="/js/searchScript.js"></script>

</html>