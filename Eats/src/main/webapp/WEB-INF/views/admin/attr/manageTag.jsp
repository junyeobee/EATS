<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- noto sans kr font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./css/manager/tagCss.css">
<link rel="stylesheet" href="./css/manager/headerCss.css">
<link rel="stylesheet" href="./css/manager/navigationCss.css">

<style>
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
	<%@ include file="/layout_component/header.jsp" %>
	<div class="body_box">
		<nav class="navigation_category">
			<div class="navi_cate_box" onclick="selectThisMenu(this)">
				<div class="navi_cate_box_text">매장 관리</div>
			</div>
			<div class="navi_small_cate_box">
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">입점 신청 승인</div>
				</div>
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">정보 수정 승인</div>
				</div>
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">매장별 통계</div>
				</div>
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">가입 매장 조회</div>
				</div>
			</div>
			<div class="navi_cate_box" onclick="selectThisMenu(this)">
				<div class="navi_cate_box_text">회원 관리</div>
			</div>
			<div class="navi_small_cate_box">
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">가입 회원 조회</div>
				</div>
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">리뷰 관리</div>
				</div>
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">리뷰 삭제 승인</div>
				</div>
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">가입 매장 조회</div>
				</div>
			</div>
			<div class="navi_cate_box" onclick="selectThisMenu(this)">
				<div class="navi_cate_box_text">리뷰 관리</div>
			</div>
			<div class="navi_small_cate_box">
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">리뷰 삭제 승인</div>
				</div>
			</div>
			<div class="navi_cate_box" onclick="selectThisMenu(this)">
				<div class="navi_cate_box_text">속성 관리</div>
			</div>
			<div class="navi_small_cate_box">
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">검색 관리</div>
				</div>
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">태그 관리</div>
				</div>
			</div>
			<div class="navi_cate_box" onclick="selectThisMenu(this)">
				<div class="navi_cate_box_text">배너 관리</div>
			</div>
			<div class="navi_small_cate_box">
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">배너 관리</div>
				</div>
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">배너 등록</div>
				</div>
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">배너 수정</div>
				</div>
			</div>
			<div class="navi_cate_box" onclick="selectThisMenu(this)">
				<div class="navi_cate_box_text">게시판</div>
			</div>
			<div class="navi_small_cate_box">
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">공지사항</div>
				</div>
				<div class="navi_small_cate_btn" onclick="selectThisCate(this)">
					<div class="navi_small_cate_text">1:1 문의 관리</div>
				</div>
			</div>
		</nav>
		<div class="my_contents">
			<div class="category_box">
				<div class="category_title_box">
					<div class="category_title_text">음식 종류</div>
					<div class="category_delete_text">카테고리 삭제</div>
				</div>
				<div class="tag_group">
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_box">
						<div class="tag_text">태그</div>
						<img class="tag_delete_icon" src="/svg/minus_icon.svg" />
					</div>
					<div class="tag_add_box">
						<img class="tag_add_icon" src="svg/add_icon_tomato.svg" />
					</div>
				</div>
			</div>

			<div class="category_add_box">
				<img class="category_add_icon" src="/svg/add_icon_tomato.svg" />
				<div class="category_title_text">새로운 카테고리 추가</div>
				<div class="category_add_input_box">
					<input type="text" class="category_add_input"
						placeholder="카테고리 이름 입력">
				</div>

			</div>
		</div>
	</div>
</body>
<script src="./js/adminScript.js"></script>
</html>