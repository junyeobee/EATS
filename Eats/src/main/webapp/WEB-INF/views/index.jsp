<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/user/indexCss.css">

<!-- noto sans kr font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<style>
a, button, input, select, h1, h2, h3, h4, h5, * {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border: none;
	text-decoration: none;
	background: none;
	-webkit-font-smoothing: antialiased;
}

menu, ol, ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.banner_swiper {
	margin: 150px 0;
	text-align: center;
}

.swiper {
	width: 100%;
	height: 240px;
}

.swiper-slide img {
	width: 1170px;
	height: auto;
	object-fit: cover;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="header_box">
			<img class="logo" src="/svg/logo_icon.svg" />
			<div class="profile_box">
				<a href="userLogin">로그인</a> <img class="proicons-person-circle"
					src="/svg/profile_icon.svg" />
				<div class="profile_msg">
					<div class="user_name">먹어츠</div>
					<div class="user_alert">알림 0건</div>
				</div>
			</div>
		</div>
	</header>
	<div class="main">
		<div class="search_box">
			<div class="location_box">
				<img class="ep-location" src="/svg/location_icon.svg" />
				<div class="locaton_text">지역</div>
			</div>
			<div class="search_input_box">
				<input type="text" class="search_input"> <label
					class="search_label">‘한식대첩’을 검색해보세요</label>
			</div>
			<img class="fe-search" src="/svg/search_icon.svg" />
		</div>
		<div class="categorys">
			<div class="food cate_box">
				<div class="food_text cate_text">
					<div class="food_title cate_title">음식 종류</div>
					<div class="food_sub cate_sub">
						어떤 요리를<br>찾으시나요?
					</div>
				</div>

				<div class="subcate_box">
					<div class="food_cate sub_one">
						<div class="text">한식</div>
					</div>
					<div class="food_cate sub_one">
						<div class="text">카페</div>
					</div>
					<div class="food_cate sub_one">
						<div class="text">
							아시아<br>요리
						</div>
					</div>
					<div class="food_cate sub_one">
						<div class="text">분식</div>
					</div>
					<div class="food_cate sub_one">
						<div class="text">일식</div>
					</div>
					<div class="food_cate sub_one">
						<div class="text">중식</div>
					</div>
					<div class="food_cate sub_one">
						<div class="text">양식</div>
					</div>
					<div class="food_cate sub_one">
						<div class="text">뷔페</div>
					</div>
				</div>
			</div>

			<div class="purpose cate_box">
				<div class="cate_text">
					<div class="cate_text cate_title">목적</div>
					<div class="cate_sub">
						어떤 공간을<br>원하시나요?
					</div>
				</div>

				<div class="subcate_box">
					<div class="sub_one">

						<div class="text">모임</div>
					</div>
					<div class="sub_one">

						<div class="text">프로포즈</div>
					</div>
					<div class="sub_one">

						<div class="text">비즈니스</div>
					</div>
					<div class="sub_one">

						<div class="text">상견례</div>
					</div>
					<div class="sub_one">

						<div class="text">생일 파티</div>
					</div>
					<div class="sub_one">
						<div class="text">데이트</div>
					</div>
					<div class="sub_one">
						<div class="text">대화</div>
					</div>
					<div class="sub_one">
						<div class="text">혼밥</div>
					</div>
					<div class="sub_one">
						<div class="text">혼술</div>
					</div>
				</div>
			</div>
			<div class="source cate_box">
				<div class="cate_text">
					<div class="cate_text cate_title">식재료</div>
					<div class="cate_sub">
						어떤 식재료를<br>좋아하시나요?
					</div>
				</div>

				<div class="subcate_box">
					<div class="sub_one">
						<div class="text">육류</div>
					</div>
					<div class="sub_one">
						<div class="text">채소</div>
					</div>
					<div class="sub_one">
						<div class="text">해산물</div>
					</div>
				</div>
				<div class="sub_sort_box">
					<div class="sub_sort">
						<div class="sub_sort_text">돼지</div>
					</div>
					<div class="sub_sort">
						<div class="sub_sort_text">소</div>
					</div>
					<div class="sub_sort">
						<div class="sub_sort_text">닭</div>
					</div>
					<div class="sub_sort">
						<div class="sub_sort_text">오리</div>
					</div>
					<div class="sub_sort">
						<div class="sub_sort_text">양</div>
					</div>
				</div>
			</div>
			<div class="convenience cate_box">
				<div class="cate_text">
					<div class="cate_text cate_title">편의시설</div>
					<div class="cate_sub">
						필요하신<br>편의 사항이<br>있나요?
					</div>
				</div>

				<div class="subcate_box">
					<div class="sub_one_box">
						<div class="sub_one_circle">
							<img class="wifi_icon icon_circle" src="/svg/wifi_icon.svg" />
						</div>
						<div class="text">와이파이</div>
					</div>

					<div class="sub_one_box">
						<div class="sub_one_circle">
							<img class="parkinglot_icon icon_circle"
								src="/svg/parkinglot_icon.svg" />
						</div>
						<div class="text">주차장</div>
					</div>

					<div class="sub_one_box">
						<div class="sub_one_circle">
							<img class="playroom_icon icon_circle"
								src="/svg/playroom_icon.svg" />
						</div>
						<div class="text">놀이방</div>
					</div>

					<div class="sub_one_box">
						<div class="sub_one_circle">
							<img class="group_icon icon_circle" src="/svg/group_icon.svg" />
						</div>
						<div class="text">단체</div>
					</div>

					<div class="sub_one_box">
						<div class="sub_one_circle">
							<img class="one_icon icon_circle" src="/svg/one_icon.svg" />
						</div>
						<div class="text">1인석</div>
					</div>

					<div class="sub_one_box">
						<div class="sub_one_circle">
							<img class="handicap_icon icon_circle"
								src="/svg/handicap_icon.svg" />
						</div>
						<div class="text">
							장애인<br>편의시설
						</div>
					</div>

					<div class="sub_one_box">
						<div class="sub_one_circle">
							<img class="waitingArea_icon icon_circle"
								src="/svg/waitingroom_icon.svg" />
						</div>
						<div class="text">대기 공간</div>
					</div>

					<div class="sub_one_box">
						<div class="sub_one_circle">
							<img class="reantal_icon icon_circle" src="/svg/reantal_icon.svg" />
						</div>
						<div class="text">대관</div>
					</div>
				</div>
			</div>
		</div>

		<div class="banner_box">
			<div class="banner_swiper">
				<div class="swiper">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper">
						<!-- Slides -->
						<div class="swiper-slide">
							<img src="/img/banner_img.png">
						</div>
						<!-- <div class="swiper-slide">
                            <img src="/img/contents_img.png">
                        </div>
                        <div class="swiper-slide">
                            <img src="/img/reserve_img.png">
                        </div> -->
					</div>
					<!-- If we need pagination -->
					<div class="swiper-pagination"></div>

				</div>
			</div>
		</div>

		<div class="review_box">
			<div class="review_box_text">
				<div class="review_title">리뷰 폭!</div>
				<div class="review_sub">폭!을 많이 받은 리뷰로 맛집을 추천 받아 보세요!</div>
			</div>
			<div class="review_container">
				<div class="user_review">
					<div class="user_info">
						<img src="/svg/profile_icon.svg">
						<div class="user_pro">
							<div class="user_id_info">
								<div class="user_id">까마귀 고기</div>
								<div class="user_follow">팔로워 10</div>
							</div>
							<div class="user_date_info">
								<div class="user_date_text">방문일</div>
								<div class="user_date">2024.10.29</div>
							</div>
						</div>
					</div>
					<div class="user_review_box">
						<div class="user_review_text">까마귀도 좋아하는 맛있는 파스타 근데 이제 푸실리를
							곁들인 저희 할머니도 무척 맛있게 드셨어요. 최고의 오리엔탈 퓨전 파스타입니다. 추천해요~</div>
						<div class="user_review_sub">
							<div class="review_tag_box">
								<div class="review_tag">
									<div class="review_tag_text">가족 모임</div>
								</div>
								<div class="review_tag">
									<div class="review_tag_text">편한 좌석</div>
								</div>
							</div>
							<div class="fork_info">
								<img class="fork_img" src="/svg/fork_icon.svg" />
								<div class="fork_text">125</div>
							</div>
						</div>
					</div>
				</div>
				<div class="user_review">
					<div class="user_info">
						<img src="/svg/profile_icon.svg">
						<div class="user_pro">
							<div class="user_id_info">
								<div class="user_id">까마귀 고기</div>
								<div class="user_follow">팔로워 10</div>
							</div>
							<div class="user_date_info">
								<div class="user_date_text">방문일</div>
								<div class="user_date">2024.10.29</div>
							</div>
						</div>
					</div>
					<div class="user_review_box">
						<div class="user_review_text">까마귀도 좋아하는 맛있는 파스타 근데 이제 푸실리를
							곁들인 저희 할머니도 무척 맛있게 드셨어요. 최고의 오리엔탈 퓨전 파스타입니다. 추천해요~</div>
						<div class="user_review_sub">
							<div class="review_tag_box">
								<div class="review_tag">
									<div class="review_tag_text">가족 모임</div>
								</div>
								<div class="review_tag">
									<div class="review_tag_text">편한 좌석</div>
								</div>
							</div>
							<div class="fork_info">
								<img class="fork_img" src="/svg/fork_icon.svg" />
								<div class="fork_text">125</div>
							</div>
						</div>
					</div>
				</div>
				<div class="user_review">
					<div class="user_info">
						<img src="/svg/profile_icon.svg">
						<div class="user_pro">
							<div class="user_id_info">
								<div class="user_id">까마귀 고기</div>
								<div class="user_follow">팔로워 10</div>
							</div>
							<div class="user_date_info">
								<div class="user_date_text">방문일</div>
								<div class="user_date">2024.10.29</div>
							</div>
						</div>
					</div>
					<div class="user_review_box">
						<div class="user_review_text">까마귀도 좋아하는 맛있는 파스타 근데 이제 푸실리를
							곁들인 저희 할머니도 무척 맛있게 드셨어요. 최고의 오리엔탈 퓨전 파스타입니다. 추천해요~</div>
						<div class="user_review_sub">
							<div class="review_tag_box">
								<div class="review_tag">
									<div class="review_tag_text">가족 모임</div>
								</div>
								<div class="review_tag">
									<div class="review_tag_text">편한 좌석</div>
								</div>
							</div>
							<div class="fork_info">
								<img class="fork_img" src="/svg/fork_icon.svg" />
								<div class="fork_text">125</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="reserve_box">
			<div class="reserve_text">
				<div class="reserve_title">
					빠른 예약<br />가능 식당
				</div>
				<div class="reserve_sub">
					바로 예약 가능한<br />식당이 알고 싶다면?
				</div>
			</div>

			<div class="reserve_container">
				<div class="store_reserve">
					<div class="store_reserve_box">
						<img class="reserve_img" src="/img/reserve_img.png" />

						<div class="store_reserve_info">
							<div class="store_reserve_info_box">
								<div class="store_reserve_title">트러플 머쉬룸 오일리스터</div>
								<div class="store_reserve_sub">
									<div class="store_star">
										<img class="star_icon" src="/svg/star_icon.svg" />
										<div class="star_point">4.7</div>
										<div class="review_count">(131)</div>
									</div>
									<div class="store_location">
										<img class="location_icon" src="/svg/location_icon.svg" />
										<div class="location_text">대전시 성심당</div>
									</div>
								</div>
							</div>

							<div class="store_reserve_tag_box">
								<div class="store_reserve_tag">
									<div class="store_reserve_tag_text">대화</div>
								</div>
								<div class="store_reserve_tag">
									<div class="store_reserve_tag_text">야채</div>
								</div>
								<div class="store_reserve_tag">
									<div class="store_reserve_tag_text">양식</div>
								</div>
							</div>
						</div>
					</div>
					<div class="reserve_time_box">
						<div class="reserve_time">
							<div class="reserve_time_text">12:30</div>
						</div>
						<div class="reserve_time">
							<div class="reserve_time_text">13:30</div>
						</div>
						<div class="reserve_time">
							<div class="reserve_time_text">16:00</div>
						</div>
						<div class="reserve_time">
							<div class="reserve_time_text">19:30</div>
						</div>
					</div>
				</div>
				<div class="store_reserve">
					<div class="store_reserve_box">
						<img class="reserve_img" src="/img/reserve_img.png" />

						<div class="store_reserve_info">
							<div class="store_reserve_info_box">
								<div class="store_reserve_title">트러플 머쉬룸 오일리스터</div>
								<div class="store_reserve_sub">
									<div class="store_star">
										<img class="star_icon" src="/svg/star_icon.svg" />
										<div class="star_point">4.7</div>
										<div class="review_count">(131)</div>
									</div>
									<div class="store_location">
										<img class="location_icon" src="/svg/location_icon.svg" />
										<div class="location_text">대전시 성심당</div>
									</div>
								</div>
							</div>

							<div class="store_reserve_tag_box">
								<div class="store_reserve_tag">
									<div class="store_reserve_tag_text">대화</div>
								</div>
								<div class="store_reserve_tag">
									<div class="store_reserve_tag_text">야채</div>
								</div>
								<div class="store_reserve_tag">
									<div class="store_reserve_tag_text">양식</div>
								</div>
							</div>
						</div>
					</div>
					<div class="reserve_time_box">
						<div class="reserve_time">
							<div class="reserve_time_text">12:30</div>
						</div>
						<div class="reserve_time">
							<div class="reserve_time_text">13:30</div>
						</div>
						<div class="reserve_time">
							<div class="reserve_time_text">16:00</div>
						</div>
						<div class="reserve_time">
							<div class="reserve_time_text">19:30</div>
						</div>
					</div>
				</div>
				<div class="store_reserve">
					<div class="store_reserve_box">
						<img class="reserve_img" src="/img/reserve_img.png" />

						<div class="store_reserve_info">
							<div class="store_reserve_info_box">
								<div class="store_reserve_title">트러플 머쉬룸 오일리스터</div>
								<div class="store_reserve_sub">
									<div class="store_star">
										<img class="star_icon" src="/svg/star_icon.svg" />
										<div class="star_point">4.7</div>
										<div class="review_count">(131)</div>
									</div>
									<div class="store_location">
										<img class="location_icon" src="/svg/location_icon.svg" />
										<div class="location_text">대전시 성심당</div>
									</div>
								</div>
							</div>

							<div class="store_reserve_tag_box">
								<div class="store_reserve_tag">
									<div class="store_reserve_tag_text">대화</div>
								</div>
								<div class="store_reserve_tag">
									<div class="store_reserve_tag_text">야채</div>
								</div>
								<div class="store_reserve_tag">
									<div class="store_reserve_tag_text">양식</div>
								</div>
							</div>
						</div>
					</div>
					<div class="reserve_time_box">
						<div class="reserve_time">
							<div class="reserve_time_text">12:30</div>
						</div>
						<div class="reserve_time">
							<div class="reserve_time_text">13:30</div>
						</div>
						<div class="reserve_time">
							<div class="reserve_time_text">16:00</div>
						</div>
						<div class="reserve_time">
							<div class="reserve_time_text">19:30</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content_box">
			<div class="content_text">
				<div class="content_title">
					주변<br />문화콘텐츠
				</div>
				<div class="content_sub">밥 먹고 뭐 할까?</div>
			</div>
			<div class="content_container">
				<div class="culture_content">
					<div class="content_img_box">
						<img src="/img/contents_img.png" alt="" class="content_img">
					</div>
					<div class="content_info">
						<div class="place_name">수성못</div>
						<div class="place_addr">대구시 수성구 어쩌구로 110</div>
					</div>
				</div>
				<div class="culture_content">
					<div class="content_img_box">
						<img src="/img/contents_img.png" alt="" class="content_img">
					</div>
					<div class="content_info">
						<div class="place_name">수성못</div>
						<div class="place_addr">대구시 수성구 어쩌구로 110</div>
					</div>
				</div>
				<div class="culture_content">
					<div class="content_img_box">
						<img src="/img/contents_img.png" alt="" class="content_img">
					</div>
					<div class="content_info">
						<div class="place_name">수성못</div>
						<div class="place_addr">대구시 수성구 어쩌구로 110</div>
					</div>
				</div>
				<div class="culture_content">
					<div class="content_img_box">
						<img src="/img/contents_img.png" alt="" class="content_img">
					</div>
					<div class="content_info">
						<div class="place_name">수성못</div>
						<div class="place_addr">대구시 수성구 어쩌구로 110</div>
					</div>
				</div>
				<div class="culture_content">
					<div class="content_img_box">
						<img src="/img/contents_img.png" alt="" class="content_img">
					</div>
					<div class="content_info">
						<div class="place_name">수성못</div>
						<div class="place_addr">대구시 수성구 어쩌구로 110</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer">footer</div>
>>>>>>> develop
	</div>

</body>
</html>