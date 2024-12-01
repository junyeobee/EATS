<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navigation_category">
	<div class="navi_cate_box" onclick="selectThisMenu(this)">
		<div class="navi_cate_box_text">매장 관리</div>
	</div>
	<div class="navi_small_cate_box">
		<div class="navi_small_cate_btn">
			<div onclick="location.href='/admin/storeEntryOkList';" class="navi_small_cate_text">입점 신청 승인</div>
		</div>
		<div class="navi_small_cate_btn">
			<div onclick="location.href='/admin/storeInfoUpdateOkList';" class="navi_small_cate_text">정보 수정 승인</div>
		</div>
		<div class="navi_small_cate_btn">
			<div onclick="location.href='/admin/storeList';" class="navi_small_cate_text">가입 매장 조회</div>
		</div>
	</div>
	<div class="navi_cate_box" onclick="selectThisMenu(this)">
		<div class="navi_cate_box_text">회원 관리</div>
	</div>
	<div class="navi_small_cate_box">
		<div class="navi_small_cate_btn">
			<div onclick="location.href='/admin/userList';" class="navi_small_cate_text">가입 회원 조회</div>
		</div>
	</div>
	<div class="navi_cate_box" onclick="selectThisMenu(this)">
		<div class="navi_cate_box_text">리뷰 관리</div>
	</div>
	<div class="navi_small_cate_box">
		<div class="navi_small_cate_btn">
			<div onclick="location.href='/admin/reviewDelOkList';" class="navi_small_cate_text">리뷰 삭제 승인</div>
		</div>
	</div>
	<div class="navi_cate_box" onclick="selectThisMenu(this)">
		<div class="navi_cate_box_text">속성 관리</div>
	</div>
	<div class="navi_small_cate_box">
		<div class="navi_small_cate_btn">
			<div onclick="location.href='/searchData';" class="navi_small_cate_text">검색 관리</div>
		</div>
		<div class="navi_small_cate_btn">
			<div onclick="location.href='/tagPage';" class="navi_small_cate_text">태그 관리</div>
		</div>
	</div>
	<div class="navi_cate_box" onclick="selectThisMenu(this)">
		<div class="navi_cate_box_text">배너 관리</div>
	</div>
	<div class="navi_small_cate_box">
		<div class="navi_small_cate_btn">
			<div onclick="location.href='/bannerList';" class="navi_small_cate_text">배너 관리</div>
		</div>
		<div class="navi_small_cate_btn">
			<div onclick="location.href='/bannerInsert';" class="navi_small_cate_text">배너 등록</div>
		</div>
	</div>
	<div class="navi_cate_box" onclick="selectThisMenu(this)">
		<div class="navi_cate_box_text">게시판</div>
	</div>
	<div class="navi_small_cate_box">
		<div class="navi_small_cate_btn">
			<div onclick="location.href='/admin/notice';" class="navi_small_cate_text">공지사항</div>
		</div>
		<div class="navi_small_cate_btn">
			<div onclick="location.href='/admin/qna';" class="navi_small_cate_text">1:1 문의 관리</div>
		</div>
	</div>
</nav>