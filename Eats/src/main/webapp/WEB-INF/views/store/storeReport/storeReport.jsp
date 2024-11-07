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
        }

        .report-card {
            background-color: var(--light-blue);
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
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
        }

        .date-select {
            padding: 8px 16px;
            border: 1px solid var(--gray);
            border-radius: 8px;
            background-color: white;
        }

        .description {
            margin: 24px 0;
            color: var(--gray);
        }

        .tag-container {
            display: flex;
            gap: 8px;
            margin: 16px 0;
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
            margin-top: 32px;
        }

        .chart-container {
            background-color: white;
            padding: 24px;
            border-radius: 12.8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
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
        }

        .download-btn:hover {
            background-color: #f1f5f9;
        }
    </style>
    <script>
    	<!-- 임시로 넣어둔거입니다~ -->
        document.addEventListener('DOMContentLoaded', function() {
            let date = new Date().getMonth() + 1;
            let newLabel = document.createElement('label');
            newLabel.textContent = date;
            let select = document.querySelector('.date-select');
            document.getElementById('month').appendChild(newLabel);
            for (let i = 1; i <= date; i++) {
                let option = document.createElement('option');
                option.value = `2024.${i}`;
                option.textContent = `2024.${i} 월`;
                select.appendChild(option);
            }
        });
    </script>
</head>
<body>
    <div class="container">
        <div class="report-card">
            <div class="header">
                <h1 class="title">${storeName}의 <span id = "month"></span>월 보고서</h1>
                <select class="date-select">
                   
                </select>
            </div>

            <div class="description">
                손님들이 <span style="color: var(--primary-blue); font-weight: 600;">${storeName}</span>의 이런점을 좋아해요
            </div>

            <div class="tag-container">
                <span class="emoji-tag">😊 분위기</span>
                <span class="tag">임시태그3</span>
                <span class="tag">${tag2}</span>
                <span class="tag">${tag3}</span>
                <span class="tag">${tag4}</span>
                <span class="tag">${tag5}</span>
            </div>

            <div class="description">
                손님들이 <span style="color: var(--primary-blue); font-weight: 600;">${storeName}</span>의 이런점을 아쉬워해요
            </div>

            <div class="tag-container">
                <span class="emoji-tag">😊 분위기</span>
                <span class="tag">임시태그2</span>
                <span class="tag">${tag2}</span>
                <span class="tag">${tag3}</span>
                <span class="tag">${tag4}</span>
                <span class="tag">${tag5}</span>
            </div>

            <div class="stats-container">
                <div class="chart-container">
                    <h3 class="chart-title">TOP 5 키워드</h3>
                    <!-- 차트1 -->
                    <div id="donutChart">
                        ${donutChartData}
                    </div>
                </div>
                <div class="chart-container">
                    <h3 class="chart-title">월간 통계</h3>
                    <!-- 차트2 -->
                    <div id="barChart">
                        ${barChartData}
                    </div>
                </div>
            </div>
            <div>
                <div class="description"><span style="color: var(--primary-blue); font-weight: 600;">${area}</span> 주변 상관의 <span style="color: var(--primary-blue); font-weight: 600;">${cateValue}</span>들의 장점은 이래요</div>
                <div class="tag-container">
                    <span class="emoji-tag">😊 분위기</span>
                    <span class="tag">임시태그1</span>
                    <span class="tag">${tag2}</span>
                    <span class="tag">${tag3}</span>
                    <span class="tag">${tag4}</span>
                    <span class="tag">${tag5}</span>
                </div>
            </div>
            <div style="text-align: right; margin-top: 32px;">
                <a href="#" class="download-btn">
                    <span>다운로드</span>
                    <span>(pdf)</span>
                </a>
            </div>
        </div>
    </div>
</body>
</html>