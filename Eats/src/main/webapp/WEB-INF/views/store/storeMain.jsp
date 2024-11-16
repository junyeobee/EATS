<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="timeSlotLabels" value="" />
<c:set var="timeSlotData" value="" />

<c:forEach items="${dash.reserveTimeSlotWithToday}" var="slot" varStatus="status">
    <c:set var="timeSlotLabels" value="${timeSlotLabels}'${slot.timeslot}'${!status.last ? ',' : ''}" />
    <c:set var="timeSlotData" value="${timeSlotData}${slot.reservationcount}${!status.last ? ',' : ''}" />
</c:forEach>
<!DOCTYPE html>
<html>
<head>
    <style>
        :root {
            --primary-blue: #3b82f6;
            --primary-red: #ef4444;
            --light-blue: #f0f7ff;
            --dark-blue: #1e40af;
            --gray: #64748b;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Pretendard', sans-serif;
        }

        body {
            background-color: var(--light-blue);
            padding: 16px;
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin-bottom: 16px;
        }

        .stat-card {
            background: white;
            padding: 16px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(59, 130, 246, 0.1);
            transition: transform 0.2s ease;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
        }

        .stat-label {
            font-size: 13px;
            color: var(--gray);
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .stat-value {
            font-size: 20px;
            font-weight: 600;
            color: var(--dark-blue);
        }

        .trend-up {
            color: var(--primary-red);
            font-size: 12px;
            font-weight: 500;
        }

        .chart-row {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 16px;
            margin-bottom: 16px;
        }

        .chart-card {
            background: white;
            padding: 16px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(59, 130, 246, 0.1);
        }

        .chart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }

        .chart-title {
            font-size: 15px;
            font-weight: 600;
            color: var(--dark-blue);
        }

        .chart-period {
            font-size: 13px;
            color: var(--gray);
            padding: 4px 8px;
            background: var(--light-blue);
            border-radius: 4px;
        }

        .chart-container {
            width: 100%;
            height: 240px;
            background: var(--light-blue);
            border-radius: 8px;
            padding: 16px;
        }

        .metric-row {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 12px;
            margin-bottom: 16px;
        }

        .metric-card {
            background: white;
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(59, 130, 246, 0.1);
        }

        .metric-date {
            font-size: 12px;
            color: var(--gray);
            margin-bottom: 4px;
        }

        .metric-value {
            font-size: 14px;
            font-weight: 600;
            color: var(--dark-blue);
            margin-bottom: 4px;
        }

        .metric-change {
            font-size: 11px;
            color: var(--primary-red);
        }
        .chart-container, .pie-chart {
		    width: 100%;
		    height: 240px;
		    background: var(--light-blue);
		    border-radius: 8px;
		    padding: 16px;
		}
	
		.pie-chart {
		    width: 100%;
		    height: 240px;
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: center;
		}
		
		.pie-chart canvas {
		    max-width: 100%;
		    max-height: 100%;
		}
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript" src = "../js/Chart.js"></script>
    <script>
		function createGenderChart(genderData) {
		   const ctx = document.getElementById('genderCanvas').getContext('2d');
		   
		   return ChartManager.createChart(ctx, 'doughnut', {
		       labels: ['남성', '여성'],
		       data: [genderData.male, genderData.female]
		   }, {
		       plugins: {
		           legend: {
		               display: false,
		               position: 'right',
		               align: 'center',
		               labels: {
		                   padding: 20,
		                   boxWidth: 12,
		                   font: {
		                       size: 12
		                   }
		               }
		           },
		           htmlLegend: {
		               containerID: 'gender-legend-container'
		           }
		       },
		       maintainAspectRatio: false,
		       layout: {
		           padding: {
		               top: 20,
		               right: 20,
		               bottom: 20,
		               left: 20
		           }
		       }
		   });
		}

		function createTimeSlotChart(timeSlotData) {
		   const ctx = document.getElementById('timeSlotCanvas').getContext('2d');
		   
		   return ChartManager.createChart(ctx, 'bar', {
		       labels: timeSlotData.labels,
		       datasets: [{
		           label: '예약 건수',
		           data: timeSlotData.data,
		           backgroundColor: ChartManager.colors.primary[0],
		           borderRadius: 4
		       }]
		   }, {
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
		           tooltip: {
		               callbacks: {
		                   label: function(context) {
		                       return `${context.raw}건`;
		                   }
		               }
		           }
		       },
		       scales: {
		           y: {
		               beginAtZero: true,
		               grid: {
		                   drawBorder: false,
		                   color: 'rgba(0, 0, 0, 0.1)'
		               },
		               ticks: {
		                   font: {
		                       size: 12
		                   }
		               }
		           },
		           x: {
		               grid: {
		                   display: false
		               },
		               ticks: {
		                   font: {
		                       size: 12
		                   }
		               }
		           }
		       },
		       maintainAspectRatio: false,
		       layout: {
		           padding: {
		               top: 20,
		               right: 20,
		               bottom: 10,
		               left: 10
		           }
		       }
		   });
		}
		document.addEventListener('DOMContentLoaded', () => {
		    const genderData = {
			    male: ${dash.gendercnt[0].visitorcnt},
			    female: ${dash.gendercnt[1].visitorcnt}
			};
		
			const timeSlotData = {
			    labels: [${timeSlotLabels}],
			    data: [${timeSlotData}]
			};
		    
		    createGenderChart(genderData);
		    createTimeSlotChart(timeSlotData);
		});
        </script>
	</head>
<body>
	<div class="dashboard-container">
		<div class="stats-container">
			<div class="stat-card">
				<div class="stat-label">일일매출</div>
				<div class="stat-value">
					<fmt:formatNumber value="${dash.dailySell}" pattern="#,###"/>원
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-label">일일예약</div>
				<div class="stat-value">${dash.dailyReserve}건</div>
			</div>
			<div class="stat-card">
				<div class="stat-label">예약대기</div>
				<div class="stat-value">${dash.reserveWaitingCnt}건</div>
			</div>
			<div class="stat-card">
				<div class="stat-label">방문율</div>
				<div class="stat-value">
					${dash.reserveNoshowOrCancel.visitRate}%
				</div>
			</div>
		</div>
			
			<!-- 차트 영역 -->
		<div class="chart-row">
			<!-- 시간대별 예약 현황 -->
			<div class="chart-card">
				<div class="chart-header">
					<div class="chart-title">시간대별 예약 현황</div>
				</div>
				<div class="chart-container">
					<canvas id="timeSlotCanvas"></canvas>
					<div id="timeslot-legend-container"></div>  <!-- 레전드 컨테이너 추가 -->
				</div>
			</div>
			
			<!-- 성별 통계 -->
			<div class="chart-card">
				<div class="chart-header">
					<div class="chart-title">방문객 성비</div>
				</div>
				<div class="pie-chart">
					<canvas id="genderCanvas"></canvas>
					<div id="gender-legend-container"></div>  <!-- 레전드 컨테이너 추가 -->
				</div>
			</div>
			</div>
			
			    <!-- 예약 요청사항 목록 -->
			<div class="requests-container">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>예약시간</th>
								<th>인원</th>
								<th>요청사항</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${dash.reserveReq}" var="req">
								<tr>
									<td>${req.reserveTime}</td>
									<td>${req.reserveCount}명</td>
									<td>${req.request}</td>
								</tr>
							</c:forEach>
						</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>