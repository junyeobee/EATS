<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

        /* 추천 유저 섹션 */
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
            color: #ffd700;
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
        <div class="recommended-users">
        <c:if test="${empty lists }">
        <span>추천할 유저가 없어요</span>
        </c:if>
        
        <c:forEach var="dto" items="${lists }">
        
            <div class="user-card">
                <div class="user-profile">👤</div>
                <span>${dto.user_nickname }</span>
                <button class="follow-btn"  id="${dto.user_idx}"  onclick="follow('${dto.user_idx}')">팔로우</button>
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
                        <div class="reviewer-location">서울 강남구</div>
                    </div>
                </div>

                <div class="image-slider">
                    <button class="slider-button prev">←</button>
                    <button class="slider-button next">→</button>
                    <div class="slider-container">
                        <div class="slide">
                            <img src="/api/placeholder/400/320" alt="음식 사진 1">
                        </div>
                        <div class="slide">
                            <img src="/api/placeholder/400/320" alt="음식 사진 2">
                        </div>
                        <div class="slide">
                            <img src="/api/placeholder/400/320" alt="음식 사진 3">
                        </div>
                    </div>
                </div>

                <div class="rating">★★★★★</div>
                <div class="review-content">
                    ${dto.rev_content}
                </div>

                <div class="restaurant-info">
                    <div>
                        <div class="restaurant-name">뉴욕스테이크</div>
                        <div class="restaurant-address">${dto.store_addr}</div>
                    </div>
                    <a href="/user/storeInfo">→</a>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>

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

        // 팔로우 버튼 토글
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
	var params='idx='+idx;
	sendRequest('followerReviewAjax', params, showSendResult, 'GET');
}

function showSendResult(){
	var review = document.getElementById('review-container');
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var jsondata = JSON.parse(data);
			alert(jsondata);
			
		}
		
	}
}
</script>

</body>
</html>