<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<div class="month_graph_sub_count">총 검색 수 322 회</div>
						<div class="month_graph_sub_date">2024.10.01 ~ 2024.10.31</div>
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
							<div class="tag_graph_tag">
								<div class="tag_graph_tag_text">좌석 유형</div>
							</div>
							<div class="tag_graph_tag">
								<div class="tag_graph_tag_text">음식 종류</div>
							</div>
						</div>

					</div>
				</div>
				<div class="tag_graph_data">
					<canvas id="tag_graph_data"></canvas>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	var month_data = document.getElementById('month_graph_data');

	var month_graph = new Chart(month_data, {
		type: 'bar',
	    data: {
	        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
	        datasets: [{
	            label: '# of Votes',
	            data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	});
</script>
</html>