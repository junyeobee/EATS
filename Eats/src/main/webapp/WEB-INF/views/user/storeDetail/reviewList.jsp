<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/user/userHeader.css">
<link rel="stylesheet" href="/css/user/userFooter.css">
<!-- noto sans kr font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<style>
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video, textarea {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	font-family: "Noto Sans KR", sans-serif;
}
section{
	width:90%;
	margin:auto;
	padding: 20px;
}
ul{
	list-style: none;
}
/* 상단 영역 */
.top {
	background-color: #f3553c;
	padding: 15px;
	width: 90%;
	margin: 50px 0px;
    border-radius: 10px;
}

.top a {
  color: #fefefe;
  text-decoration: none;
  font-weight: bold;
  font-size: 18px;
}

/* 메인 리뷰 영역 */
.rev-list-main {
	background: #fefefe;
	display:flex;
	width: 90%;
    padding: 20px;
    margin: 50px 0px;
    border-radius: 10px;
}

/* 좌측 정보 영역 */
.left {
	display: flex;
    justify-content: flex-start;
    align-items: flex-start;
    padding: 15px;
    border-bottom: 1px solid #eee;
    flex-direction: column;
    gap: 20px;
    width:20%;
}

.info-wrap {
  display: flex;
  align-items: center;
  gap: 15px;
}

.score-wrap {
  display: flex;
  align-items: center;
  gap: 5px;
}

.score-wrap img {
  width: 20px;
  height: 20px;
}

.score-wrap span {
  color: #ff5f4a;
  font-weight: bold;
}

/* 정렬 선택 드롭다운 */
.order-select {
  padding: 8px;
  border: 1px solid #ddd;
  border-radius: 4px;
  outline: none;
}

/* 리뷰 리스트 */
.rev-list-wrap {
	padding: 20px;
	width:60%;
}

.rev-box {
  border: 1px solid #eee;
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 20px;
}

/* 작성자 정보 */
.writer-box {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 15px;
}

.profile-img-wrap img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
}

/* 리뷰 이미지 영역 */
.rev-img-box {
  display: flex;
  gap: 10px;
  margin-bottom: 15px;
  overflow-x: auto;
}

.rev-img-box img {
  width: 120px;
  height: 120px;
  border-radius: 8px;
  object-fit: cover;
}

/* 별점 및 날짜 */
.rev-box-middle {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
}

.star-wrapper {
  display: flex;
  gap: 2px;
}

.star {
  display: inline-block;
  width: 20px;
  height: 20px;
  background: url(/img/user/star_active.png) no-repeat;
  background-size: contain;
}

.date-wrapper {
  color: #666;
  font-size: 14px;
}

/* 리뷰 내용 */
.rev-info-box textarea {
  width: 100%;
  min-height: 80px;
  border: none;
  resize: none;
  margin-bottom: 15px;
  font-size: 15px;
  line-height: 1.5;
}

/* 메뉴 태그 */
.menu-box {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 10px;
}

.menu-list {
  background-color: #FFF8E7;
  color: #FF9F1C;
  padding: 5px 10px;
  border-radius: 15px;
  font-size: 14px;
}

