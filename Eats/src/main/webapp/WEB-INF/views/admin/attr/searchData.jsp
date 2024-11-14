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
						<div class="month_graph_title_text" id="month_graph_title_text">${thisMonth }월
							검색어 통계</div>
						<div class="month_graph_sub">
							<div class="month_graph_sub_count" id="month_graph_sub_count">0회</div>
							<div class="month_graph_sub_date" id="month_graph_sub_date">
								${thisDate.first_date } ~ ${thisDate.last_date }</div>
						</div>
					</div>
					<div class="month_graph_select">
						<div class="month_select_box" onclick="dropForSelectWord(this)">
							<div class="month_select_text" id="month_select_text">${thisMonth }월</div>
							<img class="month_select_img" src="/svg/dropbox_arrow.svg">
						</div>
						<div class="month_list_box" id="month_list_box">
							<ul class="month_list">
								<c:forEach var="i" begin="1" end="12">
									<li onclick="selectThisWordMonth(this)">${i }월</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

				<div class="month_graph_data" id="month_graph_box">
					<canvas id="month_graph_data" width="1100" height="300"></canvas>
				</div>
			</div>
			<div class="tag_graph">
				<div class="tag_graph_title">
					<div class="tag_graph_title_main">
						<div class="tag_graph_title_date" id="tag_graph_title_date">
							${lastDate.first_date } ~ ${thisDate.last_date }</div>
						<div class="tag_graph_title_text">최근 3개월 간 태그 검색 통계</div>
						<div class="tag_graph_labels">
							<div class="tag_graph_label">
								<div class="tag_graph_circle ppm_circle"></div>
								<div class="tag_graph_text">${pastMonth }월</div>
							</div>
							<div class="tag_graph_label">
								<div class="tag_graph_circle pm_circle"></div>
								<div class="tag_graph_text">${beforeMonth }월</div>
							</div>
							<div class="tag_graph_label">
								<div class="tag_graph_circle t_circle"></div>
								<div class="tag_graph_text" id="month_selected">${thisMonth }월</div>
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
					<div class="month_graph_select">
						<div class="month_select_box" onclick="dropForSelectTag(this)">
							<div class="month_select_text" id="tag_month_select_text">${thisMonth }월</div>
							<img class="month_select_img" src="/svg/dropbox_arrow.svg">
						</div>
						<div class="month_list_box" id="tag_month_list_box">
							<ul class="month_list">
								<c:forEach var="i" begin="1" end="12">
									<li onclick="selectThisTagMonth(this)">${i }월</li>
								</c:forEach>
							</ul>
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
	function selectThisWordMonth(t) {
		var selectMonth = getOnlyMonth(t.innerText);

		var month_list_box = document.getElementById('month_list_box');
        month_list_box.style.height = '0';
        month_list_box.style.overflow='hidden';
        
        var month_select_text = document.getElementById('month_select_text');
        month_select_text.innerText = selectMonth+'월';
        
		nowloading();
	}
	
	function getOnlyMonth(monthText) {
		var onlyMonth = monthText.split('월')[0];
		
		return onlyMonth;
	}
	
	window.addEventListener('load', nowloading());
	
	function nowloading() {
        var month_select_text = document.getElementById('month_select_text');
		var selectMonth = getOnlyMonth(month_select_text.innerText);
		
			var param = 'selectMonth='+selectMonth;
			sendRequest('MonthData', param, showLoading, 'POST');
	}

	function showLoading() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var selectMonth = JSON.parse(data).selectMonth;
				var dataList = JSON.parse(data).dataList;
				var fd = JSON.parse(data).first_date;
				var ld = JSON.parse(data).last_date;
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
				
				var month_graph_title_text = document.getElementById('month_graph_title_text');
				month_graph_title_text.innerText=selectMonth+'월 검색어 통계';
				
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
				grid: { // [y 축 데이터 시트 배경 선색 표시]
					drawBorder: false,
					color: '#ffffff',
				},
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
	
	function selectThisTagMonth(t) {
		var tag_month_list_box = document.getElementById('tag_month_list_box');
		tag_month_list_box.style.height = '0';
		tag_month_list_box.style.overflow='hidden';

        var tag_month_select_text = document.getElementById('tag_month_select_text');
        tag_month_select_text.innerText = getOnlyMonth(t.innerText)+'월';
        
        
        var tags = document.getElementsByClassName('tag_graph_tag');
        var keyidx = tags[0].id;
		for(var i=0; i<tags.length; i++) {
			if(tags[i].firstElementChild.style.color=='white') {
				keyidx = tags[i].id;
			}
		}
		
		selectThisTag(keyidx);
	}
	
	function selectThisTag(idx) {
		var tag_month_select_text = document.getElementById('tag_month_select_text');
		var selectMonth= getOnlyMonth(tag_month_select_text.innerText);

		var tags = document.getElementsByClassName('tag_graph_tag');
		for(var i=0; i<tags.length; i++) {
			tags[i].style.backgroundColor='white';
			tags[i].firstElementChild.style.color='#f3553c';
		}

		var tag_box = document.getElementById(idx);
		tag_box.style.backgroundColor='#f3553c';
		tag_box.firstElementChild.style.color='white'; 

		var param = 'selectTag='+idx+'&selectMonth='+selectMonth;
		sendRequest('tagData', param, showTagData,'GET');
	}
	
	function showTagData() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var values = JSON.parse(data).valueList;
				var countmap1 = JSON.parse(data).countMap1;
				var countmap2 = JSON.parse(data).countMap2;
				var countmap3 = JSON.parse(data).countMap3;
				var selectMonth=JSON.parse(data).selectMonth;
				var fd = JSON.parse(data).first_date;
				var ld = JSON.parse(data).last_date;
				
				var valueList = [];
				var countList1 = [];
				var countList2 = [];
				var countList3 = [];
				for(var i=0; i<values.length; i++) {
					valueList.push(values[i]);
					countList1.push(countmap1[values[i]]);
					countList2.push(countmap2[values[i]]);
					countList3.push(countmap3[values[i]]);
				}
				
				var maxList = [];
				maxList.push(Math.max.apply(null, countList1));
				maxList.push(Math.max.apply(null, countList2));
				maxList.push(Math.max.apply(null, countList3));

				var maxnum = Math.ceil(Math.max.apply(null, maxList)/10)*10;
				maxnum= maxnum==0?10:maxnum;

				var tag_graph_text = document.getElementsByClassName('tag_graph_text');
				tag_graph_text[0].innerText = (selectMonth<3?selectMonth+10:selectMonth-2)+'월';
				tag_graph_text[1].innerText = (selectMonth<2?selectMonth+11:selectMonth-1)+'월';
				tag_graph_text[2].innerText = selectMonth+'월';
				
				var tag_graph_title_date = document.getElementById('tag_graph_title_date');
				tag_graph_title_date.innerText= fd+' ~ '+ld;
				
				defaultTagChart(valueList, countList1,countList2,countList3, maxnum);
			}
		}
}
	
	function defaultTagChart(wordList,countList1,countList2,countList3, maxnum) {
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
					data : countList1,
					backgroundColor : ['#FBD288'],
					borderColor : [ '#FBD288'],
					borderWidth : 1,
					borderRadius: 6,
				},
				{
					data : countList2,
					backgroundColor : ['#FF9C73'],
					borderColor : [ '#FF9C73'],
					borderWidth : 1,
					borderRadius: 6,
				},
				{
					data : countList3,
					backgroundColor : ['#FF4545'],
					borderColor : [ '#FF4545'],
					borderWidth : 1,
					borderRadius: 6,
				}]
			},
			options : {
				reponsive: false,
				maxBarThickness: 35,
				plugins: {
				legend: {
					display: false
				}},
				scales : {
					y: { // [y 축 관련 설정] 
					stacked:true,
						min: 0, // [y 축 데이터 설정 0 ~ 30 까지 제한]
						max: maxnum,
						grid: { // [y 축 데이터 시트 배경 선색 표시]
							drawBorder: false,
						},
						ticks: {
							color: '#B1B1B1', // [y 축 폰트 색상 설정]
							font: { // [y축 폰트 스타일 변경]
								family: 'Noto Sans KR',
								size: 14,
								weight:500,
								lineHeight: 5,   
							} 
						}
			},
			x: { // [x 축 관련 설정] 
				stacked:true,
				grid: { // [y 축 데이터 시트 배경 선색 표시]
					drawBorder: false,
					color: '#ffffff',
				},
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
	
	function dropForSelectWord(t) {
        var month_list_box = document.getElementById('month_list_box');

        if (month_list_box.style.height == '100%') {
            month_list_box.style.height = '0';
            month_list_box.style.overflow='hidden';
            
        } else {
            month_list_box.style.height = '100%';
            month_list_box.style.overflow='visible';
        }
    }
	
	function dropForSelectTag(t) {
        var month_list_box = document.getElementById('tag_month_list_box');

        if (month_list_box.style.height == '100%') {
            month_list_box.style.height = '0';
            month_list_box.style.overflow='hidden';
            
        } else {
            month_list_box.style.height = '100%';
            month_list_box.style.overflow='visible';
        }
    }

</script>
</html>