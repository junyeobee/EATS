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
<style>
    .body{
        margin: 0;
        padding: 0;
        font-family: 'Noto Sans KR', sans-serif;
    }
	.container {
	    max-width: 1200px;
	    margin: 0 auto;
	    margin-top : 100px;
	}
	
	.title {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    margin-bottom: 24px;
	}
	
	h1 {
	    font-size: 24px;
	    font-weight: 600;
	    margin: 0;
	}
	
	.period-tabs {
	    display: inline-flex;
	    background: #fff;
	    border-radius: 100px;
	    padding: 4px;
	    border: 1px solid #e2e8f0;
	}
	
	.btn-period {
	    padding: 8px 16px;
	    border: none;
	    background: transparent;
	    border-radius: 100px;
	    font-size: 14px;
	    color: #666;
	    cursor: pointer;
	    transition: all 0.2s;
	}
	
	.btn-period.active {
	    background: #3182f6;
	    color: white;
	    font-weight: 500;
	}
	
	.sales-summary {
	    background: white;
	    border-radius: 16px;
	    padding: 24px;
	    margin-bottom: 24px;
	    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
	}
	
	.total-sales {
	    margin-bottom: 24px;
	}
	
	.total-sales .label {
	    font-size: 13px;
	    color: #666;
	    margin-bottom: 4px;
	}
	
	.total-sales .amount {
	    font-size: 24px;
	    font-weight: 600;
	}
	
	.sales-details {
	    display: grid;
	    grid-template-columns: repeat(3, 1fr);
	    gap: 24px;
	    padding-top: 24px;
	    border-top: 1px solid #e2e8f0;
	}
	
	.detail-item .label {
	    font-size: 13px;
	    color: #666;
	    margin-bottom: 4px;
	}
	
	.detail-item .value {
	    font-size: 16px;
	    font-weight: 500;
	}
	
	.detail-item .count {
	    font-size: 13px;
	    color: #666;
	    margin-left: 4px;
	}
	
	.negative {
	    color: #dc2626;
	}
	
	.chart-container {
	    background: white;
	    border-radius: 16px;
	    padding: 24px;
        height: 500px;
	    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
	}
    #salesChart {
        width: 100%;
        height: 100%;
    }
</style>
</head>
<body>
	<%@ include file="../store_Header.jsp"%>
	<%@ include file="../nav.jsp"%>
	 <div class="container">
        <div class="title">
            <h1>매출 분석</h1>
            <div class="period-tabs">
                <button type="button" class="btn-period active" data-period="hour">최근영업</button>
                <button type="button" class="btn-period" data-period="1w">1주</button>
                <button type="button" class="btn-period" data-period="1m">1달</button>
                <button type="button" class="btn-period" data-period="3m">3달</button>
            </div>
        </div>

        <div class="sales-summary">
            <div class="total-sales">
                <div class="label" id = "dateTitle">최근 24시간</div>
                <div class="amount">총 매출 금액 <span id = "totalSellDetail">${totalSell}원</span></div>
                <div class="detail-item">
                    <div class="value"><span class="count">${totalCnt}건</span></div>
                </div>
            </div>
        </div>

        <div class="chart-container">
            <canvas id="salesChart"></canvas>
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
    maintainAspectRatio: false,
    interaction: {
        mode: 'point',
        intersect: true
    },
    
    plugins: {
        legend: {
            display: true,
            position: 'top',
            align: 'end',
            labels: {
                padding: 20,
                boxWidth: 12,
                font: {
                    size: 12
                }
            }
        },
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
            let totalSellDetail = 0;
            let totalCnt = 0;
            response.forEach(function(item) {
                item.salesAmount = parseInt(item.salesAmount);
                item.salesCount = parseInt(item.salesCount);
                console.log(item.salesAmount);
                totalSellDetail += item.salesAmount;
                totalCnt += item.salesCount;
                
            });
            let totalselltext = document.getElementById('totalSellDetail');
            let df = new Intl.NumberFormat();
            totalSellDetail = df.format(totalSellDetail, '#.##0');
            totalselltext.textContent = totalSellDetail + '원';
            let totalCnttext = document.querySelector('.detail-item .value .count');
            totalCnttext.textContent = totalCnt + '건';
            let dateTitle = document.getElementById('dateTitle');
            switch(period) {
                case 'hour':
                    dateTitle.textContent = '최근 24시간';
                    break;
                case '1w':
                    dateTitle.textContent = '최근 1주';
                    break;
                case '1m':
                    dateTitle.textContent = '최근 1달';
                    break;
                case '3m':
                    dateTitle.textContent = '최근 3달';
                    break;
            }
            dateTitle.textContent = dateTitle.textContent;
        }
    });
}
</script>
</html>