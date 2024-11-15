<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <link rel="stylesheet" href="./css/user/searchCss.css">

    <!-- noto sans kr font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <style>
        body {
            height: 100%;
        }

        a,
        button,
        input,
        select,
        h1,
        h2,
        h3,
        h4,
        h5,
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            border: none;
            text-decoration: none;
            background: none;

            -webkit-font-smoothing: antialiased;
        }

        menu,
        ol,
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
    </style>

    <title>Document</title>
</head>

<body>
    <header>
    </header>
    <div class="search_body">
        <div class="filter_box">
            <div class="pick_group">
                <div class="pick_box">
                    <img class="pick_location_icon" src="/svg/location_icon.svg" />
                    <div class="pick_area">지역을 선택해주세요.</div>
                </div>
                <div class="pick_box">
                    <img class="pick_date_icon" src="/svg/calander_icon.svg" />
                    <div class="pick_date">날짜를 선택해주세요.</div>
                </div>
                <div class="pick_box">
                    <img class="pick_time_icon" src="/svg/clock_icon.svg" />
                    <div class="pick_time">시간을 선택해주세요.</div>
                </div>
            </div>
            <div class="seat filter_group">
            <c:forEach var="keys" items="${valueList }">
                <div class="filter_title">${keys.key }</div>
                <div class="filter_tag_box">
				<input type="hidden" id="${keyList[keys.key]}">
                <c:forEach var="values" items="${keys.value }">
                    <div class="filter_tag" onclick="addThisTagToFilter(this,${keyList[keys.key]}, '${values }')">
                        <div class="filter_text" style="color: black;">${values }</div>
                    </div>
                </c:forEach>
                </div>
            </c:forEach>
            </div>
            <div class="price_group filter_group">
                <div class="filter_title_box">
                    <div class="filter_title">가격</div>
                    <div class="filter_title_option">초기화</div>
                </div>
                <div class="price_select_group">
                    <div class="price_slide_box">
                        <div class="wrapper">
                            <div class="multi-range-slider">
                                <input type="range" id="input-left" min="0" step="50" max="5000" value="1000">
                                <input type="range" id="input-right" min="0" step="50" max="5000" value="4000">

                                <div class="slider">
                                    <div class="track"></div>
                                    <div class="range"></div>
                                </div>
                            </div>
                            <div class="price__wrapper">
                                <span class="price-from"></span>
                                <span class="price-to"></span>
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
        </div>

        <div class="location_box">
        	<h1>searchStore..jsp</h1>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<input type="button" value="부드러운 이동" onclick="panTo()">
	<input type="button" value="지도 확대" onclick="zoomIn()">
	<input type="button" value="지도 축소" onclick="zoomOut()">
	<span id="maplevel">${word }</span>
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
                                <div class="store_break_time_text">
                                    브레이크 타임
                                </div>
                                <div class="store_break_time_time">
                                    15:30~17:00
                                </div>
                            </div>
                            <div class="store_last_time_box">
                                <div class="store_last_time_text">라스트오더</div>
                                <div class="store_last_time_time">20:30</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="store_info_bottom">
                    <div class="store_info_content">
                        깔끔하게 지저분한 헛간에서 동물들과 함께 식사를 해보세요! 새로운 경험!
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9201b2fc722dd09f6ce9211e3b210a1"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<script type="text/javascript" src="/js/sliderScript.js"></script>
<script type="text/javascript" src="/js/searchScript.js"></script>
</html>