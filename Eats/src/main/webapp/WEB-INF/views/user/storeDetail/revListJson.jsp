<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
								<img src="${empty review.PROFILE_IMAGE? "/svg/one_icon.svg":review.PROFILE_IMAGE }">
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