<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/manager/headerCss.css">
<link rel="stylesheet" href="/css/manager/navigationCss.css">

<meta charset="UTF-8">
<title>배너 목록</title>
<style>
body {
	margin: 0;
	padding: 0;
	margin: 0 auto;
}
/* 테이블 기본 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	background-color: #fff;
	margin: 20px 0;
}

.body_box {
	width: 1440px;
	margin: 0 auto;
	display: flex;
	flex-direction: row;
	padding-bottom: 100px;
}

.my_contents {
	overflow: auto;
	font-family: "Noto Sans KR", sans-serif;
	width: 1240px;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 45px;
	row-gap: 25px;
}
/* 헤더 스타일 */
thead th {
	padding: 15px;
	background-color: #f8f9fa;
	border-top: 1px solid #dee2e6;
	border-bottom: 1px solid #dee2e6;
	text-align: left;
	font-weight: normal;
	color: #333;
}

/* 바디 스타일 */
tbody td {
	padding: 15px;
	border-bottom: 1px solid #dee2e6;
	color: #333;
}

/* 체크박스 스타일 */
input[type="checkbox"] {
	width: 16px;
	height: 16px;
	cursor: pointer;
}

/* 수정 버튼 스타일 */
input[type="button"] {
	background-color: #F3553C;
	color: white;
	border: none;
	padding: 8px 15px;
	border-radius: 4px;
	cursor: pointer;
}

/* 데이터 없을 때 스타일 */
.no-data td {
	text-align: center;
	padding: 30px 0;
	color: #666;
}

/* 상단 버튼 영역 */
.button-group {
	text-align: right;
	margin: 20px 0;
}

.button-group button {
	padding: 8px 20px;
	margin-left: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.btn-delete {
	background-color: #6c757d;
	color: white;
}

.btn-register {
	background-color: #F3553C;
	color: white;
}

.btn-delete {
	padding: 8px 20px;
	margin-left: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

a {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 부모 요소의 색상 상속 */
}
</style>
</head>

<body>

	<%@ include file="/layout_component/header.jsp"%>

	<div class="body_box" id="body_box">
		<%@ include file="/layout_component/navigation.jsp"%>

		<div class="my_contents" id="my_contents">

			<h2>배너 관리</h2>

			<form name="bannerlistForm" action="/bannerDeleteOk" method="post">
				<div class="button-group">
					<input type="submit" class="btn-delete" value="선택삭제">
					<button class="btn-register">
						<a href="/bannerInsert">등록하기</a>
					</button>
				</div>
				<table>
					<thead>
						<tr>
							<th>□</th>
							<th>번호</th>
							<th>배너이미지</th>
							<th>배너명</th>
							<th>배너url</th>
							<th>사용여부</th>
							<th>수정</th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${empty lists }">
							<tr>
								<td>등록된 배너가 없습니다.</td>
							</tr>

						</c:if>

						<c:forEach var="dto" items="${lists }">
							<tr>
								<td><input type="checkbox" name="banner_idx"
									value="${dto.banner_idx }"></td>
								<td>${dto.banner_idx }</td>
								<td><img src="../img/${dto.banner_img }"
									style='width: 60px; height: 60px;'></td>
								<td>${dto.banner_name }</td>
								<td>${dto.banner_url }</td>

								<c:if test="${dto.banner_stat ==1}">
									<td>사용</td>
								</c:if>
								<c:if test="${dto.banner_stat ==2}">
									<td>사용안함</td>
								</c:if>

								<td><input type="button" value="수정"
									onclick="location.href='/bannerUpdate'"></td>
							</tr>
						</c:forEach>

					</tbody>

				</table>
			</form>
		</div>
	</div>
</body>

</html>