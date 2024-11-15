<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
  <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #f5f5f5;
         
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
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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

        /* 이미지 슬라이더 */
        .image-slider {
            position: relative;
            overflow: hidden;
            width: 100%;
            height: 250px;
            margin-bottom: 16px;
        }

        .slider-container {
            display: flex;
            transition: transform 0.3s ease;
        }

        .slide {
            flex: 0 0 100%;
            width: 100%;
        }

        .slide img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .slider-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(255,255,255,0.8);
            border: none;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            cursor: pointer;
            z-index: 1;
        }

        .prev {
            left: 10px;
        }

        .next {
            right: 10px;
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
    </style>
    
    

    
</head>
<body>

    <div class="container">
        <!-- 추천 유저 섹션 -->
        
        <h1>잇츠타임</h1>
        
        <!-- 세션 idx값 받아오기 -->
    	<c:if test="${empty sessionScope.user_idx}">
    	
        <p>로그인이 필요한 서비스입니다.🍽️</p>
        
        <a href="/user/login">로그인 하러가기 ></a>
   		 </c:if>
   		 
   		 
    	 <c:if test="${!empty sessionScope.user_idx}">
      
    	
        
        <div class="recommended-users">      
       	
        <c:if test="${empty lists }">
        <span>추천할 유저가 없어요</span>
        </c:if>
        
         <!-- 유저 랜덤 추천 반복문 -->
        <c:forEach var="dto" items="${lists }">

            <div class="user-card">
                <div class="user-profile">👤</div>
                <span>${dto.user_nickname }</span>
                
                <button class="follow-btn"  id="${dto.user_idx}" value="${dto.user_idx}" onclick="follow(value)" >팔로우</button>
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
                    <div class="reviewer-profile"></div>
                    <div>
                        <div class="reviewer-name">${dto.user_nickname}</div>
                        <div class="reviewer-location">${dto.rev_writedate }</div>
                    </div>
                </div>

                <div class="image-slider">
                    <button class="slider-button prev"><</button>
                    <button class="slider-button next">></button>
                    <div class="slider-container">
                        <div class="slide">
                            
                        </div>
                        <div class="slide">
                        </div>
                        <div class="slide">
                        </div>
                    </div>
                </div>

                <div class="rating">⭐${dto.rev_score }</div>
                <div class="review-content">
                    ${dto.rev_content}
                </div>

                <div class="restaurant-info">
                    <div>
                        <div class="restaurant-name">${dto.store_name }</div>
                        <div class="restaurant-address">${dto.store_addr}</div>
                    </div>
                    <a href="/user/storeInfo">→</a>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</c:if>


    <script>
       
        document.querySelectorAll('.image-slider').forEach(slider => {
            const container = slider.querySelector('.slider-container');
            const slides = slider.querySelectorAll('.slide');
            const prevBtn = slider.querySelector('.prev');
            const nextBtn = slider.querySelector('.next');
            let currentIndex = 0;

            prevBtn.addEventListener('click', () => {
                currentIndex = (currentIndex - 1 + slides.length) % slides.length;
                updateSlider();
            });

            nextBtn.addEventListener('click', () => {
                currentIndex = (currentIndex + 1) % slides.length;
                updateSlider();
            });

            function updateSlider() {
                container.style.transform = `translateX(-${currentIndex * 100}%)`;
            }
        });

     
        document.querySelectorAll('.follow-btn').forEach(btn => {
            btn.addEventListener('click', () => {
                if (btn.textContent === '팔로우') {
                    btn.textContent = '팔로잉';
                    btn.style.backgroundColor = '#cccccc';
                } else {
                    btn.textContent = '팔로우';
                    btn.style.backgroundColor = '#ff9933';
                }
            });
        });
        
    </script>
    
    
<script>
function follow(idx) {
	
	var params='idx='+idx+'&following_idx='+${sessionScope.user_idx };
	
	sendRequest('followerReviewAjax', params, showSendResult, 'GET');

}

function showSendResult(){
	
	var reviewContainer = document.querySelector('.review-container');
	
	if(XHR.readyState==4){
		if(XHR.status==200){
			alert('팔로우되었습니다🧡')
			var data=XHR.responseText;
			var jsondata = JSON.parse(data);		
			

            if (Array.isArray(jsondata) && jsondata.length > 0) {
                jsondata.forEach((dto) => {
                	var reviewCard = document.createElement('div');
                    reviewCard.className = 'review-card';

                  
                    var reviewerInfoDiv = document.createElement('div');
                    reviewerInfoDiv.className = 'reviewer-info';

                    var reviewerProfileDiv = document.createElement('div');
                    reviewerProfileDiv.className = 'reviewer-profile';

                    var reviewerDetailsDiv = document.createElement('div');
                    var reviewerNameDiv = document.createElement('div');
                    reviewerNameDiv.className = 'reviewer-name';
                    reviewerNameDiv.textContent = dto.user_nickname;

                    var reviewerLocationDiv = document.createElement('div');
                    reviewerLocationDiv.className = 'reviewer-location';
                    reviewerLocationDiv.textContent = '서울 강남구';

                    reviewerDetailsDiv.appendChild(reviewerNameDiv);
                    reviewerDetailsDiv.appendChild(reviewerLocationDiv);
                    reviewerInfoDiv.appendChild(reviewerProfileDiv);
                    reviewerInfoDiv.appendChild(reviewerDetailsDiv);

                  
                    var imageSliderDiv = document.createElement('div');
                    imageSliderDiv.className = 'image-slider';

                    var prevButton = document.createElement('button');
                    prevButton.className = 'slider-button prev';
                    prevButton.textContent = '←';

                    var nextButton = document.createElement('button');
                    nextButton.className = 'slider-button next';
                    nextButton.textContent = '→';

                    var sliderContainerDiv = document.createElement('div');
                    sliderContainerDiv.className = 'slider-container';

                    // 이미지 
                    for (var i = 0; i < 3; i++) { 
                        var slideDiv = document.createElement('div');
                        slideDiv.className = 'slide';
                        var imgElement = document.createElement('img');
                        imgElement.src = ''; 
                        imgElement.alt = '음식 사진 ' + (i + 1);
                        slideDiv.appendChild(imgElement);
                        sliderContainerDiv.appendChild(slideDiv);
                    }

                    imageSliderDiv.appendChild(prevButton);
                    imageSliderDiv.appendChild(nextButton);
                    imageSliderDiv.appendChild(sliderContainerDiv);

                   
                    var ratingDiv = document.createElement('div');
                    ratingDiv.className = 'rating';
                    ratingDiv.textContent = '⭐'+dto.rev_score;

                  
                    var reviewContentDiv = document.createElement('div');
                    reviewContentDiv.className = 'review-content';
                    reviewContentDiv.textContent = dto.rev_content;

                  
                    var restaurantInfoDiv = document.createElement('div');
                    restaurantInfoDiv.className = 'restaurant-info';

                    var restaurantDetailsDiv = document.createElement('div');
                    var restaurantNameDiv = document.createElement('div');
                    restaurantNameDiv.className = 'restaurant-name';
                    restaurantNameDiv.textContent = '뉴욕스테이크';

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
                    reviewCard.appendChild(imageSliderDiv);
                    reviewCard.appendChild(ratingDiv);
                    reviewCard.appendChild(reviewContentDiv);
                    reviewCard.appendChild(restaurantInfoDiv);

                
                    reviewContainer.insertBefore(reviewCard, reviewContainer.firstChild);
                });
            } else {
            	  var noReviewMessage = document.createElement('p');
                  noReviewMessage.textContent = '';
                  reviewContainer.insertBefore(noReviewMessage, reviewContainer.firstChild);
            }
        }
    }
}

</script>

</body>
</html>