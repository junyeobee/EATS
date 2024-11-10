<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href='css/reset.css' rel='stylesheet'>
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
	<link href='css/style.css' rel='stylesheet'>
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script src="js/ui.front.js"></script>
	<title></title>
</head>
<body>
	<div class="wrapper">
		<!-- header (s) -->
		<header>
			<div class="inner">
				<h1 class="logo">
					<a href="#" title="홈으로 가기">
						<img src="images/logo.png" alt="eat's">
					</a>
				</h1>
				<a href="#" class="user-area" title="마이페이지">
					<span class="user">먹어츠</span>
					<span class="noti">알림 <em>0</em>건</span>
				</a>
			</div>
		</header>
		<!-- header (e) -->

		<section id="content">
			<!-- 왼쪽 컨텐츠 영역 (s) -->
			<div class="content-wrap">
				<div class="store-wrap">
					<div class="tit-area">
						<strong class="tit">파브리키친</strong>
						<span class="cate">
							<span>서울</span>
							<span>이탈리안</span>
						</span>
					</div>
					<div class="info">
						<span class="start">4.7</span>
						<span class="review">리뷰 <em>192</em></span>
					</div>
					<div class="recommend">237</div>
				</div>

				<!-- 상단 가게 이미지 영역 (s) -->
				<div class="swiper swp-store">
					<div class="swiper-wrapper">
						<div class="swiper-slide"><img src="images/img_01.png" alt="가게사진1"/></div>
						<div class="swiper-slide"><img src="images/img_01.png" alt="가게사진2"/></div>
						<div class="swiper-slide"><img src="images/img_01.png" alt="가게사진3"/></div>
						<div class="swiper-slide"><img src="images/img_01.png" alt="가게사진4"/></div>
						<div class="swiper-slide"><img src="images/img_01.png" alt="가게사진5"/></div>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
				<!-- 상단 가게 이미지 영역 (e) -->

				<!-- 위치, 시간, 편의시설 (s) -->
				<div class="bg-box">
					<div class="inner">
						<div class="acco-wrap">
							<div class="acco-head">
								<a href="#" class="btn-acco">
									<i class="map"></i>
									<span>서울 용산구 한강대로15길 23-6</span>
								</a>
							</div>
							<div class="acco-body">
								<ul class="addr-list">
									<li>
										<span class="item">도로명</span>
										<span class="val">서울 용산구 이태원로55가길 45</span>
									</li>
									<li>
										<span class="item">지번</span>
										<span class="val">한남동 738-11</span>
									</li>
									<li>
										<span class="item">우편번호</span>
										<span class="val">04348</span>
									</li>
								</ul>
							</div>
						</div>
						<p class="desc">한강진역 1번 출구에서 500m 정도 걸어오시면 됩니다.</p>
					</div>
					
					<div class="inner">
						<div class="acco-wrap">
							<div class="acco-head">
								<a href="#" class="btn-acco">
									<i class="clock"></i>
									<span>12:00 ~ 22:00</span>
								</a>
							</div>
							<div class="acco-body">
								<ul class="time-list">
									<li>
										<span class="item">월</span>
										<span class="val">휴무</span>
									</li>
									<li>
										<span class="item">화</span>
										<span class="val">12:00 - 22:00</span>
									</li>
									<li>
										<span class="item">수</span>
										<span class="val">12:00 - 22:00</span>
									</li>
									<li>
										<span class="item">목</span>
										<span class="val">12:00 - 22:00</span>
									</li>
									<li>
										<span class="item">금</span>
										<span class="val">12:00 - 22:00</span>
									</li>
									<li>
										<span class="item">토</span>
										<span class="val">12:00 - 22:00</span>
									</li>
									<li>
										<span class="item">일</span>
										<span class="val">휴무</span>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="inner txt">
						<strong class="tit">편의시설</strong>
						<ul class="convenience-list">
							<li>와이파이</li>
							<li>주차장</li>
							<li>유아의자</li>
							<li>발렛 파킹</li>
							<li>장애인 편의시설</li>
							<li>대관 가능</li>
							<li>대기공간</li>
							<li>1인석</li>
							<li>단체 이용가능</li>
						</ul>
					</div>

				</div>
				<!-- 위치, 시간, 편의시설 (e) -->

				<!-- 공지사항 (s) -->
				<div class="bg-box">
					<div class="swiper swp-noti">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="inner txt">
									<strong class="tit">[알림1] 대기 접수 사전 안내드립니다.</strong>
									<p class="desc">안녕하세요, 파브리키친입니다. 대기 접수 사전 안내드립니다. 정말 감사하게도 많은 고객님들께서 저희 매장을 사랑해주셔서 대기 접수 후 입장까지 다소 많은 시간이 소요되는 경우가 발생합니다.</p>
									<div class="btn-area">
										<button type="button" class="btn-more">더보기</button>
									</div>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="inner txt">
									<strong class="tit">[알림1] 대기 접수 사전 안내드립니다.</strong>
									<p class="desc">안녕하세요, 파브리키친입니다. 대기 접수 사전 안내드립니다. 정말 감사하게도 많은 고객님들께서 저희 매장을 사랑해주셔서 대기 접수 후 입장까지 다소 많은 시간이 소요되는 경우가 발생합니다.</p>
									<div class="btn-area">
										<button type="button" class="btn-more">더보기</button>
									</div>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="inner txt">
									<strong class="tit">[알림1] 대기 접수 사전 안내드립니다.</strong>
									<p class="desc">안녕하세요, 파브리키친입니다. 대기 접수 사전 안내드립니다. 정말 감사하게도 많은 고객님들께서 저희 매장을 사랑해주셔서 대기 접수 후 입장까지 다소 많은 시간이 소요되는 경우가 발생합니다.</p>
									<div class="btn-area">
										<button type="button" class="btn-more">더보기</button>
									</div>
								</div>
							</div>
						</div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
				<!-- 공지사항 (e) -->
			
				<!-- 리뷰 버튼 (s) -->
				<a href="#" class="btn-review">리뷰 보러 가기</a>
				<!-- 리뷰 버튼 (e) -->

				<!-- 메뉴 리스트 (s) -->
				<div class=" bg-box">
					<div class="tab-wrap">
						<ul class="tab-list">
							<li class="on">
								<a href="#panel_1">
									<span class="tit">메인</span>
								</a>
							</li>
							<li>
								<a href="#panel_2">
									<span class="tit">디저트</span>
								</a>
							</li>
							<li>
								<a href="#panel_3">
									<span class="tit">음료</span>
								</a>
							</li>
						</ul>
						<div class="tab-contents">
							<div class="tab-panel" id="panel_1">
								<ul class="menu-list">
									<li>
										<img src="images/img_pasta.png" alt="파스타1"/>
										<div class="txt-area">
											<strong>PPP 파스타</strong>
											<span class="price">22,000</span>
											<p>Pasta panna piselli e prosciutto 콩과 햄이 들어간 크림 파스타</p>
										</div>
									</li>
									<li>
										<img src="images/img_pasta.png" alt="파스타1"/>
										<div class="txt-area">
											<strong>PPP 파스타</strong>
											<span class="price">22,000</span>
											<p>Pasta panna piselli e prosciutto 콩과 햄이 들어간 크림 파스타</p>
										</div>
									</li>
									<li>
										<img src="images/img_pasta.png" alt="파스타1"/>
										<div class="txt-area">
											<strong>PPP 파스타</strong>
											<span class="price">22,000</span>
											<p>Pasta panna piselli e prosciutto 콩과 햄이 들어간 크림 파스타</p>
										</div>
									</li>
									<li>
										<img src="images/img_pasta.png" alt="파스타1"/>
										<div class="txt-area">
											<strong>PPP 파스타</strong>
											<span class="price">22,000</span>
											<p>Pasta panna piselli e prosciutto 콩과 햄이 들어간 크림 파스타</p>
										</div>
									</li>
									<li>
										<img src="images/img_pasta.png" alt="파스타1"/>
										<div class="txt-area">
											<strong>PPP 파스타</strong>
											<span class="price">22,000</span>
											<p>Pasta panna piselli e prosciutto 콩과 햄이 들어간 크림 파스타</p>
										</div>
									</li>
									<li>
										<img src="images/img_pasta.png" alt="파스타1"/>
										<div class="txt-area">
											<strong>추가 PPP 파스타</strong>
											<span class="price">22,000</span>
											<p>Pasta panna piselli e prosciutto 콩과 햄이 들어간 크림 파스타</p>
										</div>
									</li>
									<li>
										<img src="images/img_pasta.png" alt="파스타1"/>
										<div class="txt-area">
											<strong>추가 PPP 파스타</strong>
											<span class="price">22,000</span>
											<p>Pasta panna piselli e prosciutto 콩과 햄이 들어간 크림 파스타</p>
										</div>
									</li>
								</ul>
								<button type="button" class="btn-menu-more">메뉴 더보기</button>
							</div>
							<div class="tab-panel" id="panel_2">
								<ul class="menu-list">
									<li>
										<img src="images/img_pasta.png" alt="파스타1"/>
										<div class="txt-area">
											<strong>PPP 파스타</strong>
											<span class="price">22,000</span>
											<p>Pasta panna piselli e prosciutto 콩과 햄이 들어간 크림 파스타</p>
										</div>
									</li>
								</ul>
								<button type="button" class="btn-menu-more">메뉴 더보기</button>
							</div>
							<div class="tab-panel" id="panel_3">
								<ul class="menu-list">
									<li>
										<img src="images/img_pasta.png" alt="파스타1"/>
										<div class="txt-area">
											<strong>PPP 파스타</strong>
											<span class="price">22,000</span>
											<p>Pasta panna piselli e prosciutto 콩과 햄이 들어간 크림 파스타</p>
										</div>
									</li>
									<li>
										<img src="images/img_pasta.png" alt="파스타1"/>
										<div class="txt-area">
											<strong>PPP 파스타</strong>
											<span class="price">22,000</span>
											<p>Pasta panna piselli e prosciutto 콩과 햄이 들어간 크림 파스타</p>
										</div>
									</li>
								</ul>
								<button type="button" class="btn-menu-more">메뉴 더보기</button>
							</div>
						</div>
					</div>
					<!-- icoTab (e) -->
				</div>
				<!-- 메뉴 리스트 (e) -->
			</div>
			<!-- 왼쪽 컨텐츠 영역 (e) -->

			<!-- 오른쪽 예약 영역 (s) -->
			<div class="reservation">
				예약 영역
			</div>
			<!-- 오른쪽 예약 영역 (e) -->
		</section>
	</div>
</body>
</html>