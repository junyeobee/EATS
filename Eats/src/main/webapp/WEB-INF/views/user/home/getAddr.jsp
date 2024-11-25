<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9201b2fc722dd09f6ce9211e3b210a1&libraries=services"></script>

<title>Insert title here</title>
</head>
<body>
	<input type="text" id="my_addr">
	<input type="button" value="좌표받기" onclick="getAddrFor()">
	<br>
	<input type="text" id="sample6_postcode" placeholder="우편번호">
	<input type="button" onclick="getPostCode()" value="우편번호 찾기">
	<br>
	<input type="text" id="sample6_address" placeholder="주소">
	<br>
	<input type="text" id="sample6_detailAddress" placeholder="상세주소">
	<input type="text" id="sample6_extraAddress" placeholder="참고항목">

	<input type="text" id="getAddr">
	<input type="button" onclick="getLatLng()" value="위도경도 얻기">
	<div id="latlng"></div>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<input type="button" value="부드러운 이동" onclick="panTo()">
	<input type="button" value="지도 확대" onclick="zoomIn()">
	<input type="button" value="지도 축소" onclick="zoomOut()">
	<span id="maplevel">${word }</span>
</body>
<!-- <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9201b2fc722dd09f6ce9211e3b210a1"></script>
 -->
<!-- services 라이브러리 불러오기 -->

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	var geocoder = new kakao.maps.services.Geocoder();
	var input_addr = document.getElementById('my_addr');

	function getAddrFor() {
		geocoder.addressSearch(input_addr.value, function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var lat = result[0].y;
				var lng = result[0].x;
				var latlngbox = document.getElementById('latlng');
				latlngbox.innerText = '위도: ' + lat + ' 경도:' + lng;

			}
		});
	}

	function panTo(lat, lng) {
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(lat, lng);

		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);
	}
	function getLatLng() {
		var searchAddr = document.getElementById('sample6_address').value;
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(searchAddr, function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				var lat = result[0].y;
				var lng = result[0].x;

				var latlngbox = document.getElementById('latlng');
				latlngbox.innerText = '위도: ' + lat + ' 경도:' + lng;

				panTo(lat, lng);
			} else {
				alert('실패');
			}
		});
	}
	function getPostCode() {
	   	var width = 500; //팝업의 너비
    	var height = 600; //팝업의 높이
		new daum.Postcode(
				{ width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
					 height: height,
					oncomplete : function(data) {
						// 예제를 참고하여 다양한 활용법을 확인해 보세요.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open({
				    left: 500,
				    top: 500,
				    popupTitle: '장소 검색'
				});
	}
</script>
</html>