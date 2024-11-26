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

<c:forEach items="${dash.monthResereve}" var="month" varStatus="status">
    <c:set var="monthlyLabels" value="${monthlyLabels}'${month.month}월'${!status.last ? ',' : ''}" />
    <c:set var="monthlyReserveCnt" value="${monthlyReserveCnt}${month.reservecnt}${!status.last ? ',' : ''}" />
    <c:set var="monthlyTotalCnt" value="${monthlyTotalCnt}${month.totalcnt}${!status.last ? ',' : ''}" />
</c:forEach>

<c:forEach items="${dash.reserveWeek}" var="day" varStatus="status">
    <c:set var="weeklyLabels" value="${weeklyLabels}'${day.saledate}'${!status.last ? ',' : ''}" />
    <c:set var="weeklyAmount" value="${weeklyAmount}${day.totalamount}${!status.last ? ',' : ''}" />
</c:forEach>

<c:set var="compareLabels" value="'전주','이번주'" />
<c:set var="compareAmount" value="${dash.sellCompare.lastweekamount},${dash.sellCompare.thisweekamount}" />
<!DOCTYPE html>
<html>
<head>
	<style>
        :root {
			--primary-blue: #3b82f6;
			--light-blue: #f0f7ff;
			--dark-blue: #1e40af;
			--gray-50: #f8fafc;
			--gray-100: #f1f5f9;
			--gray-200: #e2e8f0;
			--gray-300: #cbd5e1;
			--gray-600: #475569;
			--white: #ffffff;
		}

		body {
			margin: 0;
			padding: 0;
			background-color: var(--gray-50);
			font-family: 'Noto-Sans KR', sans-serif;
		}

		.dashboard-container {
			margin-left: 240px;
			margin-top: 64px;
			padding: 32px;
			background-color: #eff9ff;
		}

		.stats-container {
			display: grid;
			grid-template-columns: repeat(4, 1fr);
			gap: 24px;
			margin-bottom: 24px;
		}

		.stat-card {
			background: var(--white);
			padding: 24px;
			border-radius: 12px;
			box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
		}

		.chart-card {
			background: var(--white);
			padding: 24px;
			border-radius: 12px;
			box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
		}

        .stat-label {
            font-size: 13px;
            color: var(--gray);
            margin-bottom: 8px;
        }

        .stat-value {
            font-size: 20px;
            font-weight: 600;
            color: var(--dark-blue);
        }

        .chart-row-2-1 {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 16px;
			margin-bottom:30px;
        }

        .chart-row-1 {
            display: grid;
            grid-template-columns: 1fr;
			margin-bottom:30px;
        }

        .chart-row-3 {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
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

        .chart-container {
            width: 100%;
            height: 240px;
            position: relative;
        }

        .chart-row-1 .chart-container {
            height: 300px;
        }

        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: var(--light-blue);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary-blue);
            border-radius: 4px;
        }
		.requests-container {
			height: 240px;
			overflow-y: auto;
			padding: 10px;
		}
		.request-item {
			display: flex;
			align-items: center;
			padding: 10px;
			border-bottom: 1px solid var(--gray-200);
		}
		.request-time, .request-count {
			color: var(--gray-600);
			font-size: 14px;
		}
		.request-text {
			color: var(--dark-blue);
			font-size: 14px;
		}
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript" src = "../js/Chart.js"></script>
    <script>
		function createGenderChart(genderData) {
			const ctx = document.getElementById('genderCanvas').getContext('2d');
			
			return ChartManager.createChart(ctx, 'pie', {
				labels: ['남성', '여성'],
				datasets: [{
					data: [genderData.male, genderData.female],
					backgroundColor: [ChartManager.colors.primary[0], '#F3553C'],
					borderWidth: 0
				}]
			}, {
				plugins: {
					legend: {
						display: false
					},
					tooltip: {
						callbacks: {
							label: function(context) {
								const total = genderData.male + genderData.female;
								const percentage = Math.round((context.raw / total) * 100);
								return percentage +'%' + ' (' + context.raw + '명)';
							}
						}
					}
				},
				maintainAspectRatio: false
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
		                       return context.raw+'건';
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
		
		function createMonthlyChart(monthlyData) {
		    const ctx = document.getElementById('monthlyReserveCanvas').getContext('2d');
		    
		    return ChartManager.createChart(ctx, 'line', {
		        labels: monthlyData.labels,
		        datasets: [{
		            label: '예약 건수',
		            data: [${monthlyReserveCnt}],
		            borderColor: ChartManager.colors.primary[0],
		            backgroundColor: 'transparent',
		            tension: 0.4,
		            pointStyle: 'circle',
		            pointRadius: 2,
		            pointHoverRadius: 1,
		            borderWidth: 1
		            
		        },
		        {
		            label: '총 인원수',
		            data: [${monthlyTotalCnt}],
		            borderColor: ChartManager.colors.primary[2],
		            backgroundColor: 'transparent',
		            tension: 0.4,
		            pointStyle: 'circle',
		            pointRadius: 2,
		            pointHoverRadius: 1,
		            borderWidth: 1
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
		                        return context.raw+'건';
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
		                }
		            },
		            x: {
		                grid: {
		                    display: false
		                }
		            }
		        },
		        maintainAspectRatio: false
		    });
		}
		
		function createWeeklyChart(weeklyData) {
		    const ctx = document.getElementById('weeklyCanvas').getContext('2d');
		    
		    return ChartManager.createChart(ctx, 'bar', {
		        labels: weeklyData.labels,
		        datasets: [{
		            label: '일별 매출',
		            data:[${weeklyAmount}],
		            backgroundColor: ChartManager.colors.primary[1],
		            borderRadius: 4,
					barThickness: 35
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
		                        return context.raw.toLocaleString() + '원';
		                    }
		                }
		            }
		        },
		        scales: {
		            y: {
		                beginAtZero: true,
		                grid: {
		                    drawBorder: false
		                }
		            },
		            x: {
		                grid: {
		                    display: false
		                }
		            }
		        },
		        maintainAspectRatio: false
		});
		}
		
		function createCompareChart(compareData) {
		    const ctx = document.getElementById('compareCanvas').getContext('2d');
		    
		    return ChartManager.createChart(ctx, 'bar', {
		        labels: compareData.labels,
		        datasets: [{
		            label: '주간 매출',
		            data: compareData.amount,
		            backgroundColor: [
		                ChartManager.colors.primary[2],  // 전주
		                ChartManager.colors.primary[0]   // 이번주
		            ],
		            borderRadius: 4,
		            barThickness: 35
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
		                        return context.raw.toLocaleString()+'원';
		                    }
		                }
		            }
		        },
		        scales: {
		            y: {
		                beginAtZero: true,
		                grid: {
		                    drawBorder: false
		                }
		            },
		            x: {
		                grid: {
		                    display: false
		                }
		            }
		        },
		        maintainAspectRatio: false
		    });
		}
        </script>
	</head>
	<body>
		<%@ include file="store_Header.jsp"%>
		<%@ include file="nav.jsp"%>
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
					<div class ="stat-value" id = "visitRate"></div>
				</div>
			</div>

			<div class="chart-row-2-1">
				<div class="chart-card">
					<div class="chart-header">
						<div class="chart-title">월별 예약 현황</div>
					</div>
					<div class="chart-container">
						<canvas id="monthlyReserveCanvas"></canvas>
					</div>
				</div>
				<div class="chart-card">
					<div class="chart-header">
						<div class="chart-title">방문객 성비</div>
					</div>
					<div class="chart-container" id = "genderDataContainer">
						<canvas id="genderCanvas"></canvas>
					</div>
				</div>
			</div>

			<div class="chart-row-1">
				<div class="chart-card">
					<div class="chart-header">
						<div class="chart-title">주간 매출 현황</div>
					</div>
					<div class="chart-container">
						<canvas id="weeklyCanvas"></canvas>
					</div>
				</div>
			</div>

			<div class="chart-row-3">
				<div class="chart-card">
					<div class="chart-header">
						<div class="chart-title">시간대별 예약 현황</div>
					</div>
					<div class="chart-container">
						<canvas id="timeSlotCanvas"></canvas>
					</div>
				</div>
				<div class="chart-card">
					<div class="chart-header">
						<div class="chart-title">주간 매출 비교</div>
					</div>
					<div class="chart-container">
						<canvas id="compareCanvas"></canvas>
					</div>
				</div>
				<div class="chart-card">
					<div class="chart-header">
						<div class="chart-title">예약 요청사항</div>
					</div>
					<div class="requests-container">
						<c:if test ="${empty dash.reserveReq}">
							<div class="request-time">
								예약 요청사항이 없습니다.
							</div>
						</c:if>
						<c:forEach items="${dash.reserveReq}" var="req">
							<div class="request-item">
								<div class="request-time" style="flex: 1;">${req.reservetime}</div>
								<div class="request-count" style="flex: 1;">${req.reservecnt}명</div>
								<div class="request-text" style="flex: 2;">${req.request}</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<script>
        document.addEventListener('DOMContentLoaded', () => {
			let no = ${empty dash.reserveNoshowOrCancel.statecnt ? 0 : dash.reserveNoshowOrCancel.statecnt};
			let d = ${dash.dailyReserve};
			if(d != null){
				let rate = 100 - ((no / d) * 100);
				document.getElementById('visitRate').innerText = rate.toFixed(2) + '%';
			}else{
				document.getElementById('visitRate').innerText = '정보가 없습니다';
			}
            const monthlyData = {
                labels: [${monthlyLabels}],
                data: [${monthlyData}]
            };
			if(${empty dash.gendercnt[0]} || ${empty dash.gendercnt[1]}){
				document.getElementById('genderDataContainer').innerHTML = '<div>정보가 없습니다</div>';
			}else{
				const genderData = {
					male: ${dash.gendercnt[0].visitorcnt},
					female: 0
            	};
				createGenderChart(genderData);
			}
            
			
            const weeklyData = {
                labels: [${weeklyLabels}],
                data: [${weeklyAmount}]
            };

            const timeSlotData = {
                labels: [${timeSlotLabels}],
                data: [${timeSlotData}]
            };

            const compareData = {
                labels: ['전주', '이번주'],
                amount: [${dash.sellCompare.lastweekamount}, ${dash.sellCompare.thisweekamount}]
            };
            createMonthlyChart(monthlyData);
            
            createWeeklyChart(weeklyData);
            createTimeSlotChart(timeSlotData);
            createCompareChart(compareData);

			
        });
    </script>
	</body>
</html>