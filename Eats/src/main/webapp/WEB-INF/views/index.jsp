<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/user/indexCss.css">
<link rel="stylesheet" href="./css/user/modalCss.css">
<link rel="stylesheet" href="./css/user/userHeader.css">
<link rel="stylesheet" href="./css/user/userFooter.css">
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
<title>EATS</title>
</head>

<body>
<%@include file="userHeader.jsp" %>
	<!-- modal window-->
	<div class="modal_background" id="modal">
		<div class="area-searching">
			<img class="exitbtn" id="exitbtn" src="/svg/exit.svg">
			<div class="area_container">
				<div class="area_box">
					<div class="area_big">
						<div class="area_big_key">시/도 선택</div>
						<div class="area_big_value scrollCss">
							<div class="area_big_value_text"
									onclick="selectCity(0, this)">지역 선택 해제</div>
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
	<section>
	<!-- 상단 이미지, 검색박스 아티클 (s) -->
	<article class="main-top">
		<div class="mainimg-wrap">
			<img src="/img/user/main_img2.png">
		</div>
		<div class="content-wrap">
			<p>Your Dining Experience Starts Here</p>
			<div class="search-wrap">
				<div class="search_box">
				<div class="location_box" id="location_box" data-target="modalArea"
					data-toggle="modal">
					<c:if test="${empty cookie.unitCk.value }">
						<img class="ep-location" src="/svg/location_icon.svg" />
					</c:if>
					<c:if test="${!empty cookie.unitCk.value }">
						<img class="ep-location" src="/svg/location_icon_tomato.svg" />
						<div class="locaton_text">${cookie.unitCk.value }</div>
					</c:if>
				</div>
	
	
				<div class="search_input_box">
					<form name="searchForm" id="form" action="searchStore" method="GET">
						<input type="text" class="search_input" id="search_input" placeholder="찾으시는 식당 이름을 검색해보세요.">
						<input type="hidden" id="word" name="word">
						<input type="hidden" id="areaWord" name="areaWord" value="${cookie.cityCk.value } ${cookie.unitCk.value }">
					</form>
				</div>
				<img class="fe-search" src="/svg/search_icon.svg" id="search_icon"/>
				</div>
			</div>
		</div>

	</article>
	<!-- 이미지, 검색박스 아티클(e) -->
	<div class="main" id="main">
		<div class="categorys">
			<c:forEach var="values" items="${valueList }">
			<c:if test="${!empty values }">
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
							<div class="sub_one" id="${idxList[values.key] },${keyvalue.cate_value_idx}"
								onclick="searchThisTag(this)">
								<div class="text">
									<c:if test="${keyvalue.cate_value_name.length()>5}">
									${keyvalue.cate_value_name.replace(" ", "<br>")}
								</c:if>
									<c:if test="${keyvalue.cate_value_name.length()<=5}">
									${keyvalue.cate_value_name}
								</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="banner_box">
			<div class="banner_swiper">

				<!-- Slider main container -->
				<c:if test="${bannerList.size()>0 }">
				<div class="swiper">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper">
						<!-- Slides -->
						<c:forEach var="banner" items="${bannerList }">
							<div class="swiper-slide" onclick="location.href='${banner.banner_url}'">
								<img src="../img/${banner.banner_img }">
							</div>
						</c:forEach>
					</div>
					<!-- If we need pagination -->
					<div class="swiper-pagination"></div>
				</div>
				</c:if>
			</div>
		</div>

		<div class="category">
		<c:if test="${!empty reviewData }">
			<div class="review_box">
				<div class="review_box_text">
					<div class="review_title">팔로우 추천!</div>
					<div class="review_sub">팔로우가 많은 유저의 리뷰로 맛집을 추천 받아 보세요!</div>
				</div>
				<div class="review_container">
				
				<c:forEach var="reviews" items="${reviewData }" varStatus="cnt">
				<c:if test="${!empty reviews }">
					<div class="user_review" onclick="location.href='/user/storeInfo?store_idx=${reviews.store_idx}';">
						<div class="user_info">
						<div class="user_info_img">
							<img src="${reviews.profile_image==null||reviews.profile_image==''?'/svg/profile_icon.svg':reviews.profile_image }">
						</div>	<div class="user_pro">
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
								<c:if test="${tagMap[reviews.rev_idx]!=null }">
								<c:forEach var="tag" items="${tagMap[reviews.rev_idx] }">
									<div class="review_tag">
										<div class="review_tag_text">${tag }</div>
									</div>
								</c:forEach>
								</c:if>
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
				</c:if>
				</c:forEach>
				</div>
			</div>
			</c:if>

		<c:if test="${jcntList.size()>0 }">
			<div class="reserve_box">
				<div class="reserve_text">
					<div class="reserve_title">
						찜 순
					</div>
					<div class="reserve_sub">
						가장 많이 찜한<br />식당이 알고 싶다면?
					</div>
				</div>

				<div class="reserve_container">
				<c:forEach var="jcnt" items="${jcntList }">
					<div class="store_reserve" onclick="location.href='/user/storeInfo?store_idx=${jcnt.store_idx}';">
						<div class="store_reserve_box">
							<img class="reserve_img" src="/img/storeUploadImg/${jcnt.store_img }" />

							<div class="store_reserve_info">
								<div class="store_reserve_info_box">
									<div class="store_reserve_title">${jcnt.store_name }</div>
									<div class="store_reserve_sub">
										<div class="store_star">
											<img class="star_icon" src="/svg/fork_icon.svg" />
											<div class="star_point">${jcnt.jcnt }</div>
										</div>
										<div class="store_location">
											<img class="location_icon" src="/svg/location_icon.svg" />
											<div class="location_text">${jcnt.store_addr }</div>
										</div>
									</div>
								</div>
								<div class="store_reserve_tag_box">
								<c:forEach var="tag" items="${jcntTags[jcnt.store_idx] }" begin="0" end="4">
									<div class="store_reserve_tag">
										<div class="store_reserve_tag_text">
											${tag }
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</c:if>
		<c:if test="${pointList.size()>0 }">
			<div class="reserve_box">
				<div class="reserve_text">
					<div class="reserve_title">
						별점 순
					</div>
					<div class="reserve_sub">
						리뷰 별점이 높은<br />식당이 알고 싶다면?
					</div>
				</div>

				<div class="reserve_container">
				<c:forEach var="point" items="${pointList }">
					<div class="store_reserve" onclick="location.href='/user/storeInfo?store_idx=${point.store_idx}';">
						<div class="store_reserve_box">
							<img class="reserve_img" src="/img/storeUploadImg/${point.store_img }" />

							<div class="store_reserve_info">
								<div class="store_reserve_info_box">
									<div class="store_reserve_title">${point.store_name }</div>
									<div class="store_reserve_sub">
										<div class="store_star">
											<img class="star_icon" src="/svg/star_icon.svg" />
											<div class="star_point">${point.point }</div>
										</div>
										<div class="store_location">
											<img class="location_icon" src="/svg/location_icon.svg" />
											<div class="location_text">${point.store_addr }</div>
										</div>
									</div>
								</div>
								<div class="store_reserve_tag_box">
								<c:forEach var="tag" items="${pointTags[point.store_idx] }" begin="0" end="4">
									<div class="store_reserve_tag">
										<div class="store_reserve_tag_text">
											${tag }
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</c:if>
		</div><!-- category div (e) -->
	</div> <!-- main div (e) -->
	</section>
