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
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-annotation"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="period-wrap">
			<button type="button" class="btn-period active" data-period="hour">최근영업</button>
			<button type="button" class="btn-period" data-period="1w">1주</button>
			<button type="button" class="btn-period" data-period="1m">1달</button>
			<button type="button" class="btn-period" data-period="3m">3달</button>
		</div>
		
		<div class="chart-wrap">
			<canvas id="salesChart"></canvas>
		</div>
		
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
        pointStyle: 'circle',
        pointRadius: 4,
        fill: true,
        pointHoverRadius: 8,
        borderWidth: 2,
    }]
};

const chartOptions = {
    responsive: true,
    interaction: {
        mode: 'point',
        intersect: true
    },
    plugins: {
        annotation: {
            annotations: {
                line1: {
                    type: 'line',
                    xMin: 3,
                    xMax: 3,
                    yMin: 0,
                    yMax: 0,
                    borderColor: 'rgb(37, 112, 235)',
                    borderWidth: 2,
                    display: false
                }
            }
        },
        tooltip: {
            yAlign: 'bottom',
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
                    return context.parsed.y.toLocaleString() + '원';
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

let chart;

document.addEventListener('DOMContentLoaded', function() {
    chart = initChart();
    const sellData = ${jsonData};
    
    updateChart(sellData);
    
    chart.canvas.addEventListener('mousemove', function(e) {
        const points = chart.getElementsAtEventForMode(e, 'point', { intersect: true });
        
        if (points.length) {
            const point = points[0];
            const dataset = chart.data.datasets[point.datasetIndex];
            const value = dataset.data[point.index];
            
            chart.options.plugins.annotation.annotations.line1.display = true;
            chart.options.plugins.annotation.annotations.line1.xMin = point.index;
            chart.options.plugins.annotation.annotations.line1.xMax = point.index;
            chart.options.plugins.annotation.annotations.line1.yMax = value;
        } else {
            chart.options.plugins.annotation.annotations.line1.display = false;
        }
        chart.update('none');
    });

    const periodBtns = document.querySelectorAll('.btn-period');
    periodBtns.forEach(function(btn) {
        btn.addEventListener('click', function() {
            periodBtns.forEach(function(b) { 
                b.classList.remove('active');
            });
            this.classList.add('active');
            
            const period = this.dataset.period;
            sendRequest(period);
        });
    });
});

function initChart() {
    const ctx = document.getElementById('salesChart').getContext('2d');
    return new Chart(ctx, {
        type: 'line',
        data: chartData,
        options: chartOptions
    });
}

function updateChart(data) {
    chartData.labels = data.map(function(item) { return item.sellDate; });
    chartData.datasets[0].data = data.map(function(item) {
        return parseInt(item.salesAmount.replace(/,/g, ''));
    });
    chart.update();
}

function formatDate(date) {
    const year = date.getFullYear();
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    return year + '-' + month + '-' + day;
}

function sendRequest(period) {
    const now = new Date();
    let startDateTime, endDateTime;
    switch(period) {
        case 'hour':
            startDateTime = formatDate(now) + ' 00:00';
            endDateTime = formatDate(now) + ' 23:59';
            break;
        case '1w':
            const lastWeek = new Date(now.setDate(now.getDate() - 6));
            startDateTime = formatDate(lastWeek) + ' 00:00';
            endDateTime = formatDate(new Date()) + ' 23:59';
            break;
        case '1m':
            const lastMonth = new Date(now.setMonth(now.getMonth() - 1));
            startDateTime = formatDate(lastMonth) + ' 00:00';
            endDateTime = formatDate(new Date()) + ' 23:59';
            break;
        case '3m':
            const last3Months = new Date(now.setMonth(now.getMonth() - 2));
            last3Months.setDate(1);
            startDateTime = formatDate(last3Months) + ' 00:00';
            endDateTime = formatDate(new Date()) + ' 23:59';
            break;
    }

    $.ajax({
        url: '/sellDetailLists',
        type: 'POST',
        data: {
			'storeIdx': 1,
            'startDateTime': startDateTime,
            'endDateTime': endDateTime,
            'dateType': period
        },
		dataType: 'json',
        success: function(response) {
            updateChart(response);
        }
    });
}
</script>
</html>