/* 태그 */
.tag-box {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.tag-list {
  background-color: #f5f5f5;
  color: #666;
  padding: 5px 10px;
  border-radius: 15px;
  font-size: 14px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/userHeader.jsp" %>
<section>
	<div class="top">
		<a href="/user/storeInfo?store_idx=${store.STORE_IDX }">${store.STORE_NAME }</a>
	</div>
	<div class="rev-list-main">
		<div class="left">
			<div class="info-wrap">
				<div class="score-wrap">
					<img src="/svg/star_icon.svg">
					<span>${avgScore }</span>
				</div>
				<div class="cnt-wrap">
					<span>리뷰 ${revCnt }개</span>
				</div>
			</div>
			<div class="select-wrap">
				<select class="order-select">
					<option>최신순</option>
					<option>별점높은순</option>
					<option>별점낮은순</option>
				</select>
			</div>
		</div>
		<div class="rev-list-wrap">
			<c:if test="${empty reviewList }">
			아직 리뷰가 없습니다! 첫 리뷰를 작성해보세요
			</c:if>
			<c:if test="${!empty reviewList }">
			<ul>
				<c:forEach var="review" items="${reviewList }">
				<li>
					<div class="rev-box">
						<div class="writer-box">
							<div class="profile-img-wrap">
								<img src="${review.PROFILE_IMAGE}">
							</div>
							<span>${review.USER_NICKNAME }</span>
						</div>
						<c:if test="${!empty review.imgList }">
						<div class="rev-img-box">
							<c:forEach var="img" items="${review.imgList}">
							<img src="/img/user/review/${img }">
							</c:forEach>
						</div>
						</c:if>
						<div class="rev-box-middle">
							<div class="star-wrapper">
							<c:forEach step="1" begin="1" end="${review.REV_SCORE }">
								<span class="star"></span><!-- class로 span background에 이미지 -->
							</c:forEach>
							</div>
							<div class="date-wrapper">
								<span>작성일: ${review.REV_WRITEDATE }</span>
							</div>
						</div>
						<div class="rev-info-box">
							<textarea rows="" cols="">${review.REV_CONTENT }</textarea>
							<div class="menu-box">
								<c:forEach var="menu" items="${review.revMenulist }">
								<span class="menu-list">${menu.MENU_NAME }</span>
								</c:forEach>
							</div>
							<div class="tag-box">
								<c:forEach var="tag" items="${review.revTagList }">
								<span class="tag-list">${tag }</span>
								</c:forEach>
							</div>
						</div>
					</div>
				</li>	
				</c:forEach>
			</ul>
			</c:if>
		</div>
	</div>
</section>
<%@include file="/WEB-INF/views/userFooter.jsp" %>
</body>
<script type="text/javascript" src="/js/userHeader.js"></script>
<script type="text/javascript" src="/js/httpRequest.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const selectBox = document.querySelector('.order-select');
    const storeIdx = "${store.STORE_IDX}"; 
    
    selectBox.addEventListener('change', function() {
        const order = this.value;  // 선택된 정렬 옵션값
        var param='store_idx='+storeIdx+'&order='+order;
        sendRequest('/user/storeInfo/reviewList/sort', param, dddddd, 'GET');
        /* fetch(`/user/storeInfo/reviewList/sort?store_idx=${storeIdx}&order=${order}`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
            updateReviewList(data.reviewList);
        })
        .catch(error => {
            console.error('Error:', error);
            alert('리뷰 목록을 불러오는데 실패했습니다.');
        }); */
    });
    
    function dddddd(){
    	if(XHR.readyState===4){
    		if(XHR.status===200){
    			var data=XHR.responseText;
    			var jsondata=JSON.parse(data);
    			
    			updateReviewList(jsondata.reviewList);
    			//alert(jsondata.reviewList[0].REV_CONTENT);
    		}
    	}
    }
    
    function updateReviewList(reviews) {
    	alert(reviews.length);
        const reviewListWrap = document.querySelector('.rev-list-wrap');
        if (!reviews || reviews.length === 0) {
            reviewListWrap.innerHTML = '<div>아직 리뷰가 없습니다! 첫 리뷰를 작성해보세요</div>';
            return;
        }
        
        let html = '<ul>';
        for(var i=0; i<reviews.length; i++){
        	var review = reviews[i];
        	
        	// 이미지 HTML 생성
            let imgHtml = '';
            if (review.imgList && review.imgList.length > 0) {
            	console.log('test1');
                imgHtml += '<div class="rev-img-box">';
                for(var j=0; j<review.imgList.length; j++){
                	var img = review.imgList[j];
                	imgHtml += '<img src="/img/user/review/' + img + '" alt="리뷰 이미지">';
                }
                imgHtml += '</div>';
            }
            
         	// 메뉴 HTML 생성
            let menuHtml = '';
            if (review.revMenuList && review.revMenuList.length > 0) {
            	console.log('test2');
                menuHtml += '<div class="menu-box">';
                for(var k=0; k<review.revMenuList.length; k++){
                	var menu=review.revMenuList[k];
                	menuHtml += '<span class="menu-list">' + menu.MENU_NAME + '</span>';
                }
                menuHtml += '</div>';
            }
            
         	// 태그 HTML 생성
            let tagHtml = '';
            if (review.tagList && review.tagList.length > 0) {
                tagHtml += '<div class="tag-box">';
                for(var l=0; l<review.tagList.length; l++){
                	var tag=review.tagList[l];
                	tagHtml += '<span class="tag-list">' + tag + '</span>';
                }
                tagHtml += '</div>';
            }
            
         	// 별점 HTML 생성
            let starHtml = '<div class="star-wrapper">';
            for (let m = 0; m < review.REV_SCORE; m++) {
                starHtml += '<span class="star"></span>';
            }
            starHtml += '</div>';
            
            html += '<li>' +
            '<div class="rev-box">' +
                '<div class="writer-box">' +
                    '<div class="profile-img-wrap">' +
                        '<img src="' + review.PROFILE_IMAGE + '" alt="프로필">' +
                    '</div>' +
                    '<span>' + review.USER_NICKNAME + '</span>' +
                '</div>' +
                imgHtml +
                '<div class="rev-box-middle">' +
                    starHtml +
                    '<div class="date-wrapper">' +
                        '<span>작성일: ' + review.REV_WRITEDATE + '</span>' +
                    '</div>' +
                '</div>' +
                '<div class="rev-info-box">' +
                    '<textarea readonly>' + review.REV_CONTENT + '</textarea>' +
                    menuHtml +
                    tagHtml +
                '</div>' +
            '</div>' +
        '</li>';
        }
        html += '</ul>';
        reviewListWrap.innerHTML = html;
    }
});
</script>
</html>