</body>
<%@include file="userFooter.jsp" %>
<script type="text/javascript" src="../js/userHeader.js"></script>
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
 		modalExit();
	});

     locationBox.addEventListener('click', function () {
    	modal.style.display='flex';
		var main = document.getElementsByTagName('section')[0];
        var header = document.getElementById('userHeader');
        var h = main.scrollHeight+header.scrollHeight;
        modal.style.height = h+'px';

        var area = modal.firstElementChild;
        
        var middle = ((window.innerWidth -  area.scrollWidth)/2)/window.innerWidth*100;
        area.style.left=middle+'%';    
    });
    
   modal.addEventListener('click', function(e){
    	if(e.target.id=='modal'){
    		modalExit();
		}
    });
   
   function modalExit(){
	   modal.style.display='none';
	   
	   if(!areaWord.value.includes(' ')) {
			areaWord.value='';
	   }
   }
    
    function searchThisTag(t){
    	var url = "searchStore?tagWord="+t.id;
    	
    	if(areaWord.value!=''){	
    		url+="&areaWord="+areaWord.value;
    		console.log(url);
    	}
    	location.href=url;
    }
    
    function selectThisArea(t){
    	var city = areaWord.value.split(" ");
		var newparam = city[0].substring(0,2)+' '+t.innerText;

    	var param = 'selectCity='+city[0].substring(0,2)+'&selectUnit='+t.innerText;
    	sendRequest('selectArea', param , showSelectArea, 'GET');
    	
    	locationBox.firstElementChild.src = '/svg/location_icon_tomato.svg';
    	locationBox.lastElementChild.innerText=t.innerText;
    	areaWord.value=newparam;
    }
    
    function showSelectArea(){
    	if(XHR.readyState==4){
    		if(XHR.status==200){
    			location.href='/?areaWord='+areaWord.value;
    		}
    	}
    }
    
    function selectCity(cityIdx, t){
    	if(cityIdx==0) {
    		sendRequest('resetArea', null, showReset, 'GET');
    	} else {
    		areaWord.value=t.innerText;
    		var params = 'cityIdx='+cityIdx;
    		sendRequest('selectUnit', params, showUnit, 'GET');
    	}
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
    
    function showReset() {
    	if(XHR.readyState==4){
    		if(XHR.status==200){
    			location.href='/';
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
   
   window.addEventListener('scroll', function(event){
	   var sy = this.scrollY;

	   modal.firstElementChild.style.top=sy+250+'px';
   });
</script>
</html>