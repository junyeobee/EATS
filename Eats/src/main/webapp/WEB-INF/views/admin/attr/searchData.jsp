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
				<div class="month_graph_box">
					<div class="month_graph_title">
						<div class="month_graph_title_text">이번 달 검색어 통계</div>
						<div class="month_graph_sub">
							<div class="month_graph_sub_count" id="month_graph_sub_count"></div>
							<div class="month_graph_sub_date" id="month_graph_sub_date"></div>
						</div>
					</div>
					<div class="month_graph_select">
						<input type="button" class="month_select_box">
						<div class="month_select_text">월</div>
						<img class="month_select_img" src="/svg/dropbox_arrow.svg">
						<ul class="month_list">
							<li onclick="selectThisTag(this)">1월</li>
							<li onclick="selectThisTag(this)">2월</li>
							<li onclick="selectThisTag(this)">3월</li>
							<li onclick="selectThisTag(this)">4월</li>
							<li onclick="selectThisTag(this)">5월</li>
							<li onclick="selectThisTag(this)">6월</li>
							<li onclick="selectThisTag(this)">7월</li>
							<li onclick="selectThisTag(this)">8월</li>
							<li onclick="selectThisTag(this)">9월</li>
							<li onclick="selectThisTag(this)">10월</li>
							<li onclick="selectThisTag(this)">11월</li>
							<li onclick="selectThisTag(this)">12월</li>
						</ul>
					</div>
				</div>

				<div class="month_graph_data" id="month_graph_box">
					<canvas id="month_graph_data" width="1100" height="300"></canvas>
				</div>
			</div>
			<div class="tag_graph">
				<div class="tag_graph_title">
					<div class="tag_graph_title_main">
						<div class="tag_graph_title_date" id="tag_graph_title_date"></div>
						<div class="tag_graph_title_text">최근 3개월 간 태그 검색 통계</div>
						<div class="tag_graph_labels">
							<div class="tag_graph_label">
								<div class="tag_graph_circle ppm_circle"></div>
								<div class="tag_graph_text"></div>
							</div>
							<div class="tag_graph_label">
								<div class="tag_graph_circle pm_circle"></div>
								<div class="tag_graph_text"></div>
							</div>
							<div class="tag_graph_label">
								<div class="tag_graph_circle t_circle"></div>
								<div class="tag_graph_text" id="month_selected"></div>
							</div>
						</div>
					</div>
					<div class="tag_graph_category">
						<div class="tag_graph_category_title">카테고리 선택</div>
						<div class="tag_graph_tags">
							<c:forEach var="keys" items="${keyList }">
								<div class="tag_graph_tag" id="${keys.cate_key_idx }"
									onclick="selectThisTag(${keys.cate_key_idx})">
									<div class="tag_graph_tag_text">${keys.cate_key_name }</div>
								</div>
							</c:forEach>
						</div>

					</div>
				</div>
				<div class="tag_graph_data" id="tag_graph_box">
					<div class="tag_graph_msg">카테고리를 먼저 선택해주세요.</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>

	function selectThisMonth(t) {
		nowloading(t.innerText);
	}
	
	window.addEventListener('load', nowloading());
	
	function nowloading(selectMonth) {
		if (selectMonth == "" || selectMonth==null) {
			var now_date = new Date();
			var selectMonth = now_date.getMonth()+1;
			}
			var param = 'selectMonth='+selectMonth;
			sendRequest('searchData', param, showLoading, 'POST');
	}

	function showLoading() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var selectMonth = JSON.parse(data).selectMonth;
				var dataList = JSON.parse(data).dataList;
				var fd = JSON.parse(data).first_date;
				var ld = JSON.parse(data).last_date;
				var bd = JSON.parse(data).before_date;
				var count = JSON.parse(data).src_count;
				
				var wordList=[];
				var countList=[];
				for(var i=0; i<dataList.length; i++){
					wordList.push(dataList[i].search_word);
					countList.push(dataList[i].search_count);
				}
				
				var maxnum = Math.ceil(Math.max.apply(null, countList)/10)*10;
				
				var month_graph_sub_date = document.getElementById('month_graph_sub_date');
				month_graph_sub_date.innerText=fd+' ~ '+ld;
				
				var month_graph_sub_count = document.getElementById('month_graph_sub_count');
				month_graph_sub_count.innerText = '총 검색 수 '+count+'회';
				
				var tag_graph_text = document.getElementsByClassName('tag_graph_text');
				tag_graph_text[0].innerText = selectMonth-2+'월';
				tag_graph_text[1].innerText = selectMonth-1+'월';
				tag_graph_text[2].innerText = selectMonth+'월';
				
				var tag_graph_title_date = document.getElementById('tag_graph_title_date');
				tag_graph_title_date.innerText= bd+' ~ '+ld;
				
				if(dataList.length>0){
					defaultMonthChart(wordList, countList, maxnum);
				} else {
					var month_graph_box = document.getElementById('month_graph_box');
					month_graph_box.className='month_graph_data';
					month_graph_box.removeChild(month_graph_box.firstElementChild);
					
					var month_graph_msg = document.createElement('div');
					month_graph_msg.className = 'tag_graph_msg';
					month_graph_msg.innerText = '해당 달의 검색이 없습니다.'
					month_graph_box.appendChild(month_graph_msg);
				}
			}
		}
	}

	function defaultMonthChart(wordList, countList, maxnum) {
		
		var month_graph_box = document.getElementById('month_graph_box');
		month_graph_box.className='month_graph_data month_graph_data_plus';
		month_graph_box.removeChild(month_graph_box.firstElementChild);
		
		var month_canvas = document.createElement('canvas');
		month_canvas.width="1100";
		month_canvas.height="300";
		
		month_graph_box.appendChild(month_canvas);
		
		var month_graph = new Chart(month_canvas, {
			type : 'bar',
			data : {
				labels : wordList,
				datasets : [ {
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
	
	
	function selectThisTag(idx) {
		var month_selected = document.getElementById('month_selected');
		var selectMonth = month_selected.innerText.split('월')[0];

		var param = 'selectTag='+idx+'&selectMonth='+selectMonth;
		sendRequest('tagData', param, showTagData,'GET');
	}
	
	function showTagData() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var values = JSON.parse(data).valueList;
				var countmap = JSON.parse(data).countMap;
				var bd = JSON.parse(data).before_date;
				var ld = JSON.parse(data).last_date;
				
				var valueList = [];
				var countList = [];
				for(var i=0; i<values.length; i++) {
					valueList.push(values[i]);
					countList.push(countmap[values[i]]);
				}
				var maxnum = Math.ceil(Math.max.apply(null, countList)/10)*10;
				maxnum= maxnum==0?10:maxnum;
				
				defaultTagChart(valueList, countList, maxnum);
			}
		}
	}
	
	function defaultTagChart(wordList, countList, maxnum) {
		var tag_graph_box = document.getElementById('tag_graph_box');
		tag_graph_box.className='tag_graph_data tag_graph_data_plus';
		tag_graph_box.removeChild(tag_graph_box.firstElementChild);
		
		var tag_canvas = document.createElement('canvas');
		tag_canvas.width="1100";
		tag_canvas.height="300";
		
		tag_graph_box.appendChild(tag_canvas);
		
		var tag_graph = new Chart(tag_canvas, {
			type : 'bar',
			data : {
				labels : wordList,
				datasets : [ {
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