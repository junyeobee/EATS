<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./css/manager/searchDataCss.css">
<link rel="stylesheet" href="./css/manager/headerCss.css">
<link rel="stylesheet" href="./css/manager/navigationCss.css">

<script type="text/javascript" src="js/ajaxJs.js"></script>
<script type="text/javascript" src="js/adminScript.js"></script>

<title>Insert title here</title>
</head>
<body>
	<%@ include file="/layout_component/header.jsp"%>
	<div class="body_box" id="body_box">
		<%@ include file="/layout_component/navigation.jsp"%>
		<div class="my_contents" id="my_contents">
			<div class="month_graph">
				<div class="month_graph_title">
					<div class="month_graph_title_text">이번 달 검색어 통계</div>
					<div class="month_graph_sub">
						<div class="month_graph_sub_count">총 검색 수 ${src_count } 회</div>
						<div class="month_graph_sub_date">${first_day }~${last_day }</div>
					</div>
				</div>
				<div class="month_graph_data">
					<canvas id="month_graph_data" width="1100" height="300"></canvas>
				</div>
			</div>
			<div class="tag_graph">
				<div class="tag_graph_title">
					<div class="tag_graph_title_main">
						<div class="tag_graph_title_date">2024.9 ~ 2024.11</div>
						<div class="tag_graph_title_text">최근 3개월 간 태그 검색 통계</div>
						<div class="tag_graph_labels">
							<div class="tag_graph_label">
								<div class="tag_graph_circle ppm_circle"></div>
								<div class="tag_graph_text">9월</div>
							</div>
							<div class="tag_graph_label">
								<div class="tag_graph_circle pm_circle"></div>
								<div class="tag_graph_text">10월</div>
							</div>
							<div class="tag_graph_label">
								<div class="tag_graph_circle t_circle"></div>
								<div class="tag_graph_text">11월</div>
							</div>
						</div>
					</div>
					<div class="tag_graph_category">
						<div class="tag_graph_category_title">카테고리 선택</div>
						<div class="tag_graph_tags">
							<c:forEach var="keys" items="${keyList }">
								<div class="tag_graph_tag">
									<div class="tag_graph_tag_text">${keys }</div>
								</div>
							</c:forEach>
						</div>

					</div>
				</div>
				<div class="tag_graph_data">
					<canvas id="tag_graph_data" width="1100" height="300"></canvas>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	

	window.addEventListener('load', function() {
		var selectMonth= "${selectMonth}";

		if (selectMonth == "") {
			var now_date = new Date();
			var now_month = now_date.getMonth()+1;
			var param = 'selectMonth='+now_month;
			sendRequest('searchData', param, showLoading, 'POST');
		}
	});

	function showLoading() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var selectMonth = JSON.parse(data).selectMonth;
				var dataList = JSON.parse(data).dataList;
				
				var wordList=[];
				var countList=[];
				for(var i=0; i<dataList.length; i++){
					wordList.push(dataList[i].search_word);
					countList.push(dataList[i].search_count);
				}
				
				var maxnum = Math.ceil(Math.max.apply(null, countList)/10)*10;
				
				defaultMonthChart(wordList, countList, maxnum);
				defaultTagChart(wordList, countList, maxnum);
			}
		}
	}

	var month_data = document.getElementById('month_graph_data');

	function defaultMonthChart(wordList, countList, maxnum) {
		var month_graph = new Chart(month_data, {
			type : 'bar',
			data : {
				labels : wordList,
				datasets : [ {
					//label : '(회)',
					data : countList,
					backgroundColor : ['#FFC566'],
					borderColor : [ '#FFC566'],
					borderWidth : 1,
					borderRadius: 6,
				} ]
			},
			options : {
				maxBarThickness: 35,
				plugins: {
				legend: {
					display: false
				}},
				scales : {
					y: { // [y 축 관련 설정] 
						min: 0, // [y 축 데이터 설정 0 ~ 30 까지 제한]
						max: maxnum,
						grid: { // [y 축 데이터 시트 배경 선색 표시]
							drawBorder: false,
							color: function(context) {
								if (context.tick.value >= 20) {
									return 'rgba(0, 0, 255, 0.2)'; // 파랑
								}
								else if (context.tick.value < 20 && context.tick.value >= 10) {
									return 'rgba(255, 0, 0, 0.2)'; // 빨강
								}
								else {
									return 'rgba(0, 0, 0, 0.2)'; // 검정색
								}    								
							}
						},
						ticks: {
							color: '#B1B1B1', // [y 축 폰트 색상 설정]
							font: { // [y축 폰트 스타일 변경]
								family: 'Noto Sans KR',
								size: 14,
								weight:500,
								lineHeight: 3,   
							} 
						}
			},
			x: { // [x 축 관련 설정] 
				ticks: {
					color: '#000000', // [x 축 폰트 색상 설정]
					font: { // [x축 폰트 스타일 변경]
						family: 'Noto Sans KR',
						size: 14,
						weight: 400,
						lineHeight: 0.5,   
					} 
				}

			}
		}
		}});
	}
	
	var tag_data = document.getElementById('tag_graph_data');
	
	function defaultTagChart(wordList, countList, maxnum) {
		var tag_graph = new Chart(tag_data, {
			type : 'bar',
			data : {
				labels : wordList,
				datasets : [ {
					//label : '(회)',
					data : countList,
					backgroundColor : ['#FFC566'],
					borderColor : [ '#FFC566'],
					borderWidth : 1,
					borderRadius: 6,
				} ]
			},
			options : {
				maxBarThickness: 35,
				plugins: {
				legend: {
					display: false
				}},
				scales : {
					y: { // [y 축 관련 설정] 
						min: 0, // [y 축 데이터 설정 0 ~ 30 까지 제한]
						max: maxnum,
						grid: { // [y 축 데이터 시트 배경 선색 표시]
							drawBorder: false,
							color: function(context) {
								if (context.tick.value >= 20) {
									return 'rgba(0, 0, 255, 0.2)'; // 파랑
								}
								else if (context.tick.value < 20 && context.tick.value >= 10) {
									return 'rgba(255, 0, 0, 0.2)'; // 빨강
								}
								else {
									return 'rgba(0, 0, 0, 0.2)'; // 검정색
								}    								
							}
						},
						ticks: {
							color: '#B1B1B1', // [y 축 폰트 색상 설정]
							font: { // [y축 폰트 스타일 변경]
								family: 'Noto Sans KR',
								size: 14,
								weight:500,
								lineHeight: 3,   
							} 
						}
			},
			x: { // [x 축 관련 설정] 
				ticks: {
					color: '#000000', // [x 축 폰트 색상 설정]
					font: { // [x축 폰트 스타일 변경]
						family: 'Noto Sans KR',
						size: 14,
						weight: 400,
						lineHeight: 0.5,   
					} 
				}

			}
		}
		}});
	}
</script>
</html>