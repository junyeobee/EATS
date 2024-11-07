<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/user/indexCss.css">
<link rel="stylesheet" href="./css/user/modalCss.css">

<!-- noto sans kr font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

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

.banner_swiper {
	margin: 150px auto;
	text-align: center;
	width: 1200px;
}

.swiper {
	width: 100%;
	height: 300px;
}

.swiper-slide img {
	width: 1100px;
	object-fit: cover;
	position: absolute;
	top: -200px;
	left: 50px;
}

.swiper-pagination-bullet {
	background-color: rgba(217, 217, 217, 0.75);
	margin: 0 var(--swiper-pagination-bullet-horizontal-gap, 8px);
}

.swiper-pagination-bullet-active {
	background-color: #f3553c;
}
</style>

<title>Document</title>
</head>

<body>
	<!-- modal window-->
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
	<!---->
	<header id="main_header">
		<div class="header_box">
			<img class="logo" id="logoicon" src="/svg/logo_icon.svg" />
			<div class="profile_box">
				<c:if test="${empty user_idx }">
					<a href="userLogin">로그인</a>
					|
					<a href="openUserJoin">회원가입</a>
				</c:if>

				<c:if test="${!empty user_idx }">
					<img class="proicons-person-circle" src="/svg/profile_icon.svg" />
					<div class="profile_msg">
						<div class="user_name">${user_nickname }</div>
						<a href="userLogout">로그아웃</a>
					</div>
				</c:if>
			</div>
		</div>
	</header>

	<div class="main" id="main">
		<div class="search_box">
			<div class="location_box" id="location_box" data-target="modalArea"
				data-toggle="modal">
				<c:if test="${empty cookie.areaCk.value }">
					<img class="ep-location" src="/svg/location_icon.svg" />
					<div class="locaton_text">지역</div>
				</c:if>
				<c:if test="${!empty cookie.areaCk.value }">
					<img class="ep-location" src="/svg/location_icon_tomato.svg" />
					<div class="locaton_text">${cookie.areaCk.value }</div>
				</c:if>
			</div>


			<div class="search_input_box">
				<form name="searchForm" id="form" action="searchStore" method="GET">
					<input type="text" class="search_input" id="search_input" placeholder="‘한식대첩’을 검색해보세요">
					<input type="hidden" id="word" name="word">
					<input type="hidden" id="areaWord" name="areaWord" value="${cookie.areaCk.value }">
				</form>
			</div>
			<img class="fe-search" src="/svg/search_icon.svg" id="search_icon"/>
		</div>

		<div class="categorys">

			<c:forEach var="values" items="${valueList }">
				<div class="cate_box">
					<div class="cate_text">
						<div class="cate_title">${values.key }</div>
						<div class="cate_sub">
							<c:if test="${values.key.contains(' ')}">
							원하는 ${values.key.split(" ")[0]}<br>찾으셨나요?
						</c:if>
							<c:if test="${!values.key.contains(' ')}">
							원하는 ${values.key}<br>찾으셨나요?
						</c:if>
						</div>
					</div>

					<div class="subcate_box">
						<c:forEach var="keyvalue" items="${values.value}">
							<div class="sub_one" id="${keyvalue }"
								onclick="searchThisTag(this)">
								<div class="text">
									<c:if test="${keyvalue.length()>5}">
									${keyvalue.replace(" ", "<br>")}
								</c:if>
									<c:if test="${keyvalue.length()<=5}">
									${keyvalue}
								</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="banner_box">
			<div class="banner_swiper">

				<!-- Slider main container -->
				<div class="swiper">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper">
						<!-- Slides -->
						<div class="swiper-slide">
							<img src="/img/banner_img.jpg">
						</div>
						<div class="swiper-slide">
							<img src="/img/banner_img2.jpg">
						</div>
						<div class="swiper-slide">
							<img src="/img/banner_img3.jpg">
						</div>

					</div>
					<!-- If we need pagination -->
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>

		<div class="category">
			<div class="review_box">
				<div class="review_box_text">
					<div class="review_title">리뷰 폭!</div>
					<div class="review_sub">폭!을 많이 받은 리뷰로 맛집을 추천 받아 보세요!</div>
				</div>
				<div class="review_container">
				<c:if test="${!empty reviewData }">
				<c:forEach var="reviews" items="${reviewData }" varStatus="cnt">
					<div class="user_review">
						<div class="user_info">
							<img src="/svg/profile_icon.svg">
							<div class="user_pro">
								<div class="user_id_info">
									<div class="user_id">${reviews.user_nickname }</div>
									<div class="user_follow">팔로워 ${followCount.get(cnt.index) }</div>
								</div>
								<div class="user_date_info">
									<div class="user_date_text">방문일</div>
									<div class="user_date">${reviews.reserve_date }</div>
								</div>
							</div>
						</div>
						<div class="user_review_box">
							<div class="user_review_text">${reviews.rev_content }</div>
							<div class="user_review_sub">
								<div class="review_tag_box">
								<c:forEach var="tag" items="${tags.get(cnt.index) }">
									<div class="review_tag">
										<div class="review_tag_text">${tag }</div>
									</div>
								</c:forEach>
								</div>
								<div class="fork_info">
									<img class="fork_img" src="/svg/fork_icon.svg" />
									<div class="fork_text">${likeCount.get(cnt.index) }</div>
								</div>
							</div>
						</div>
						<div class="review_store_box">
							<div class="review_store_name">${reviews.store_name }</div>
							<div class="review_store_info">
								<div class="review_store_star">
									<img src="/svg/star_icon.svg">
									<div class="store_star_text">${storePoint.get(cnt.index) }</div>
								</div>
								<div class="review_store_location">
									<img src="/svg/location_icon.svg">
									<div class="review_store_location_text">${reviews.store_addr }</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach></c:if>
				<c:if test="${empty reviewData }">
					
				</c:if>
				</div>
			</div>

			<div class="reserve_box">
				<div class="reserve_text">
					<div class="reserve_title">
						빠른 예약<br />가능 식당
					</div>
					<div class="reserve_sub">
						바로 예약 가능한<br />식당이 알고 싶다면?
					</div>
				</div>

				<div class="reserve_container">
					<div class="store_reserve">
						<div class="store_reserve_box">
							<img class="reserve_img" src="/img/reserve_img.png" />

							<div class="store_reserve_info">
								<div class="store_reserve_info_box">
									<div class="store_reserve_title">트러플 머쉬룸 오일리스터</div>
									<div class="store_reserve_sub">
										<div class="store_star">
											<img class="star_icon" src="/svg/star_icon.svg" />
											<div class="star_point">4.7</div>
											<div class="review_count">(131)</div>
										</div>
										<div class="store_location">
											<img class="location_icon" src="/svg/location_icon.svg" />
											<div class="location_text">대전시 성심당</div>
										</div>
									</div>
								</div>

								<div class="store_reserve_tag_box">
									<div class="store_reserve_tag">
										<div class="store_reserve_tag_text">대화</div>
									</div>
									<div class="store_reserve_tag">
										<div class="store_reserve_tag_text">야채</div>
									</div>
									<div class="store_reserve_tag">
										<div class="store_reserve_tag_text">양식</div>
									</div>
								</div>
							</div>
						</div>
						<div class="reserve_time_box">
							<div class="reserve_time">
								<div class="reserve_time_text">12:30</div>
							</div>
							<div class="reserve_time">
								<div class="reserve_time_text">13:30</div>
							</div>
							<div class="reserve_time">
								<div class="reserve_time_text">16:00</div>
							</div>
							<div class="reserve_time">
								<div class="reserve_time_text">19:30</div>
							</div>
						</div>
					</div>
					<div class="store_reserve">
						<div class="store_reserve_box">
							<img class="reserve_img" src="/img/reserve_img.png" />

							<div class="store_reserve_info">
								<div class="store_reserve_info_box">
									<div class="store_reserve_title">트러플 머쉬룸 오일리스터</div>
									<div class="store_reserve_sub">
										<div class="store_star">
											<img class="star_icon" src="/svg/star_icon.svg" />
											<div class="star_point">4.7</div>
											<div class="review_count">(131)</div>
										</div>
										<div class="store_location">
											<img class="location_icon" src="/svg/location_icon.svg" />
											<div class="location_text">대전시 성심당</div>
										</div>
									</div>
								</div>

								<div class="store_reserve_tag_box">
									<div class="store_reserve_tag">
										<div class="store_reserve_tag_text">대화</div>
									</div>
									<div class="store_reserve_tag">
										<div class="store_reserve_tag_text">야채</div>
									</div>
									<div class="store_reserve_tag">
										<div class="store_reserve_tag_text">양식</div>
									</div>
								</div>
							</div>
						</div>
						<div class="reserve_time_box">
							<div class="reserve_time">
								<div class="reserve_time_text">12:30</div>
							</div>
							<div class="reserve_time">
								<div class="reserve_time_text">13:30</div>
							</div>
							<div class="reserve_time">
								<div class="reserve_time_text">16:00</div>
							</div>
							<div class="reserve_time">
								<div class="reserve_time_text">19:30</div>
							</div>
						</div>
					</div>
					<div class="store_reserve">
						<div class="store_reserve_box">
							<img class="reserve_img" src="/img/reserve_img.png" />

							<div class="store_reserve_info">
								<div class="store_reserve_info_box">
									<div class="store_reserve_title">트러플 머쉬룸 오일리스터</div>
									<div class="store_reserve_sub">
										<div class="store_star">
											<img class="star_icon" src="/svg/star_icon.svg" />
											<div class="star_point">4.7</div>
											<div class="review_count">(131)</div>
										</div>
										<div class="store_location">
											<img class="location_icon" src="/svg/location_icon.svg" />
											<div class="location_text">대전시 성심당</div>
										</div>
									</div>
								</div>

								<div class="store_reserve_tag_box">
									<div class="store_reserve_tag">
										<div class="store_reserve_tag_text">대화</div>
									</div>
									<div class="store_reserve_tag">
										<div class="store_reserve_tag_text">야채</div>
									</div>
									<div class="store_reserve_tag">
										<div class="store_reserve_tag_text">양식</div>
									</div>
								</div>
							</div>
						</div>
						<div class="reserve_time_box">
							<div class="reserve_time">
								<div class="reserve_time_text">12:30</div>
							</div>
							<div class="reserve_time">
								<div class="reserve_time_text">13:30</div>
							</div>
							<div class="reserve_time">
								<div class="reserve_time_text">16:00</div>
							</div>
							<div class="reserve_time">
								<div class="reserve_time_text">19:30</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="content_box">
				<div class="content_text">
					<div class="content_title">
						주변<br />문화콘텐츠
					</div>
					<div class="content_sub">밥 먹고 뭐 할까?</div>
				</div>
				<div class="content_container">
					<div class="culture_content">
						<div class="content_img_box">
							<img src="/img/contents_img.png" alt="" class="content_img">
						</div>
						<div class="content_info">
							<div class="place_name">수성못</div>
							<div class="place_addr">대구시 수성구 어쩌구로 110</div>
						</div>
					</div>
					<div class="culture_content">
						<div class="content_img_box">
							<img src="/img/contents_img.png" alt="" class="content_img">
						</div>
						<div class="content_info">
							<div class="place_name">수성못</div>
							<div class="place_addr">대구시 수성구 어쩌구로 110</div>
						</div>
					</div>
					<div class="culture_content">
						<div class="content_img_box">
							<img src="/img/contents_img.png" alt="" class="content_img">
						</div>
						<div class="content_info">
							<div class="place_name">수성못</div>
							<div class="place_addr">대구시 수성구 어쩌구로 110</div>
						</div>
					</div>
					<div class="culture_content">
						<div class="content_img_box">
							<img src="/img/contents_img.png" alt="" class="content_img">
						</div>
						<div class="content_info">
							<div class="place_name">수성못</div>
							<div class="place_addr">대구시 수성구 어쩌구로 110</div>
						</div>
					</div>
					<div class="culture_content">
						<div class="content_img_box">
							<img src="/img/contents_img.png" alt="" class="content_img">
						</div>
						<div class="content_info">
							<div class="place_name">수성못</div>
							<div class="place_addr">대구시 수성구 어쩌구로 110</div>
						</div>
					</div>
				</div>
			</div>

			<div class="footer">footer</div>
		</div>
	</div>
