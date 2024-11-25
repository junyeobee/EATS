<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/user/userHeader.css"> 
<link rel="preconnect" href="https://fonts.googleapis.com">

<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<style>


body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
	background-color: #f5f5f5;
}

.main-container {
	max-width: 1200px;
	margin: 0 auto;
	display: flex;
	gap: 20px;
	padding: 20px;
}

.user-profile {
	width: 90px;
	height: 90px;
	border-radius: 50%;
	overflow: hidden;
	margin: 0 auto 5px;

}

.user-profile img{
	width: 100%;
	height: 100%;
	object-fit: cover;

}
.profile-container {
	
	position: relative;
	top: 0px;
	right: 3px;
	height: 250PX;
	background: white;
	border-radius: 8px 8px 0 0;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	max-width: 905px;
	margin: 0 auto;
	background: white;
	margin-top:60px;
}

.content-container {
	flex: 1;
	max-width: 900px;
	background: white;
}

.profile-image {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	overflow: hidden;
	margin: 0 auto 15px;
}

.profile-image img {
	border-radius: 50%;
		width: 100%;
	height: 100%;
	object-fit: cover;
}

.profile-info {
	text-align: center;
}

.profile-header {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 5px;
	margin-bottom: 15px;
}

.username {
	font-size: 16px;
	font-weight: 600;
}

.verified-badge {
	color: #0095f6;
	font-size: 14px;
}

.stats {
	display: flex;
	width: 450px;
	justify-content: space-between;
	gap: 20px;
	padding: 15px 0;
	border-top: 1px solid #efefef;
	border-bottom: 1px solid #efefef;
	margin: 15px 0;
	margin: 0 auto;
}

.stat-item {
	text-align: center;
	font-size: 14px;
}

.stat-number {
	font-weight: 600;
	display: block;
	margin-bottom: 4px;
}

.stat-label {
	color: #8e8e8e;
	font-size: 12px;
}

.profile-bio {
	font-size: 14px;
	line-height: 1.5;
	text-align: center;
	margin-bottom: 15px;
}

.profile-bio .name {
	font-weight: 600;
}

.follow-button {
	width: 100%;
	background-color: #0095f6;
	color: white;
	border: none;
	padding: 7px 16px;
	border-radius: 4px;
	font-weight: 600;
	cursor: pointer;
	margin-top: 10px;
}

.container {
	max-width: 900px;
	margin: 0 auto;
	background: white;

}

.recommended-users {
	display: flex;
	justify-content: space-between;
	padding: 50px;
	background-color: #fff5e6;
}

.user-card {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 8px;
}

.user-profile {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background-color: #ffd699;
	display: flex;
	align-items: center;
	justify-content: center;
}

.follow-btn {
	padding: 6px 16px;
	border-radius: 20px;
	border: none;
	background-color: #ff9933;
	color: white;
	cursor: pointer;
	font-size: 12px;
}

.follow-btn:hover {
	background-color: #ff8000;
}

/* 리뷰 섹션 */
.review-container {
	padding: 16px;
}

.review-card {
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-bottom: 16px;
	padding: 16px;
}

.reviewer-info {
	display: flex;
	align-items: center;
	margin-bottom: 16px;
}

.reviewer-profile {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: #eee;
	margin-right: 12px;
}

.reviewer-name {
	font-weight: bold;
}

.reviewer-location {
	font-size: 12px;
	color: #666;
}

.rating {
	color: #ff9933;
	margin-bottom: 8px;
}

.review-content {
	margin-bottom: 16px;
	line-height: 1.5;
}

