<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <title>월간 보고서</title>
    <link rel="stylesheet" href="../css/store/report/reportPage.css">
    <script type = "text/javascript" src = "../js/httpRequest.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let year = new Date().getFullYear();
            let date = new Date().getMonth() + 1;
            let newLabel = document.createElement('label');
            newLabel.textContent = date;
            let select = document.querySelector('.date-select');
            document.getElementById('month').appendChild(newLabel);
            
            for (let i = 1; i <= date; i++) {
                let option = document.createElement('option');
                option.value = year+'-' + i;
                option.textContent = year+'년 ' + i + '월';
                option.setAttribute('id', i + 'month');
                option.setAttribute('class', 'monthOption');
                select.appendChild(option);
                if(i == date){
                    option.setAttribute('selected', 'selected');
                }
            }
            //있으면 생성유도, 없으면 생성버튼 숨김
            select.addEventListener('change', function(e) {
                let currentDate = e.target.value;
                document.getElementById('month').innerText = currentDate.split('-')[1] + '월';
                let params = 'store_idx=' + 1 + '&date=' + currentDate;
                sendRequest('/reportIsCreated', params, function(response) {
                    let isNotCreated = response;
                    if (isNotCreated) {
                        document.getElementById('createReport').style.display = 'block';
                        document.getElementById('report-cardsection').classList.add('blur');
                    } else {
                        document.getElementById('createReport').style.display = 'none';
                        document.getElementById('report-cardsection').classList.remove('blur');
                    }
                }, 'GET');
            });
        });
    </script>
    <script>
        //금액 포맷함수
        const formatMoney = (value) => {
                return new Intl.NumberFormat('ko-KR', {
                    maximumSignificantDigits: 3,
                    notation: 'compact',
                    compactDisplay: 'short'
                }).format(value) + '원';
        };
        function result(){
                let params = "store_idx=" + 1;
                sendRequest('/weekreportTest', params, analyze,'GET');
        }
        //차트 모듈, 컬러는 그냥 ui컬러에서 가져옴
        const ChartManager = {
            colors: {
                primary: ['#2570eb', '#3b82f6', '#609afa', '#93bbfd', '#bfd7fe'],
                secondary: ['#64748b', '#94a3b8', '#cbd5e1', '#e2e8f0', '#f1f5f9']
            },
            //레전드만들기
            createLegend(chart, id) {
                const legendContainer = document.getElementById(id);
                let labelLi = legendContainer.querySelector('ul');

                if (!labelLi) {
                    labelLi = document.createElement('ul');
                    labelLi.style.margin = 0;
                    labelLi.style.padding = 0;
                    labelLi.style.display = 'grid';
                    labelLi.style.flexWrap = 'wrap';
                    labelLi.style.gap = '10px';

                    legendContainer.appendChild(labelLi);
                }

                return labelLi;
            },
            //htmlLegendPlugin 함수(도넛차트 레전드)
            htmlLegendPlugin: {
                id: 'htmlLegend',
                afterUpdate(chart, args, options) {
                    const ul = ChartManager.createLegend(chart, options.containerID);
                    ul.style.margin = '15px 0px';
                    ul.style.alignItems = 'center';

                    while (ul.firstChild) {
                        ul.firstChild.remove();
                    }
                    //라벨 아이템 지정
                    const items = chart.options.plugins.legend.labels.generateLabels(chart);

                    items.forEach(item => {
                        const li = document.createElement('li');
                        li.style.alignItems = 'right';
                        li.style.cursor = 'pointer';
                        li.style.display = 'flex';
                        li.style.gap = '3px';
                        li.style.alignItems = 'center';

                        const keywBox = document.createElement('span');
                        keywBox.style.background = item.fillStyle;
                        keywBox.style.width = '10px';
                        keywBox.style.height = '10px';
                        keywBox.style.borderRadius = '50%';
                        keywBox.style.display = 'inline-block';

                        const textContainer = document.createElement('p');
                        textContainer.style.margin = 0;
                        textContainer.style.padding = 0;
                        textContainer.style.color = '#64748b';
                        textContainer.style.fontSize = '13px';
                        textContainer.innerHTML = item.text;

                        li.appendChild(keywBox);
                        li.appendChild(textContainer);
                        ul.appendChild(li);
                    });
                }
            },
            //차트그리기 함수
            createChart(ctx, type, data, options = {}) {
                const chartConfig = {
                    type,
                    data: this.transformData(type, data),
                    options: this.getChartOptions(type, options)
                };

                if (type === 'doughnut') {
                    chartConfig.plugins = [this.htmlLegendPlugin];
                }

                return new Chart(ctx, chartConfig);
            },
            //타입,데이터로 차트 모양 지정(바,도넛)
            transformData(type, rawData) {
                switch(type) {
                    case 'bar':
                        return {
                            labels: rawData.labels,
                            datasets: rawData.datasets.map((dataset, index) => ({
                                label: dataset.label,
                                data: dataset.data,
                                backgroundColor: this.colors.primary[index % this.colors.primary.length],
                                borderRadius: 4
                            }))
                        };
                    case 'doughnut':
                        return {
                            labels: rawData.labels,
                            datasets: [{
                                data: rawData.data,
                                backgroundColor: this.colors.primary
                            }]
                        };
                    case 'line':
                        return {
                            labels: rawData.labels,
                            datasets: rawData.datasets.map((dataset, index) => ({
                                label: dataset.label,
                                data: dataset.data,
                                tension: dataset.tension,
                                pointStyle: dataset.pointStyle,
                                pointRadius: dataset.pointRadius,
                                pointHoverRadius: dataset.pointHoverRadius,
                                borderWidth: dataset.borderWidth
                            }))
                        };
                    default:
                        return rawData;
                }
            },
            //차트 옵션 지정
            getChartOptions(type, customOptions = {}) {
                const baseOptions = {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                };
                //타입별로 옵션
                const typeSpecificOptions = {
                    //바타입 지정
                    bar: {
                        scales: {
                           legend: {
                                display: false
                            },
                            
                        },
                        plugins: {
                            legend: {
                                display: false
                            },
                            htmlLegend: {
                                containerID: 'legend-container'
                            }
                        },

                    },
                    //도넛타입 지정
                    doughnut: {
                        cutout: '70%',
                        maintainAspectRatio: true,  /* 비율 유지 */
                        responsive: true,
                        layout: {
                            padding: {
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0
                            }
                        },
                        plugins: {
                            legend: {
                                display: false
                            },
                            htmlLegend: {
                                containerID: 'legend-container'
                            }
                        }
                    }
                };

                return {
                    //기본옵션 + 타입별옵션 + 사용자정의옵션
                    ...baseOptions,
                    ...(typeSpecificOptions[type] || {}),
                    ...customOptions
                };
            }
        };
        //1. 일일 예약분석
        function createDailyReservChart(dailyStats) {
            const dayOrder = ['월', '화', '수', '목', '금', '토', '일'];
            
            const sortedData = dayOrder.map(day => {
                const found = dailyStats.find(stat => stat.dayName.startsWith(day)) || 
                    { dayName: day, reservCount: 0, totalCount: 0 };
                return found;
            });

            // 주요 지표 계산
            const totalReservations = dailyStats.reduce((sum, day) => sum + day.reservCount, 0);
            const peakDay = dailyStats.reduce((max, day) => 
                day.reservCount > max.reservCount ? day : max, dailyStats[0]);

            // 지표 표시 업데이트
            document.getElementById('totalReservations').textContent = totalReservations + '건';
            document.getElementById('peakDay').textContent = peakDay.dayName

            const ctx = document.getElementById('dailyReservChart').getContext('2d');
            
            return ChartManager.createChart(ctx, 'bar', {
                labels: dayOrder,
                datasets: [
                    {
                        label: '예약 수',
                        data: sortedData.map(day => day.reservCount),
                        backgroundColor: ChartManager.colors.primary[0],
                        barPercentage: 0.3,
                        categoryPercentage: 0.5
                    },
                    {
                        label: '실제 방문자 수',
                        data: sortedData.map(day => day.totalCount),
                        backgroundColor: ChartManager.colors.primary[2],
                        barPercentage: 0.3,
                        categoryPercentage: 0.5
                    }
                ]
            }, {
                plugins: {
                    legend: {
                        display: true,
                        position: 'top',
                        align: 'end',
                        usePointStyle: true,
                        labels: {
                            padding: 20,
                            boxWidth: 12,
                            borderRadius: 6,
                            font: {
                                size: 12
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            drawBorder: false, // y축 선 제거
                        },
                        ticks: {
                            font: {
                                size: 12
                            }
                        }
                    },
                    x: {
                        grid: {
                            display: false // x축 그리드 제거
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
                        top: 20 // 상단 여백 추가
                    }
                }
            });
        }
        //2. 주간 예약
        function createWeeklyReservChart(weeklyReserveData) {
            // 주차별 예약 1건당 평균 방문자 수 계산
            const weekLabels = weeklyReserveData.map(item => item.weekNum + "주차");
            const reservData = weeklyReserveData.map(item => item.reservCount);
            const totalData = weeklyReserveData.map(item => item.totalCount);
            const averageVisitors = weeklyReserveData.map(item => 
                (item.totalCount / item.reservCount).toFixed(1)
            );

            // 전체 평균 계산
            const totalAverage = weeklyReserveData.reduce((sum, week) => {
                return sum + (week.totalCount / week.reservCount);
            }, 0) / weeklyReserveData.length;

            // 지표 업데이트
            document.getElementById('conversionRate').textContent = 
                "평균"+totalAverage.toFixed(1)+"명";

            const ctx = document.getElementById('weeklyReservChart').getContext('2d');
            
            return ChartManager.createChart(ctx, 'bar', {
                labels: weekLabels,
                datasets: [
                    {
                        label: '예약 수',
                        data: reservData,
                        backgroundColor: ChartManager.colors.primary[0],
                        barPercentage: 0.3,
                        categoryPercentage: 0.5
                    },
                    {
                        label: '방문자 수',
                        data: totalData,
                        backgroundColor: ChartManager.colors.primary[1],
                        barPercentage: 0.3,
                        categoryPercentage: 0.5
                    }
                ]
            }, {
                plugins: {
                    legend: {
                        display: true,
                        position: 'top',
                        align: 'end',
                        usePointStyle: true,
                        labels: {
                            padding: 20,
                            boxWidth: 12,
                            borderRadius: 6,
                            font: {
                                size: 12
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            drawBorder: false
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
                        top: 20
                    }
                }
            });
        }
        //3. 월별 예약증감률 계산+이번월/전월 비교하는 차트
        function createMonthlyCompareChart(monthlyStats) {
            const currMonth = monthlyStats.currMonthCount;
            const prevMonth = monthlyStats.prevMonthCount;
            const currTotal = monthlyStats.currTotalCount;
            const prevTotal = monthlyStats.prevTotalCount;
            
            // 전월 대비 증감률 계산
            const reservGrowth = ((currMonth - prevMonth) / prevMonth * 100).toFixed(1);
            // 총 증감률 계산
            const totalGrowth = ((currTotal - prevTotal) / prevTotal * 100).toFixed(1);
            
            let growth = document.getElementById('monthlyGrowth');
            if(reservGrowth > 0){
                growth.textContent = '+' + reservGrowth + '%';
                growth.style.color = 'var(--primary-blue)';
            }else{
                growth.textContent = '-' + reservGrowth + '%';
                growth.style.color = 'var(--primary-red)';
            }
            const ctx = document.getElementById('monthlyCompareChart').getContext('2d');
            
            return ChartManager.createChart(ctx, 'bar', {
                labels: ['전월', '금월'],
                datasets: [
                    {
                        label: '예약 건수',
                        data: [prevMonth, currMonth],
                        backgroundColor: ChartManager.colors.primary[0],
                        barPercentage: 0.3,
                        categoryPercentage: 0.5
                    },
                    {
                        label: '총 방문자 수',
                        data: [prevTotal, currTotal],
                        backgroundColor: ChartManager.colors.primary[2],
                        barPercentage: 0.3,
                        categoryPercentage: 0.5
                    }
                ]
            }, {
                plugins: {
                    legend: {
                        display: true,
                        position: 'top',
                        align: 'end',
                        usePointStyle: true,
                        labels: {
                            padding: 20,
                            boxWidth: 12,
                            borderRadius: 6,
                            font: {
                                size: 12
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            drawBorder: false
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
                        top: 20
                    }
                }
            });
        }
        //4. 연간 예약 꺾은선그래프
        function createYearlyReservChart(yearlyStats) {
            //월 정렬(1~12) 근데 이거 정렬해서나오면되긴하는데 쿼리바꾸기 귀찮아서 그냥함;
            const sortedData = yearlyStats.sort((a, b) => Number(a.month) - Number(b.month));
            
            //월별 평균 예약 건수 계산
            const totalReservations = sortedData.reduce((sum, stat) => sum + stat.reservCount, 0);
            const averageReservations = (totalReservations / sortedData.length).toFixed(1);
            
            //지표 업데이트
            document.getElementById('yearlyAverage').textContent = averageReservations+"건";

            const ctx = document.getElementById('yearlyReservChart').getContext('2d');
            
            return ChartManager.createChart(ctx, 'line', {
                labels: sortedData.map(stat => stat.month + '월'),
                datasets: [
                    {
                        label: '예약 건수',
                        data: sortedData.map(stat => stat.reservCount),
                        borderColor: ChartManager.colors.primary[0],
                        backgroundColor: 'rgba(37, 112, 235, 0.1)',
                        tension: 0.3,
                        pointStyle: 'circle',
                        pointRadius: 2,
                        pointHoverRadius: 2,
                        pointBackgroundColor: 'white',
                        pointBorderWidth: 2,
                        borderWidth: 3
                    },
                    {
                        label: '총 방문자 수',
                        data: sortedData.map(stat => stat.totalCount),
                        borderColor: ChartManager.colors.primary[2],
                        backgroundColor: 'rgba(96, 154, 250, 0.1)',
                        tension: 0.3,
                        pointStyle: 'circle',
                        pointRadius: 2,
                        pointHoverRadius: 2,
                        pointBackgroundColor: 'white',
                        pointBorderWidth: 2,
                        borderWidth: 3
                    }
                ]
            }, {
                plugins: {
                    legend: {
                        display: true,
                        position: 'top',
                        align: 'end',
                        usePointStyle: true,
                        labels: {
                            padding: 20,
                            boxWidth: 12,
                            borderRadius: 6,
                            font: {
                                size: 12
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
                        top: 20
                    }
                }
            });
        }
        //5. 월별매출비교
        function createMonthSellChart(sellMonth) {
            //데이터 시간순 정렬
            const sortedData = sellMonth.sort((a, b) => new Date(a.monthName) - new Date(b.monthName));
            
            //전월, 당월?금월?이번달 매출
            const prevMonthSales = sortedData[sortedData.length - 2].totalcnt;
            const currMonthSales = sortedData[sortedData.length - 1].totalcnt;
            
            //증감률 계산
            const growthRate = ((currMonthSales - prevMonthSales) / prevMonthSales * 100).toFixed(1);
            
            //넣기
            document.getElementById('salesGrowth').textContent = growthRate > 0 ? 
                '+' + growthRate + '%' : growthRate + '%';

            // 월 표시를 'YYYY-MM'에서 'M월'로 변환
            const formatMonth = (monthName) => {
                return new Date(monthName).getMonth() + 1 + '월';
            };


            const ctx = document.getElementById('monthlySalesChart').getContext('2d');
            
            return ChartManager.createChart(ctx, 'line', {
                labels: sortedData.map(item => formatMonth(item.monthName)),
                datasets: [
                    {
                        label: '월 매출',
                        data: sortedData.map(item => item.totalcnt),
                        borderColor: ChartManager.colors.primary[0],
                        backgroundColor: 'rgba(37, 112, 235, 0.1)',
                        tension: 0.3,
                        fill: true,
                        pointStyle: 'circle',
                        pointRadius: 2,
                        pointHoverRadius: 2,
                        pointBackgroundColor: 'white',
                        pointBorderWidth: 2,
                        borderWidth: 3
                    }
                ]
            }, {
                plugins: {
                    legend: {
                        display: true,
                        position: 'top',
                        align: 'end',
                        usePointStyle: true,
                        labels: {
                            padding: 20,
                            boxWidth: 12,
                            borderRadius: 50,
                            font: {
                                size: 12
                            }
                        }
                    },
                    labels: {
                            padding: 20,
                            boxWidth: 12,
                            borderRadius: 6,
                            font: {
                                size: 12
                            }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return formatMoney(context.raw);
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
                            },
                            callback: function(value) {
                                return formatMoney(value);
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

        //6. 일매출차트
        function createDailySellChart(sellDay) {
            // 요일 순서 정의
            const dayOrder = ['월', '화', '수', '목', '금', '토', '일'];
            
            // 데이터 요일 순으로 정렬
            const sortedData = dayOrder.map(day => {
                const found = sellDay.find(stat => stat.dayname.startsWith(day)) || 
                    { dayname: day + '요일', daytotalcnt: 0 };
                return found;
            });
            //매출 젤 높은요일 찾기
            const bestSalesDay = sellDay.reduce((max, day) => 
                day.daytotalcnt > max.daytotalcnt ? day : max, sellDay[0]);

            //업뎃
            document.getElementById('bestSalesDay').textContent = bestSalesDay.dayname + ' (' + formatMoney(bestSalesDay.daytotalcnt) + ')';

            const ctx = document.getElementById('dailySalesChart').getContext('2d');
            

            return ChartManager.createChart(ctx, 'bar', {
                labels: dayOrder.map(day => day),
                datasets: [
                    {
                        label: '매출액',
                        data: sortedData.map(day => day.daytotalcnt),
                        backgroundColor: ChartManager.colors.primary[0],
                        barPercentage: 0.3,
                        categoryPercentage: 0.5,
                        barThickness:19,
                        maxBarThickness: 20
                    }
                ]
            }, {
                plugins: {
                    legend: {
                        display: true,
                        position: 'top',
                        align: 'end',
                        usePointStyle: true,
                        labels: {
                            padding: 20,
                            boxWidth: 12,
                            borderRadius: 50,
                            font: {
                                size: 12
                            }
                        }
                    },
                    labels: {
                            padding: 20,
                            boxWidth: 12,
                            borderRadius: 6,
                            font: {
                                size: 12
                            }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return formatMoney(context.raw);
                            }
                        }
                    },
                    
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            drawBorder: false
                        },
                        ticks: {
                            font: {
                                size: 12
                            },
                            callback: function(value) {
                                return formatMoney(value);
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
                        top: 20
                    }
                }
            });
        }
        //7. 주간매출차트
        function createWeeklySellChart(sellWeek) {
            //주차별 매출평균
            const weeklyAverage = Math.floor(sellWeek.reduce(function(sum, week) {
                return sum + week.totalcnt;
            }, 0) / sellWeek.length);

            //넣기
            document.getElementById('weeklyAvgSales').textContent = formatMoney(weeklyAverage);

            const ctx = document.getElementById('weeklySalesChart').getContext('2d');
            const chartData = {
                labels: sellWeek.map(function(week) {
                    return week.weeknum + '주차';
                }),
                datasets: [
                    {
                        label: '주간 매출',
                        data: sellWeek.map(function(week) {
                            return week.totalcnt;
                        }),
                        borderColor: ChartManager.colors.primary[0],
                        tension: 0.3,
                        pointStyle: 'circle',
                        pointRadius: 2,
                        pointHoverRadius: 2,
                        pointBackgroundColor: 'white',
                        pointBorderWidth: 2,
                        borderWidth: 3
                    }
                ]
            };

            const options = {
                plugins: {
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return formatMoney(context.raw);
                            }
                        }
                    },
                    legend: {
                        display: true,
                        position: 'top',
                        align: 'end',
                        usePointStyle: true,
                        labels: {
                            padding: 20,
                            boxWidth: 12,
                            borderRadius: 6,
                            font: {
                                size: 12
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
                            },
                            callback: function(value) {
                                return formatMoney(value);
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
                        left: 10,
                        bottom: 10
                    }
                }
            };

            return ChartManager.createChart(ctx, 'line', chartData, options);
        }

        function createTopMenuChart(sellMenu) {
            // TOP 5 메뉴 추출
            const topMenus = sellMenu.slice(0, 5);
            
            // 최다 판매 메뉴 정보 업데이트
            const bestMenu = topMenus[0];
            document.getElementById('bestMenuItem').textContent = 
                bestMenu.menuname + ' (' + bestMenu.totalcnt + '개)';

            const ctx = document.getElementById('menuChart').getContext('2d');

            return new Chart(ctx, {
                type: 'bar',  // 기본 타입은 bar 사용
                data: {
                    labels: topMenus.map(function(menu) {
                        return menu.menuname.length > 10 ? 
                            menu.menuname.substring(0, 10) + '...' : 
                            menu.menuname;
                    }),
                    datasets: [{
                        label: '판매수량',
                        data: topMenus.map(function(menu) {
                            return menu.totalcnt;
                        }),
                        backgroundColor: [
                            '#2570eb',  // 1위
                            '#3b82f6',
                            '#609afa',
                            '#93bbfd',
                            '#bfd7fe'   // 5위
                        ],
                        borderRadius: 6,
                        barPercentage: 0.7
                    }]
                },
                options: {
                    indexAxis: 'y',  // 이 옵션으로 가로 막대 구현
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    return context.raw + '개 판매';
                                },
                                title: function(context) {
                                    return topMenus[context[0].dataIndex].menuname;
                                }
                            }
                        }
                    },
                    scales: {
                        x: {
                            beginAtZero: true,
                            grid: {
                                display: false
                            },
                            ticks: {
                                font: {
                                    size: 12
                                }
                            }
                        },
                        y: {
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
                    layout: {
                        padding: {
                            top: 20,
                            right: 20,
                            left: 10,
                            bottom: 10
                        }
                    }
                }
            });
        }

        
        //월 보고서, store_idx, 요청날짜로 분석데이터 비동기처리
        function analyze() {
            if(XHR.readyState==4 && XHR.status==200) {
                let data = XHR.responseText;
                let jsondata = JSON.parse(data);
                
                //키워드데이터
                const analyzerData = jsondata.analyzerResult.data[0];
                const tagContainers = document.getElementsByClassName('tag-box');
                //예약데이터
                const reserveData = jsondata.reservationStats;
                console.log(reserveData);
                const dailyStats = reserveData.dailyStats;
                console.log(dailyStats);
                const weeklyReserveData = reserveData.weeklyStats;
                console.log(weeklyReserveData);
                const monthlyStats = reserveData.monthlyStats[0];
                console.log(monthlyStats);
                const yearlyStats = reserveData.yearlyStats;
                console.log(yearlyStats);

                //매출데이터
                const salesData = jsondata.reservationStats;
                console.log(salesData);
                const sellMonth = salesData.sellMonth;
                console.log(sellMonth);
                const sellDay = salesData.sellDay;
                console.log(sellDay);
                const sellWeek = salesData.sellWeek;
                console.log(sellWeek);
                const sellMenu = salesData.sellMenu;
                console.log(sellMenu);

                //데이터 미리 지정, 분위기/서비스[긍/부정] 이모지+태그
                const tagData = [
                    {emoji: "😊 분위기", data: analyzerData.분위기.긍정},
                    {emoji: "🤝 서비스", data: analyzerData.서비스.긍정},
                    {emoji: "😢 분위기", data: analyzerData.분위기.부정},
                    {emoji: "😓 서비스", data: analyzerData.서비스.부정}
                ];

                tagData.forEach((item, idx) => {
                    tagContainers[idx].innerHTML = "<span class='emoji-tag'>"+item.emoji+"</span>";
                    item.data.forEach(tag => {
                        tagContainers[idx].innerHTML += "<span class='tag'>"+tag+"</span>";
                    });
                });
                const menuStats = {};
                let Goodeval = 0;
                let BadEval = 0;

                //긍부정 갯수 카운트
                analyzerData.메뉴.forEach(menuItem => {
                    const menuName = Object.keys(menuItem)[0];
                    const evaluation = menuItem[menuName];
                    
                    evaluation.긍정.forEach(keyword => {
                        menuStats[keyword] = (menuStats[keyword] || 0) + 1;
                        Goodeval++;
                    });
                    evaluation.부정.forEach(keyword => {
                        menuStats[keyword] = (menuStats[keyword] || 0) + 1;
                        BadEval++;
                    });
                });
                //메뉴 키워드에서 가장 많이 나온 키워드 5개 추출
                const sortKey = Object.entries(menuStats).sort(([,a], [,b]) => b - a).slice(0, 5);
                
                //키워드 차트(메뉴도넛차트)
                const ctx = document.getElementById('keywordDonut').getContext('2d');
                ChartManager.createChart(ctx, 'doughnut', {
                    labels: sortKey.map(([label]) => label),
                    data: sortKey.map(([,value]) => value)
                });
                
                // 주간 예약 통계 차트 생성
                const weekLabels = weeklyReserveData.map(item => item.weekNum +"주차");
                const reservData = weeklyReserveData.map(item => item.reservCount);
                const totalData = weeklyReserveData.map(item => item.totalCount);
                //일예약차트
                createDailyReservChart(dailyStats);
                //주간예약차트
                createWeeklyReservChart(weeklyReserveData);
                //월별예약차트
                createMonthlyCompareChart(monthlyStats);
                //연간예약차트
                createYearlyReservChart(yearlyStats);
                //월별매출차트
                createMonthSellChart(sellMonth);
                //일매출차트
                createDailySellChart(sellDay);
                //주간매출차트
                createWeeklySellChart(sellWeek);
                //메뉴별매출차트
                createTopMenuChart(sellMenu);
                //확인용
                console.log('분위기 긍정:', analyzerData.분위기.긍정[0]);
                analyzerData.분위기.긍정.forEach(tag => {
                    console.log(tag);
                });
                console.log('분위기 부정:', analyzerData.분위기.부정);
                console.log('서비스 긍정:', analyzerData.서비스.긍정);
                console.log('서비스 부정:', analyzerData.서비스.부정);
                console.log('메뉴 통계:', menuStats);
                console.log('메뉴 긍정:', Goodeval);
                console.log('메뉴 부정:', BadEval);
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <a id="click_me" onclick="result()">매장명</a>
        <form action="/storeReportCreate" method="Post">
            <button id="createReport">보고서 받아보기</button>
        </form>
        <div class="report-card">
            <select class="date-select"></select>
            <div id="report-cardsection">
                <h1 class="title">${storeName}의 <span id="month"></span>월 보고서</h1>
                
                <div class="keyword-section">
                    <div class="keyword-content">
                        <div class="description">
                            손님들이 <span style="color: var(--primary-blue); font-weight: 600;">${storeName}</span>의 이런 점을 좋아해요
                        </div>
                        <div class="tag-box">
                            <span class="emoji-tag">😊 분위기</span>
                            <span class="tag">테스트데이터</span>
                            <span class="tag">테스트데이터</span>
                            <span class="tag">테스트데이터</span>
                            <span class="tag">테스트데이터</span>
                            <span class="tag">테스트데이터</span>
                            <span class="tag">테스트데이터</span>   
                        </div>
                        <div class="tag-box">
                            <span class="emoji-tag">🤝 서비스</span>
                            <span class="tag">테스트데이터</span>
                        </div>

                        <div class="description">
                            손님들이 <span style="color: var(--primary-blue); font-weight: 600;">${storeName}</span>의 이런 점을 아쉬워해요
                        </div>
                        <div class="tag-box">
                            <span class="emoji-tag">😢 분위기</span>
                            <span class="tag">테스트데이터</span>
                        </div>
                        <div class="tag-box">
                            <span class="emoji-tag">😓 서비스</span>
                            <span class="tag">테스트데이터</span>
                        </div>
                    </div>

                    <div class="donut-container">
                        <h3 class="chart-title">TOP 5 키워드</h3>
                        <div id  = "donut_flex">
                            <canvas id="keywordDonut"></canvas>
                            <div id="legend-container"></div>
                        </div>
                    </div>
                </div>
                <section class="anal-section reservation">
                    <h2 class="section-title">${date}월 예약 분석</h2>
    
                    <!-- 1. 일별 예약 패턴 분석 -->
                    <div class="anal-card">
                        <div class="anal-content">
                            <div class="anal-info">
                                <h3 class="anal-title">일별 예약 패턴</h3>
                                <p class="anal-description">
                                    요일별 예약 현황과 방문자 수를 비교 분석한 데이터입니다.
                                </p>
                                <div class="key-metrics">
                                    <div class="metric">
                                        <span class="metric-label">총 예약건수</span>
                                        <span class="metric-value" id="totalReservations"></span>
                                    </div>
                                    <div class="metric">
                                        <span class="metric-label">최다 예약 요일</span>
                                        <span class="metric-value" id="peakDay"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="chart-wrapper">
                                <canvas id="dailyReservChart"></canvas>
                            </div>
                        </div>
                    </div>
    
                    <!-- 2. 주간 예약 추이 -->
                    <div class = "dualAnalContent">
                        <div class="anal-card">
                            <div class="anal-content">
                                <div class="anal-info">
                                    <h3 class="anal-title">주간 예약 추이</h3>
                                    <p class="anal-description">
                                        ${date}월의 주차별 예약 현황과 실제 방문자 수입니다.
                                    </p>
                                    <div class="key-metrics">
                                        <div class="metric">
                                            <span class="metric-label">예약당 인원수</span>
                                            <span class="metric-value" id="conversionRate"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="chart-wrapper">
                                    <canvas id="weeklyReservChart"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="anal-card">
                            <div class="anal-content">
                                <div class="anal-info">
                                    <h3 class="anal-title">월간 </h3>
                                    <p class="anal-description">
                                        전월 대비 예약<br>증감률을 분석한 데이터입니다.
                                    </p>
                                    <div class="key-metrics">
                                        <div class="metric">
                                            <span class="metric-label">증감률</span>
                                            <span class="metric-value" id="monthlyGrowth"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="chart-wrapper">
                                    <canvas id="monthlyCompareChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
    
                    <!-- 4. 연간 예약 추이 -->
                    <div class="anal-card">
                        <div class="anal-content">
                            <div class="anal-info">
                                <h3 class="anal-title">연간 예약 추이</h3>
                                <p class="anal-description">
                                    이번년도의 월별 예약 데이터입니다.
                                </p>
                                <div class="key-metrics">
                                    <div class="metric">
                                        <span class="metric-label">연간 예약 평균</span>
                                        <span class="metric-value" id="yearlyAverage"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="chart-wrapper scrollable">
                                <canvas id="yearlyReservChart"></canvas>
                            </div>
                        </div>
                    </div>
                </section>
    
                <!-- 매출 분석 섹션 -->
                <section class="anal-section sales">
                    <h2 class="section-title">${date}월 매출 분석</h2>
    
                    <!-- 5. 월별 매출 비교 -->
                    <div class="anal-card">
                        <div class="anal-content">
                            <div class="anal-info">
                                <h3 class="anal-title">월별 매출 비교</h3>
                                <p class="anal-description">
                                    전월 대비 매출 증감을 분석한 데이터입니다.
                                </p>
                                <div class="key-metrics">
                                    <div class="metric">
                                        <span class="metric-label">매출 증감률</span>
                                        <span class="metric-value" id="salesGrowth"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="chart-wrapper">
                                <canvas id="monthlySalesChart"></canvas>
                            </div>
                        </div>
                    </div>
    
                    <!-- 6. 일별 매출 패턴 -->
                    <div class="anal-card">
                        <div class="anal-content">
                            <div class="anal-info">
                                <h3 class="anal-title">일별 매출 패턴</h3>
                                <p class="anal-description">
                                    요일별 매출 현황을 분석한 데이터입니다.
                                </p>
                                <div class="key-metrics">
                                    <div class="metric">
                                        <span class="metric-label">최고 매출 요일</span>
                                        <span class="metric-value" id="bestSalesDay"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="chart-wrapper">
                                <canvas id="dailySalesChart"></canvas>
                            </div>
                        </div>
                    </div>
    
                    <!-- 7. 주간 매출 추이 -->
                    <div class="anal-card">
                        <div class="anal-content">
                            <div class="anal-info">
                                <h3 class="anal-title">주간 매출 추이</h3>
                                <p class="anal-description">
                                    ${date}월의 주차별 매출 현황입니다.
                                </p>
                                <div class="key-metrics">
                                    <div class="metric">
                                        <span class="metric-label">주간 평균 매출</span>
                                        <span class="metric-value" id="weeklyAvgSales"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="chart-wrapper">
                                <canvas id="weeklySalesChart"></canvas>
                            </div>
                        </div>
                    </div>
    
                    <!-- 8. 인기 메뉴 분석 -->
                    <div class="anal-card">
                        <div class="anal-content">
                            <div class="anal-info">
                                <h3 class="anal-title">인기 메뉴 TOP 5</h3>
                                <p class="anal-description">
                                    가장 많이 판매된 메뉴 순위입니다.
                                </p>
                                <div class="key-metrics">
                                    <div class="metric">
                                        <span class="metric-label">최다 판매 메뉴</span>
                                        <span class="metric-value" id="bestMenuItem"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="chart-wrapper">
                                <canvas id="menuChart"></canvas>
                            </div>
                        </div>
                    </div>
                </section>
                

                <a href="/storeReportCreate" class="download-btn">
                    <span>다운로드</span>
                    <span>(pdf)</span>
                </a>
            </div>
        </div>
    </div>
</body>
</html>