</body>
<script>
	var locationBox = document.getElementById("location_box");
	var modal = document.getElementById("modal");
	var exitbtn = document.getElementById("exitbtn");
	var logo = document.getElementById("logoicon");
	var fm = document.getElementById('form');
	var searchIcon = document.getElementById('search_icon');
	var searchInput = document.getElementById('search_input');
	var word = document.getElementById('word');
	var areaWord = document.getElementById('areaWord');
	
 	exitbtn.addEventListener('click', function(){
		modal.style.display='none';
	});

     locationBox.addEventListener('click', function () {
    	modal.style.display='flex';
        var main = document.getElementById('main');
        var header = document.getElementById('main_header');
        var h = main.scrollHeight+header.scrollHeight;
        modal.style.height = h+'px';

        var area = modal.firstElementChild;
        
        var middle = ((window.innerWidth -  area.scrollWidth)/2)/window.innerWidth*100;
        area.style.left=middle+'%';    
    });
    
   modal.addEventListener('click', function(e){
    	if(e.target.id=='modal'){
			modal.style.display='none';
		}
    });
    
    logo.addEventListener('click',function(){
    	location.href='/';
    });
    
    function searchThisTag(t){
    	var url = "searchStore?tagWord="+t.id;
    	
    	if(areaWord.value!=''){
    		url+="&areaWord="+areaWord.value;
    	}
    	location.href=url;
    }
    
    function selectThisArea(t){
    	var city = areaWord.value.split(" ");
		var newparam = city[0]+' '+t.innerText;

    	var param = 'selectArea='+newparam;
    	sendRequest('selectArea', param , showSelectArea, 'GET');
    	
    	locationBox.firstElementChild.src = '/svg/location_icon_tomato.svg';
    	locationBox.lastElementChild.innerText=t.innerText;
    	areaWord.value=newparam;
    }
    
    function showSelectArea(){
    	if(XHR.readyState==4){
    		if(XHR.status==200){
    			//modal.style.display='none';
    			location.href='/?areaWord='+areaWord.value;
    		}
    	}
    }
    
    function selectCity(cityIdx,t){
    	areaWord.value=t.innerText;
    	var params = 'cityIdx='+cityIdx;
    	sendRequest('selectUnit', params, showUnit, 'GET');
    }
    
    function showUnit(){
    	if(XHR.readyState==4){
    		if(XHR.status==200){
    			var data = XHR.responseText;
    			var jd = JSON.parse(data);

				var unitbox = document.getElementById('unitbox');
				unitbox.innerHTML='';
				
				var svalue = document.createElement('div');
				svalue.setAttribute('class','area_small_value');
				
				jd.list.forEach(function(unit) {
					var value_text = document.createElement('div');
					value_text.setAttribute('class','area_small_value_text');
					value_text.setAttribute('onclick','selectThisArea(this)');
					value_text.innerHTML=unit;
					
					svalue.appendChild(value_text);
				});
				
				unitbox.appendChild(svalue);
    		}
    	}
    }
    
    //swiper script
    const swiper = new Swiper('.swiper', {
    	slidesPerView:1,
    	spaceBetween: 20,
    	loop: true,
    	speed: 400,
    	pagination: {
    		el: '.swiper-pagination',
    		clickable: true,
    	},
    	
    	autoplay: {
    		delay: 8000
    	},
    	
    	navigation: {
    	    nextEl: '.swiper-button-next',
    	    prevEl: '.swiper-button-prev',
    	  },	
	});
    
   searchIcon.addEventListener('click', function(){
	   fm.submit();
   })
   
   searchInput.addEventListener('input', function(e){
	   word.value=e.target.value;
   })
</script>
</html>