<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="/js/reserveOkList.js"></script>
<script src="/js/ajaxJs.js"></script>
<title>예약 관리</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f8fafc;
}

.container {
	margin-left: 240px;
	margin-top: 80px;
	padding: 24px;
	min-height: calc(100vh - 80px);
}

.page-title {
	margin-bottom: 24px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.search-section {
	background: white;
	padding: 16px;
	border-radius: 8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	margin: 24px auto;
	width: 80%;
}

.search-bar {
	display: flex;
	gap: 12px;
	align-items: center;
	border: 1px solid #e2e8f0;
	border-radius: 6px;
	padding: 8px 16px;
	width: 80%;
}

.search-bar input {
	flex: 1;
	border: none;
	outline: none;
	padding: 8px;
}

.filter-buttons {
	display: flex;
	gap: 8px;
	margin-top: 16px;
}

.content-wrapper {
	display: grid;
	grid-template-columns: 1fr 1.2fr;
	gap: 24px;
}

.reservation-list {
	background: white;
	border-radius: 8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.reservation-item {
	padding: 16px;
	border-bottom: 1px solid #e2e8f0;
	cursor: pointer;
}

.reservation-item:hover {
	background-color: #f8fafc;
}

.reservation-item.active {
	background-color: #eff6ff;
	border-left: 4px solid #3b82f6;
}

.reservation-details {
	background: white;
	border-radius: 8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	padding: 24px;
}

.detail-section {
	margin-bottom: 24px;
}

.detail-section h3 {
	margin-bottom: 16px;
	color: #1e293b;
}

.detail-grid {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 16px;
}

.detail-item {
	padding: 12px;
	background-color: #f8fafc;
	border-radius: 6px;
	display: flex;
    flex-direction: row;
    column-gap: 15px;
    justify-content: flex-start;
    align-items: center;
}

.button {
	padding: 8px 16px;
	border-radius: 6px;
	border: none;
	cursor: pointer;
	font-weight: 500;
}

.button-primary {
	background-color: #121212;
	color: white;
}

.button-outline {
	border: 1px solid #e2e8f0;
	background-color: white;
}

.status-tag {
	display: inline-block;
	padding: 4px 8px;
	border-radius: 4px;
	font-size: 12px;
	font-weight: 500;
	color: #121212;
}

.st_ready {
	background-color: rgba(255, 181, 60, 0.5);
}
.st_apply {
	background-color: #7DC66C;
}
.st_cancel {
	background-color:rgba(243, 85, 60, 0.6);
}
.st_visit {
	background-color: #7DC66C;
}
.st_noshow {
	background-color: rgba(243, 85, 60, 0.6);
}

.request-section {
	background-color: #f8fafc;
	border-radius: 6px;
	padding: 16px;
	margin-top: 16px;
}

.description {
	font-weight: normal;
	color: #757575;
	font-size: 14px;
}

.item-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.search-bar-text {
	font-size: 19px;
}

.table-grid-container {
	flex: 1;
	overflow-y: auto;
	overflow-x: hidden;
	height: 800px;
}

.table-grid {
	display: grid;
	/* grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); */
	gap: 20px;
	padding: 15px;
}

.reservation-details {
	height: 800px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="page-title">
			<h2>승인된 예약</h2>
		</div>
		<section class="search-section">
			<div class="search-bar">
				<input type="text" class="search-bar-text"
					placeholder="고객명 또는 전화번호로 검색">
				<button class="button button-primary">검색</button>
				<div class="button-group">
					<button class="button button-outline">날짜 선택</button>
				</div>
			</div>
		</section>

		<div class="content-wrapper">
			<div class="table-grid-container">
				<div class="reservation-list table-grid">
					<c:forEach var="list" items="${rList }">
						<div class="reservation-item active"
							onclick="selectThisList(${list.reserve_idx})">
							<div class="item-header">
								<span>${list.user_name }</span> <span
									class="status-tag ${stateClass[list.reserve_idx] }">
									${stateMap[list.reserve_idx] }
									</span>
							</div>
							<div>
								<span class="description">${list.reserve_date } </span> <span
									class="description">${list.reserve_time }</span> <span
									class="description">${list.reserve_count }명 </span> <span
									class="description">|</span> <span class="description">${list.table_num }번
									테이블</span>
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
			<div class="reservation-details" id="reserve_details">
				
			</div>
		</div>
	</div>
</body>
</html>