<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <title>월간 보고서</title>
    <style>
        :root {
            --primary-blue: #3b82f6;
            --light-blue: #f0f7ff;
            --dark-blue: #1e40af;
            --gray: #64748b;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto-Sans-KR', sans-serif;
        }

        body {
            background-color: #f8fafc;
        }

        .container {
            max-width: 1200px;
            margin: 32px auto;
            padding: 32px;
            position: relative;
        }

        .report-card {
            background-color: var(--light-blue);
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            position: relative;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 32px;
        }

        .title {
            font-size: 28.8px;
            color: var(--dark-blue);
            font-weight: 700;
            margin-bottom: 40px;
        }

        .date-select {
            position: absolute;
            top: 32px;
            right: 32px;
            padding: 8px 16px;
            border: 1px solid var(--gray);
            border-radius: 8px;
            background-color: white;
            min-width: 150px;
        }

        .description {
            margin: 24px 0;
            color: var(--gray);
            font-size: 16px;
        }

        .tag-box {
            display: flex;
            gap: 8px;
            margin: 16px 0;
            flex-wrap: wrap;
        }

        .tag {
            padding: 8px 16px;
            background-color: var(--primary-blue);
            color: white;
            border-radius: 32px;
            font-size: 14.4px;
        }

        .emoji-tag {
            padding: 8px 16px;
            background-color: #fef3c7;
            color: #92400e;
            border-radius: 32px;
            font-size: 14.4px;
        }

        .stats-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 32px;
            margin: 40px 0;
        }

        .chart-container {
            background-color: white;
            padding: 24px;
            border-radius: 12.8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            min-height: 300px;
        }

        .chart-title {
            font-size: 19.2px;
            color: var(--dark-blue);
            margin-bottom: 16px;
        }

        .download-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            background-color: white;
            border: 1px solid var(--gray);
            border-radius: 8px;
            color: var(--gray);
            text-decoration: none;
            font-size: 14.4px;
            position: absolute;
            bottom: 32px;
            right: 32px;
        }

        .download-btn:hover {
            background-color: #f1f5f9;
        }

        #createReport {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 12px 25px;
            border-radius: 5px;
            background-color: #121212;
            color: white;
            border: none;
            font-size: 14px;
            font-weight: bold;
            z-index: 100;
            display: none;
            cursor: pointer;
        }

        .blur {
            filter: blur(5px);
        }
    </style>
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
                let listContainer = legendContainer.querySelector('ul');

                if (!listContainer) {
                    listContainer = document.createElement('ul');
                    listContainer.style.margin = 0;
                    listContainer.style.padding = 0;
                    listContainer.style.display = 'flex';
                    listContainer.style.flexWrap = 'wrap';
                    listContainer.style.gap = '10px';

                    legendContainer.appendChild(listContainer);
                }

                return listContainer;
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
                const weeklyReserveData = reserveData.weeklyStats;
                console.log(weeklyReserveData);

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
                
                //키워드 차트(메뉴)
                const ctx = document.getElementById('keywordDonut').getContext('2d');
                ChartManager.createChart(ctx, 'doughnut', {
                    labels: sortKey.map(([label]) => label),
                    data: sortKey.map(([,value]) => value)
                });
                
                // 주간 예약 통계 차트 생성
                const weekLabels = weeklyReserveData.map(item => item.weekNum +"주차");
                const reservData = weeklyReserveData.map(item => item.reservCount);
                const totalData = weeklyReserveData.map(item => item.totalCount);

                const barCtx = document.getElementById('weekReservChart').getContext('2d');
                ChartManager.createChart(barCtx, 'bar', {
                    labels: weekLabels,
                    datasets: [
                        {
                            label: '예약 건수',
                            data: reservData,
                        },
                        {
                            label: '전체 주문 건수',
                            data: totalData,
                        }
                    ]
                }, {
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top',
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: '주문 건수'
                            }
                        }
                    }
                });

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
        <a id = "click_me" onclick = "result()">매장명</a>
        <form action = "/storeReportCreate" method = "Post">
            <button id="createReport">보고서 받아보기</button>
        </form>
        <div class="report-card">
            <select class="date-select"></select>
            <div id="report-cardsection">
                <h1 class="title">${storeName}의 <span id="month"></span>월 보고서</h1>

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
                </div>

                <div class="tag-box">
                    <span class="emoji-tag">🤝 서비스</span>
                    <span class="tag">테스트데이터</span>
                    <span class="tag">테스트데이터</span>
                    <span class="tag">테스트데이터</span>
                    <span class="tag">테스트데이터</span>
                    <span class="tag">테스트데이터</span>
                </div>

                <div class="description">
                    손님들이 <span style="color: var(--primary-blue); font-weight: 600;">${storeName}</span>의 이런 점을 아쉬워해요
                </div>
                <div class="tag-box">
                    <span class="emoji-tag">😢 분위기</span>
                    <span class="tag">테스트데이터</span>
                    <span class="tag">테스트데이터</span>
                    <span class="tag">테스트데이터</span>
                    <span class="tag">테스트데이터</span>
                    <span class="tag">테스트데이터</span>
                </div>

                <div class="tag-box">
                    <span class="emoji-tag">😓 서비스</span>
                    <span class="tag">테스트데이터</span>
                    <span class="tag">테스트데이터</span>
                    <span class="tag">테스트데이터</span>
                    <span class="tag">테스트데이터</span>
                    <span class="tag">테스트데이터</span>
                </div>

                <div class="stats-container">
                    <div class="chart-container">
                        <h3 class="chart-title">키워드</h3>
                        <div id="legend-container"></div>
                        <canvas id="keywordDonut"></canvas>
                    </div>
                    <div class="chart-container">
                        <h3 class="chart-title">월간 통계</h3>
                        <canvas id="weekReservChart"></canvas>
                    </div>
                </div>

                <div class="stats-container">
                    <div class="chart-container">
                        <h3 class="chart-title">키워드</h3>
                        <div id="reserv-container"></div>
                        <canvas id="dd"></canvas>
                    </div>
                    <div class="chart-container">
                        <h3 class="chart-title">월간 통계</h3>
                        <canvas id="dd2"></canvas>
                    </div>
                </div>



                <div class="description">
                    <span style="color: var(--primary-blue); font-weight: 600;">${area}</span> 주변 상권의 
                    <span style="color: var(--primary-blue); font-weight: 600;">${cateValue}</span>들의 장점은 이래요
                </div>
                <div class="tag-box">
                    <span class="emoji-tag">👍 장점</span>
                    <span class="tag">임시태그3</span>
                    <span class="tag">${tag2}</span>
                    <span class="tag">${tag3}</span>
                    <span class="tag">${tag4}</span>
                    <span class="tag">${tag5}</span>
                </div>

                <a href="/storeReportCreate" class="download-btn">
                    <span>다운로드</span>
                    <span>(pdf)</span>
                </a>
            </div>
        </div>
    </div>
</body>
</html>              