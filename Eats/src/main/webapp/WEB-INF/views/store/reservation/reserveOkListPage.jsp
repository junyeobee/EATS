<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="/js/ajaxJs.js"></script>

<link rel="stylesheet" href="../css/user/storeDetail/reserveCal.css">
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
	background-color: rgba(243, 85, 60, 0.6);
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

.reservation-noitem {
	text-align: center;
}

.calendar_container {
	display: none;
	border: 1px solid #e2e8f0;
	border-radius: 8px;
	padding: 0px 20px;
	position: absolute;
	top: 40px;
	left: 0px;
	z-index: 20;
	padding-top: 20px;
	background-color: #fefefe;
}

.button-group {
	position: relative;
}

.calendar_reset {
	font-size: 14px;
	color: #878787;
	top: 9px;
	position: absolute;
	right: 20px;
}

.calendar_reset:hover {
	cursor: pointer;
	text-decoration: underline;
}

.cal-wrapper .calendar-header button {
	padding: 5px 10px;
    cursor: pointer;
    background-color: #349FFB;
    border-radius: 5px;
    border: 0;
    color: white;
}

.cal-wrapper .selectable:hover {
    background-color: #349FFB;
    color:#fefefe;
    opacity:0.8;
}

.cal-wrapper .selected {
    background-color: #349FFB; 
    color: white;
}
</style>
</head>
<body>
	<%@ include file="../store_Header.jsp"%>
	<%@ include file="../nav.jsp"%>
	<div class="container">
		<div class="page-title">
			<h2>승인된 예약</h2>
		</div>
		<section class="search-section">
			<div class="search-bar">
				<input type="text" class="search-bar-text" id="search_text"
					value="${searching==null||searching==''?'':searching }"
					placeholder="고객명 또는 전화번호로 검색">
				<button class="button button-primary" id="search_button"
					onclick="searchThisWord()" oninput="searchThisWord(e)">검색</button>
				<div class="button-group">
					<button class="button button-outline" id="selected_date"
						onclick="openCalendar()">${selectedDate==""||selectedDate==null?'날짜선택':selectedDate}</button>
					<div class="calendar_container" id="calendar_container">
						<a class="calendar_reset" href='/store/reserveOkListPage?searching=${searching }'>날짜 초기화</a>
						<!-- 캘린더 영역(s) -->
						<div class="cal-wrapper" id="calendar_box">
							<div id="calendar"></div>
						</div>
						<!-- 캘린더 영역(e) -->
					</div>
				</div>
			</div>
		</section>

		<div class="content-wrapper">
			<div class="table-grid-container">
				<div class="reservation-list table-grid">
					<c:if test="${rList.size()>0 }">
						<c:forEach var="list" items="${rList }">
							<div class="reservation-item active"
								onclick="selectThisList(${list.reserve_idx})">
								<div class="item-header">
									<span>${list.user_name }</span> <span
										class="status-tag ${stateClass[list.reserve_idx] }">
										${stateMap[list.reserve_idx] } </span>
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
					</c:if>
					<c:if test="${rList.size()==0 }">
						<div class="reservation-noitem">승인된 예약 목록이 없습니다.</div>
					</c:if>
				</div>
			</div>
			<div class="reservation-details" id="reserve_details"></div>
		</div>
	</div>
</body>
<script src="/js/reserveOkList.js"></script>
</html>