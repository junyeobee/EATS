<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:set var="jsonData">
   [
   <c:forEach items="${sellData}" var="item" varStatus="status">
       {
           "sellDate": "${item.sellDate}",
           "salesAmount": "${item.salesAmount}",
           "salesCount": "${item.salesCount}",
           "dateType": "${item.dateType}"
       }${not status.last ? ',' : ''}
   </c:forEach>
   ]
</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<div class="container">
	   <!-- 기간 선택 토글 버튼 -->
		<div class="period-wrap">
			<button type="button" class="btn-period active" data-period="today">최근영업</button>
			<button type="button" class="btn-period" data-period="1w">1주</button>
			<button type="button" class="btn-period" data-period="1m">1달</button>
			<button type="button" class="btn-period" data-period="3m">3달</button>
			<button type="button" class="btn-period" data-period="custom">기간설정</button>
		</div>
		
		<!-- 그래프 영역 -->
		<div class="chart-wrap">
			<canvas id="salesChart"></canvas>
		</div>
		
		<!-- datepicker 영역 (기본 숨김) -->
		<div class="date-picker-wrap" style="display:none;">
			<input type="text" id="startDate" readonly>
			<span>~</span>
			<input type="text" id="endDate" readonly>
			<button type="button" id="searchBtn">조회</button>
		</div>
	</div>
</body>
<script>
	const chartData = {
	   labels: [],
	   datasets: [{
	       label: '매출',
	       data: [],
	       borderColor: '#2570eb',
	       backgroundColor: 'rgba(37, 112, 235, 0.1)',
	       tension: 0.4,
	       pointStyle: 'circle',
	       pointRadius: 4,
	       pointHoverRadius: 8,
	       borderWidth: 2
	   }]
	};
	
	const chartOptions = {
	   responsive: true,
	   plugins: {
	       legend: {
	           display: false
	       },
	       tooltip: {
	           backgroundColor: 'white',
	           titleColor: '#64748b',
	           titleFont: {size: 12},
	           bodyColor: '#64748b',
	           bodyFont: {size: 14, weight: 'bold'},
	           borderColor: '#e2e8f0',
	           borderWidth: 1,
	           padding: 12,
	           displayColors: false,
	           callbacks: {
	               label: function(context) {
	                   return ${context.parsed.y.toLocaleString()}+"원";
	               }
	           }
	       }
	   },
	   scales: {
	       y: {
	           beginAtZero: true,
	           grid: {
	               color: '#f1f5f9'
	           },
	           ticks: {
	               callback: function(value) {
	                   return value.toLocaleString() + '원';
	               }
	           }
	       },
	       x: {
	           grid: {
	               display: false
	           }
	       }
	   }
	};
	
	document.addEventListener('DOMContentLoaded', function() {
	   const chart = initChart();
	   const sellData = ${jsonData};
	   
	   console.log(sellData);
	   
	   updateChart(sellData);
	
	   function initChart() {
	       const ctx = document.getElementById('salesChart').getContext('2d');
	       return new Chart(ctx, {
	           type: 'line',
	           data: chartData,
	           options: chartOptions
	       });
	   }
	
	   function updateChart(data) {
	       chartData.labels = data.map(item => item.sellDate);
	       chartData.datasets[0].data = data.map(item => parseInt(item.salesAmount.replace(/,/g, '')));
	       chart.update();
	   }
	});
</script>
</html>