<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 매장 맞춤 보고서</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }

        body {
            background-color: #fff;
        }

        .container {
            width: 100%;
            max-width: 1440px;
            margin: 0 auto;
            padding: 0 20px;
        }
        .imgcontianer{
        	width: 50%;
        	max-width: 720px;
        	margin: 0 auto;
        	padding: 0 20px;
            object-fit: cover;
            border-radius:10px;
        }

        /*랜딩헤더*/
        .header {
            background-color: #fff;
            padding: 20px 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: 500;
        }

        .create-button {
            background-color: #191919;
            color: white;
            padding: 12px 24px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 500;
        }

        /*랜딩*/
        .hero {
            padding: 160px 0 80px;
            text-align: center;
        }

        .hero h1 {
            font-size: 76px;
            font-weight: 300;
            margin-bottom: 24px;
            line-height: 1.2;
            color: #191919;
        }

        .hero p {
            font-size: 20px;
            color: #666;
            margin-bottom: 48px;
        }

        /*영역전개*/
        .features {
            padding: 80px 0;
        }

        .feature {
            display: flex;
            align-items: center;
            margin-bottom: 120px;
            gap: 80px;
        }

        .feature:nth-child(even) {
            flex-direction: row-reverse;
        }

        .feature-content {
            flex: 1;
        }

        .feature-image {
            flex: 1;
        }

        .feature-image img {
            width: 100%;
            height: auto;
            border-radius: 12px;
        }

        .feature h2 {
            font-size: 45px;
            font-weight: 500;
            margin-bottom: 24px;
            color: #191919;
        }

        .feature p {
            font-size: 19px;
            color: #666;
            line-height: 1.6;
        }

        /*ㅇㅇ*/
        .integrations {
            padding: 80px 0;
            text-align: center;
        }

        .integration-grid {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
            margin-top: 48px;
        }

        .integration-item {
            text-align: center;
        }

        .integration-item img {
            width: 56px;
            height: 56px;
            margin-bottom: 16px;
        }

        /*저 요소들CTA라고하더라구요*/
        .cta {
            padding: 80px 0;
            text-align: center;
        }

        .cta h2 {
            font-size: 45px;
            font-weight: 300;
            margin-bottom: 32px;
        }

        /*푸터*/
        .footer {
            background-color: #191919;
            color: white;
            padding: 32px 0;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .footer-links {
            display: flex;
            gap: 24px;
        }

        .footer-links a {
            color: white;
            text-decoration: none;
            font-size: 14px;
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 48px;
            }

            .feature {
                flex-direction: column;
                gap: 40px;
            }

            .feature:nth-child(even) {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="container header-content">
            <div class="logo">잇츠로고</div>
            <a href="#" class="create-button">리뷰 보고서 구독하기</a>
        </div>
    </header>

    <section class="hero">
        <div class="container">
            <h1>내 매장 맞춤 보고서</h1>
            <p>사용자들의 실제 후기를 통해 내 매장의 정보를 더욱 정확하게 분석해드려요</p>
            <div class = "imgcontianer">
            	<img src="../img/store/storeLanding/Landing2.png" alt="대시보드 미리보기">
        	</div>
        </div>
    </section>

    <section class="features">
        <div class="container">
            <div class="feature">
                <div class="feature-content">
                    <h2>AI가 분석하여<br>말아주는 보고서</h2>
                    <p>많은 리뷰 보기 힘드셨죠?<br>리뷰에서 유의미한 정보를 빠르게 파악하여 분석해줍니다</p>
                </div>
                <div class="feature-image">
                    <img src="../img/store/storeLanding/dd4.jpg" alt="AI 분석">
                </div>
            </div>

            <div class="feature">
                <div class="feature-content">
                    <h2>통계기반 어쩌구</h2>
                    <p>실제 매장을 방문한 고객들의 리뷰를 통해<br>더욱 정확한 우리 매장의 방향성을 잡아줘요!</p>
                </div>
                <div class="feature-image">
                    <img src="../img/store/storeLanding/dd2.jpg" alt="통계 기반">
                </div>
            </div>

            <div class="feature">
                <div class="feature-content">
                    <h2>보고서를 받아보고<br>기분이 좋아졌어요!</h2>
                    <p>손님들이 남긴 악플을 요약받아서<br>고소장을 작성하기 더욱 편리해졌어요!</p>
                </div>
                <div class="feature-image">
                    <img src="../img/store/storeLanding/dd.jpg" alt="사용자 후기">
                </div>
            </div>
        </div>
    </section>

    <section class="integrations">
        <div class="container">
            <h2>지금 받아보세요</h2>
            <div class="integration-grid">
                <div class="integration-item">
                    <img src="/api/placeholder/56/56" alt="Zapier">
                    <p>Zapier</p>
                </div>
                <div class="integration-item">
                    <img src="/api/placeholder/56/56" alt="Google Sheets">
                    <p>Google Sheets</p>
                </div>
                <div class="integration-item">
                    <img src="/api/placeholder/56/56" alt="Slack">
                    <p>Slack</p>
                </div>
                <div class="integration-item">
                    <img src="/api/placeholder/56/56" alt="Google Analytics">
                    <p>Google Analytics</p>
                </div>
                <div class="integration-item">
                    <img src="/api/placeholder/56/56" alt="Hubspot">
                    <p>Hubspot</p>
                </div>
                <div class="integration-item">
                    <img src="/api/placeholder/56/56" alt="Salesforce">
                    <p>Salesforce</p>
                </div>
            </div>
        </div>
    </section>

    <section class="cta">
        <div class="container">
            <h2>무료 체험 신청하기</h2>
            <a href="#" class="create-button">무료로 시작하기</a>
        </div>
    </section>

    <footer class="footer">
        <div class="container footer-content">
            <div>SsangYong, Gangbuk-gu</div>
            <div class="footer-links">
                <a href="#">Cookie Settings</a>
                <a href="#">Cookie Policy</a>
                <a href="#">Report abuse</a>
            </div>
            <div>© Eat's</div>
        </div>
    </footer>
</body>
</html>