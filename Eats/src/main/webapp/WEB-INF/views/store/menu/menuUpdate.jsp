<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../store_Header.jsp"%>
		<%@ include file="../nav.jsp"%>
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif;
}

body {
	background-color: #f5f5f5;
	padding: 20px;
}

.dashboard-container {
			margin-left: 240px;
			margin-top: 64px;
			padding: 32px;
			background-color: #eff9ff;
		}

.container {
	max-width: 800px;
	margin: 0 auto;
	background-color: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
	font-size: 24px;
	margin-bottom: 30px;
	color: #333;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #333;
	font-size: 14px;
}

select, input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
}

textarea {
	height: 120px;
	resize: vertical;
}

.image-upload {
	margin-top: 20px;
}



.upload-btn  {
	overflow: hidden;
	border: 0;

}


.image-notice {
	margin-top: 8px;
	font-size: 12px;
	color: #666;
}

.price-input {
	position: relative;
}

.price-input input {
	padding-right: 30px;
}

.price-input::after {
	content: "원";
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	color: #666;
}

.featured {
	margin-top: 20px;
}

.radio-group {
	display: flex;
	gap: 20px;
}

.radio-item {
	display: flex;
	align-items: center;
	gap: 6px;
}

.button-group {
	margin-top: 30px;
	display: flex;
	gap: 10px;
	justify-content: center;
}

.btn {
	padding: 10px 40px;
	border: none;
	border-radius: 4px;
	font-size: 14px;
	cursor: pointer;
}

.btn-cancel {
	background-color: #ccc;
	color: white;
}

.btn-submit {
	background-color: #2196F3;
	color: white;
}
</style>
</head>
<body>

<div class="dashboard-container">
	<c:if test="${not empty info}">
		<div class="container">
			<h1>메뉴 수정</h1>
			<form name="menuUpdateForm" action="/menuUpdateOk" method="post" enctype="multipart/form-data">
	        <input type="hidden" name="menu_idx" value="${info.menu_idx }">
	        
				<div class="form-group">
					<label for="category">카테고리</label> <select id="category" name="m_cate_idx">
						<option value="">카테고리 선택</option>
						
						<c:forEach var="dto" items="${lists}">
						 
							<option value="${dto.m_cate_idx}"<c:if test="${info.m_cate_idx == dto.m_cate_idx}">selected</c:if>>${dto.m_cate_name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label for="menu-name">메뉴명 </label> <input type="text"
						name="menu_name" id="menu_name" required value="${info.menu_name}">
				</div>

				<div class="form-group">
					<label for="description">상세설명</label>
					<textarea name="menu_info" id="menu_info" >${info.menu_info}</textarea>
				</div>

				<div class="form-group">
					<label>이미지 등록</label>
					<div class="image-upload">
						<input type="file" class="upload-btn" id="menu_img" name="menu_img" />
						<p>기존 이미지 :${info.menu_img }</p>
						<input type="hidden" value="${info.menu_img }" name="oldName">
						<p class="image-notice">• 권장크기 이미지 사용 (1440px X 1440px / 1080px X 1080px 권장)</p>
						<p class="image-notice">• JPG, JPEG, PNG 확장자만 등록</p>
					</div>
				</div>


				<div class="form-group">
					<label for="price">가격</label>
					<div class="price-input">
						<input type="text" id="menu_price" name="menu_price" value="${info.menu_price }" required>
					</div>
				</div>

				<div class="featured">
					<label>선주문 여부</label>
					<div class="radio-group">
						<div class="radio-item">
							<input type="radio" id="featured-yes" name="menu_preorder" value="2"  ${info.menu_preorder == 2 ? 'checked' : ''}> <label for="featured-yes">YES</label>
						</div>
						<div class="radio-item">
							<input type="radio" id="featured-no" name="menu_preorder" value="1" ${info.menu_preorder == 1 ? 'checked':'' }> 
							<label for="featured-no">NO</label>
						</div>
					</div>
				</div>

				<div class="button-group">
					<input type="button" class="btn btn-cancel" value="취소" onclick="window.location.href='/storeMenuList'"> <input type="submit" class="btn btn-submit" value="수정">
				</div>

			</form>
		</div>
	</c:if>
	</div>
</body>
</html>