.restaurant-info {
	background: #f8f8f8;
	padding: 12px;
	border-radius: 8px;
	cursor: pointer;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.restaurant-name {
	font-weight: bold;
	margin-bottom: 4px;
}

.restaurant-address {
	font-size: 12px;
	color: #666;
}

.image-slider {
	position: relative;
	width: 100%; /* 슬라이더 너비 조정 */
	margin: auto;
	overflow: hidden; /* 넘치는 부분 숨기기 */
	height: 260px;
}

.slider-container {
	display: flex; /* 슬라이드를 가로로 나열 */
	transition: transform 0.5s ease; /* 애니메이션 효과 */
}

.slide {
	min-width: 33.33%;
	box-sizing: border-box;
}

img {

	width: 100%; /* 이미지 너비를 슬라이드에 맞춤 */
	display: block; /* 이미지 아래 여백 제거 */
}

.slider-button {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	border: none;
	font-size: 24px;
	cursor: pointer;
	z-index: 10;
}

.prev {
	left: 10px; /* 왼쪽 버튼 위치 */
}

.next {
	right: 10px; /* 오른쪽 버튼 위치 */
}

/*모달팝업 */
  .modal {
            display: none; /* 기본적으로 숨김 */
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
            
            
        }
        .modal-content {
            background-color: #fff5e6;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            border-radius:20px;
            width: 26%;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        
        .fwlistTable img{
       width: 55px;
	height: 55px;
	border-radius: 50%;
        }
 
       
       .unfollow-btn{
       
       	padding: 6px 16px;
	border-radius: 20px;
	border: none;
	background-color: #cccccc;
	color: white;
	cursor: pointer;
	font-size: 12px;
	}
	
	table {
    border-collapse: collapse; /* 테두리 겹침을 방지 */
    margin:0 auto;
	}

	td {
    padding: 10px; /* 셀 내부 여백 */
 
	}
	
	td:nth-child(2) {
    padding-right: 20px;
}

a{
text-decoration: none;
color:black;
}
.reviewer-profile img{

     
	border-radius: 50%;
		width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>




</head>
<body>
<%@include file="../../userHeader.jsp"%>


<!-- 세션 idx값 받아오기 -->
		<c:if test="${empty sessionScope.user_idx}">

			<p>로그인이 필요한 서비스입니다.🍽️</p>

			<a href="/user/login">로그인 하러가기 ></a>
		</c:if>


		<c:if test="${!empty sessionScope.user_idx}">

			<c:if test="${empty profile }">
			</c:if>

			<c:if test="${!empty profile }">
				<c:set var="pf" value="${profile }" />
				<c:set var="re" value="${review }"/>
				
				<div class="profile-container">
					<div class="profile-image">
					
					<!-- 이미지 값 넣어주기, 경로 수정시 수정하기- 완료 -->
						<img src="${pf.profile_image}" alt="Profile Image">
						<p> ${pf.user_nickname}</p>	
						
					
					</div>
					
					<div class="profile-info">
						<div class="profile-header">
							<h2 class="username">${pf.user_name }</h2>

						</div>
						<div class="stats">
							<div class="stat-item">
								<span class="stat-number">${pf.total_reviews }</span> <span
									class="stat-label">리뷰수</span>
							</div>
							<div class="stat-item">
								<span class="stat-number">${pf.follower_count}</span> <span
									class="stat-label">팔로워</span>
							</div>
							<div class="stat-item" onclick="show();">
								<span class="stat-number">${pf.following_count }</span> <span
									class="stat-label" >팔로우</span>
							</div>
						</div>

					</div>
				</div>


<!-- 모달 팝업 -->
<div id="myModal" class="modal">
    <div class="modal-content">
    <span class="close" onclick="closeModal();">&times;</span>
    <h2>팔로우</h2>
    <c:if test="${empty follow }">
		<p>팔로워가 없습니다.</p>
	</c:if>
	
	<c:if test="${!empty follow }">
        
        <table class="fwlistTable">
        <c:forEach var="fdto" items="${follow }">
        <tr>
        	<c:if test="${empty fdto.profile_image }">
        		<td><img src="/myPageImg/default-icon.png"></td>
        	</c:if>
        	<c:if test="${!empty fdto.profile_image }">
        		<td><img src="${fdto.profile_image}"></td>
        	</c:if>
         	<td>${fdto.user_nickname }</td>
         	<td><button class="unfollow-btn" data-idx="${fdto.following_idx}" id="${fdto.following_idx}">팔로잉</button></td>
        </tr>
        </c:forEach>
        </table>
    </c:if>
    </div>
</div>

			</c:if>
	
	
	
	
		<div class="container">
		<!-- 추천 유저 섹션 -->

			<!-- sticky 프로필 컨테이너 -->

			<div class="recommended-users">

				<c:if test="${empty lists }">
					<span>추천할 유저가 없어요</span>
				</c:if>


				<!-- 유저 랜덤 추천 반복문 -->
				<c:forEach var="dto" items="${lists }">

					<div class="user-card">
					<c:if test="${empty dto.profile_image }">
					<div class="user-profile"><img src="/myPageImg/default-icon.png"></div>
					</c:if>
					<c:if test="${!empty dto.profile_image }">
						<div class="user-profile"><img src="${dto.profile_image }"></div>
					</c:if>
						<span>${dto.user_nickname }</span>
						<button class="follow-btn" data-idx="${dto.user_idx}" id="${dto.user_idx}">팔로우</button>
					</div>
				</c:forEach>

			</div>




			<!-- 리뷰 컨테이너 -->
			<div class="review-container">
				<c:if test="${empty review }">
					<p>리뷰가 없습니다.</p>
				</c:if>

				<c:forEach var="dto" items="${review }">
					<!-- 리뷰 카드 1 -->
					<div class="review-card">
						<div class="reviewer-info">
							<div class="reviewer-profile"><img src="${dto.profile_image}"></div>
							<div>
								<div class="reviewer-name">${dto.user_nickname}</div>
								<div class="reviewer-location">${dto.rev_writedate }</div>
							</div>
						</div>

						<div class="image-slider">
							<button class="slider-button prev"><</button>
							<button class="slider-button next">></button>
							
							<div class="slider-container">
								<c:forEach var="rimg" items='${dto.rev_img.split(",")}'>
								<div class="slide">
									<img src="/img/user/review/${rimg }" alt="Image">
								</div>
								</c:forEach>
							</div>
						</div>
						<div class="rating">⭐${dto.rev_score }</div>
						<div class="review-content">${dto.rev_content}</div>

						<div class="restaurant-info">
							<div>
								<div class="restaurant-name">${dto.store_name }</div>
								<div class="restaurant-address">${dto.store_addr}</div>
							</div>
							<input type="hidden" value=${dto.store_idx }>
							<a href="/user/storeInfo?store_idx=${dto.store_idx}">→</a>
						</div>
					</div>
				</c:forEach>
			</div>



		</c:if>




<script>
  document.querySelectorAll('.follow-btn').forEach(button => {
        button.addEventListener('click', () => {
            if (button.textContent === '팔로우') {
                button.textContent = '팔로잉';
                button.style.backgroundColor = '#cccccc';

                // 팔로우 요청
                var idx = button.getAttribute('data-idx');  
                var userId = ${sessionScope.user_idx}; 
                var params = 'idx=' + userId + '&following_idx=' + idx;
                sendRequest('followerReviewAjax', params, showSendResult, 'GET');
            
                
            } else {
                button.textContent = '팔로우';
                button.style.backgroundColor = '#ff9933';

                // 언팔로우 요청
                var idx = button.getAttribute('data-idx');
           		var userId = ${sessionScope.user_idx}; 
                var params = 'idx=' + userId + '&following_idx=' + idx;
                sendRequest('unFollowAjax', params, unFollowRequest, 'GET');
                
       
            }
        });
    } );

  document.querySelectorAll('.unfollow-btn').forEach(button => {
      button.addEventListener('click', () => {
          if (button.textContent === '팔로우') {
              button.textContent = '팔로잉';
              button.style.backgroundColor = '#cccccc';

              // 팔로우 요청
              var idx = button.getAttribute('data-idx');  
              var userId = ${sessionScope.user_idx}; 
              var params = 'idx=' + userId + '&following_idx=' + idx;
              sendRequest('followerReviewAjax', params, showSendResult, 'GET');
          
              
          } else {
              button.textContent = '팔로우';
              button.style.backgroundColor = '#ff9933';

              // 언팔로우 요청
              var idx = button.getAttribute('data-idx');
         		var userId = ${sessionScope.user_idx}; 
              var params = 'idx=' + userId + '&following_idx=' + idx;
              sendRequest('unFollowAjax', params, unFollowRequest, 'GET');
              
     
          }
      });
  } );
  
function showSendResult() {
    var reviewContainer = document.querySelector('.review-container');

    if (XHR.readyState == 4) {
        if (XHR.status == 200) {
           
            var data = XHR.responseText;
            var jsondata = JSON.parse(data);

            if (Array.isArray(jsondata) && jsondata.length > 0) {
                jsondata.forEach((dto) => {
                    var reviewCard = document.createElement('div');
                    reviewCard.className = 'review-card';

                    var reviewerInfoDiv = document.createElement('div');
                    reviewerInfoDiv.className = 'reviewer-info';
                    
                    var img = document.createElement('img');
                    img.src = dto.profile_image;
                   img.style.borderRadius = '50%';
                    img.style.width = '45px';
                    img.style.height = '45px';
                    img.style.objectFit = 'cover'; 

                  	var reviewerProfileDiv = document.createElement('div');
                    reviewerProfileDiv.className = 'reviewer-profile'; 
					
                    
                    var reviewerDetailsDiv = document.createElement('div');
                    var reviewerNameDiv = document.createElement('div');
                    reviewerNameDiv.className = 'reviewer-name';
                    reviewerNameDiv.textContent = dto.user_nickname;

                    var reviewerLocationDiv = document.createElement('div');
                    reviewerLocationDiv.className = 'reviewer-location';
                    reviewerLocationDiv.textContent = dto.rev_writedate;

                    reviewerDetailsDiv.appendChild(reviewerNameDiv);
                    reviewerDetailsDiv.appendChild(reviewerLocationDiv);
                   	reviewerInfoDiv.appendChild(reviewerProfileDiv);
                    reviewerInfoDiv.appendChild(reviewerDetailsDiv);
                    


                    var imageSliderDiv = document.createElement('div');
                    imageSliderDiv.className = 'image-slider';

                    var prevButton = document.createElement('button');
                    prevButton.className = 'slider-button prev';
                    prevButton.textContent = '<';

                    var nextButton = document.createElement('button');
                    nextButton.className = 'slider-button next';
                    nextButton.textContent = '>';

                    var sliderContainerDiv = document.createElement('div');
                    sliderContainerDiv.className = 'slider-container';
                    var reviewImages = dto.rev_img.split(",");
                    
                    // 이미지 
                    for (var i = 0; i < reviewImages.length; i++) { 
                        var slideDiv = document.createElement('div');
                        slideDiv.className = 'slide';
                        var imgElement = document.createElement('img');
                        imgElement.src = '/img/user/review/'+reviewImages[i];  //리뷰이미지 수정한 부분
                        imgElement.alt = '음식 사진 ' + (i + 1);
                        slideDiv.appendChild(imgElement);
                        sliderContainerDiv.appendChild(slideDiv);
                    }

                    imageSliderDiv.appendChild(prevButton);
                    imageSliderDiv.appendChild(nextButton);
                    imageSliderDiv.appendChild(sliderContainerDiv);

                    var ratingDiv = document.createElement('div');
                    ratingDiv.className = 'rating';
                    ratingDiv.textContent = '⭐' + dto.rev_score;

                    var reviewContentDiv = document.createElement('div');
                    reviewContentDiv.className = 'review-content';
                    reviewContentDiv.textContent = dto.rev_content;

                    var restaurantInfoDiv = document.createElement('div');
                    restaurantInfoDiv.className = 'restaurant-info';

                    var restaurantDetailsDiv = document.createElement('div');
                    var restaurantNameDiv = document.createElement('div');
                    restaurantNameDiv.className = 'restaurant-name';
                    restaurantNameDiv.textContent = dto.store_name;

                    var restaurantAddressDiv = document.createElement('div');
                    restaurantAddressDiv.className = 'restaurant-address';
                    restaurantAddressDiv.textContent = dto.store_addr;

                    restaurantDetailsDiv.appendChild(restaurantNameDiv);
                    restaurantDetailsDiv.appendChild(restaurantAddressDiv);
                    restaurantInfoDiv.appendChild(restaurantDetailsDiv);

                    var storeLink = document.createElement('a');
                    storeLink.href = '/user/storeInfo';
                    storeLink.textContent = '→';
                    restaurantInfoDiv.appendChild(storeLink);

                    reviewCard.appendChild(reviewerInfoDiv);
                   // reviewCard.appendChild(img);
                    reviewCard.appendChild(imageSliderDiv);
                    reviewCard.appendChild(ratingDiv);
                    reviewCard.appendChild(reviewContentDiv);
                    reviewCard.appendChild(restaurantInfoDiv);
                   	reviewerProfileDiv.appendChild(img);

                    reviewContainer.insertBefore(reviewCard, reviewContainer.firstChild);
                });
            } else {
                var noReviewMessage = document.createElement('p');
                
                reviewContainer.insertBefore(noReviewMessage, reviewContainer.firstChild);
            }
        }
    }
}

function unFollowRequest() {
    if (XHR.readyState == 4) {
        if (XHR.status == 200) {
          
            var data = XHR.responseText;
            var jsondata = JSON.parse(data);
            // 추가적인 처리 로직 필요 시 여기에 작성
        }
    }
}


function show() {
    document.getElementById("myModal").style.display = "block";
}

function closeModal() {
    document.getElementById("myModal").style.display = "none";
    window.location = window.location.href;
}

// 모달 외부 클릭 시 닫기
window.onclick = function(event) {
    var modal = document.getElementById("myModal");
    if (event.target == modal) {
        closeModal();
    }
}

</script>
<script type="text/javascript" src="../js/userHeader.js"></script>

</body>

</html>