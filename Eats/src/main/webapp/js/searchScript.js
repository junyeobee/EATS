var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(36.35137969556768, 127.92635971181551), //지도의 중심좌표.
	level: 12,
	//지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
var imageSrc = '/svg/gps_icon.svg',
	imageSize = new kakao.maps.Size(55, 59),
	imageOption = { offset: new kakao.maps.Point(27, 69) };

window.addEventListener('load', function() {
	var tags = document.getElementsByClassName('filter_tag');
	var params = document.getElementsByClassName('tagParam');

	for (var i = 0; i < params.length; i++) {
		for (var j = 0; j < tags.length; j++) {
			if (params[i].value == tags[j].id) {
				tags[j].style.backgroundColor = '#ffb53c';
				tags[j].style.borderColor = '#ffb53c';
				tags[j].firstElementChild.style.color = 'white';
			}
		}
	}

	var locs = document.getElementsByClassName('locationParam');
	var areaWord = document.getElementById('pick_area').innerText;

	if (locs.length > 0) {
		for (var i = 0; i < locs.length; i++) {
			var lat = locs[i].value.split(',')[0];
			var lng = locs[i].value.split(',')[1];
			var storeName = locs[i].value.split(',')[2];
			var storePoint = locs[i].value.split(',')[3];
			var storeCnt = locs[i].value.split(',')[4];
			var content = '<div class="marker_position"><div class="marker_info"><div class="marker_text">' + storeName + '</div>'
			+'<div class="marker_review"><div class="marker_point"><img class="marker_point_icon" src="/svg/star_icon.svg">'
			+'<div class="marker_point_text">'+storePoint
			+'</div></div><div class="marker_cnt">('+storeCnt+')</div></div></div></div>';

			var markerPosition = new kakao.maps.LatLng(lat, lng);
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

			var marker = new kakao.maps.Marker({
				position: markerPosition,
				image: markerImage,
			});
			
			marker.setMap(map);

			var overlay = new kakao.maps.CustomOverlay({
				content: content,
				position: markerPosition
			});
			
			kakao.maps.event.addListener(marker, 'click', goToClickPlace);
			kakao.maps.event.addListener(marker, 'mouseover', function(){
				overlay.setMap(map);
			});
			
			
		}
	}

	var ps = new kakao.maps.services.Places();

	// 키워드로 장소를 검색합니다
	ps.keywordSearch(areaWord, placesSearchCB);
});

function goToClickPlace() {
	var pos = this.getPosition();

	var lat = pos.getLat();
	var lng = pos.getLng();

	map.setLevel(5);
	panTo(lat, lng);
}

function placesSearchCB(data, status, pagination) {
	if (status === kakao.maps.services.Status.OK) {

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		// LatLngBounds 객체에 좌표를 추가합니다
		var bounds = new kakao.maps.LatLngBounds();

		for (var i = 0; i < data.length; i++) {
			//displayMarker(data[i]);    
			bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		}

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);

		//var level = map.getLevel();
		map.setLevel(5);

	}
}

function displayMarker(place) {

	// 마커를 생성하고 지도에 표시합니다
	var marker = new kakao.maps.Marker({
		map: map,
		position: new kakao.maps.LatLng(place.y, place.x),
		image: markerImage
	});

	// 마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {
		// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		infowindow.open(map, marker);
	});
}

var modal = document.getElementById("modal");
var exitbtn = document.getElementById("exitbtn");
var pickArea = document.getElementById('pick_area');
var areaText = document.getElementById('areaText');
var calendar_box = document.getElementById('calendar_box');
var parameters = document.getElementById('parameters');

function addThisTagToFilter(t) {
	var param = t.id;

	if (t.firstElementChild.style.color != 'black') {
		var url = document.getElementById('parameters');
		var paramArr = url.value.split(param);

		var newUrl = (paramArr[0] + paramArr[1]).replace(/\s+/g, ' ');
		location.href = 'searchStore?' + newUrl;

	} else if (t.firstElementChild.style.color == 'black') {
		checkParams(parameters.value, 'tagWord', param);
	}
}

function openAreaSelectBox() {
	modal.style.display = 'flex';
	var main = document.getElementById("main");
	var header = document.getElementById('userHeader');
	var h = main.scrollHeight + header.scrollHeight;
	modal.style.height = h + 'px';

	var area = modal.firstElementChild;

	var middle = ((window.innerWidth - area.scrollWidth) / 2) / window.innerWidth * 100;
	area.style.left = middle + '%';
}

exitbtn.addEventListener('click', function() {
	modal.style.display = 'none';
});


function selectCity(cityIdx, t) {
	areaText.innerText = t.innerText;
	var params = 'cityIdx=' + cityIdx;
	sendRequest('selectUnit', params, showUnit, 'GET');
}

function showUnit() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = XHR.responseText;
			var jd = JSON.parse(data);

			var unitbox = document.getElementById('unitbox');
			unitbox.innerHTML = '';

			var svalue = document.createElement('div');
			svalue.setAttribute('class', 'area_small_value');

			jd.list.forEach(function(unit) {
				var value_text = document.createElement('div');
				value_text.setAttribute('class', 'area_small_value_text');
				value_text.setAttribute('onclick', 'selectThisArea(this)');
				value_text.innerHTML = unit;

				svalue.appendChild(value_text);
			});

			unitbox.appendChild(svalue);
		}
	}
}

function selectThisArea(t) {
	var city = areaText.innerText.substring(0, 2);
	var newparam = city + ' ' + t.innerText;

	areaText.value = newparam;

	var param = 'selectCity=' + city + '&selectUnit=' + t.innerText;
	sendRequest('setArea', param, showSelectArea, 'GET');
}

function showSelectArea() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			checkParams(parameters.value, 'areaWord', areaText.value);
		}
	}
}

function selectThisTime(t) {
	var h = t.firstElementChild.innerText
	var m = t.lastElementChild.innerText;
	var selectedTime = h + ":" + m;

	checkParams(parameters.value, 'selectedTime', selectedTime);
}

var selectedMinPrice = document.getElementById('selectedMinPrice');
var selectedMaxPrice = document.getElementById('selectedMaxPrice');

function selectThisPrice() {
	var minp = selectedMinPrice.innerText.split('만원')[0] + '0000';
	var maxp = selectedMaxPrice.innerText.split('만원')[0] + '0000';
	var selectedPrice = minp + ',' + maxp;

	checkParams(parameters.value, 'selectedPrice', selectedPrice);
}

function checkParams(paramValue, paramName, value) {
	var params = paramValue.split('&');
	var result = '';
	for (var i = 0; i < params.length; i++) {
		if (i > 0) {
			result += '&';
		}
		if (params[i].includes(paramName)) {

			if (paramName == 'tagWord') {
				result += params[i] + '%20' + value;
			} else {
				result += paramName + '=' + value;
			}
		} else {
			result += params[i];
		}
	}

	location.href = 'searchStore?' + result;
}

function openDateSelectBox() {
	if (calendar_box.style.height == '100%') {
		calendar_box.style.height = '0';
		calendar_box.style.margin = '0px auto';
	} else {
		calendar_box.style.height = '100%';
		calendar_box.style.margin = '20px auto';
	}
}

function openTimeSelectBox(t) {
	var time_paper = t.nextElementSibling;
	if (time_paper.style.height == '100%') {
		time_paper.style.height = '0';
		time_paper.style.overflow = 'hidden';
	} else {
		time_paper.style.height = '100%';
		time_paper.style.overflow = 'auto';
	}
}

function resetThisTag(range) {
	var url = document.getElementById('parameters').value;

	if (range == 'all') {
		console.log(range);
		location.href = '/searchStore';
	} else if (range == 'price') {
		var newUrl = url.split('selectedPrice=')[0] + 'selectedPrice=';

		location.href = 'searchStore?' + newUrl;
	} else {
		var tags = url.split('tagWord=')[1].split(' ');
		var newUrl = url.split('tagWord=')[0] + 'tagWord=';
		for (var i = 1; i < tags.length; i++) {
			if (tags[i].split(',')[0] != range) {
				newUrl += ' ' + tags[i];
			}
		}

		location.href = 'searchStore?' + newUrl;
	}
}

function viewStoreDetail(store_idx, selectedDate) {
	location.href = '/user/storeInfo?store_idx=' + store_idx + '&reserve_date=' + selectedDate;
}

//캘린더 js(복사함)
document.addEventListener('DOMContentLoaded', function() {
	const calendar = document.getElementById('calendar');
	const currentDate = new Date();
	let currentMonth = currentDate.getMonth();
	let currentYear = currentDate.getFullYear();

	let rundayStr = "[월],[화],[수],[목],[금],[토],[일]";
	// 대괄호 제거하고 공백 정리
	let rundayList = rundayStr.replace(/[\[\]]/g, '').split(',').map(day => day.trim());

	const dayMapping = {
		'일': 0, '월': 1, '화': 2, '수': 3, '목': 4, '금': 5, '토': 6
	};

	let activeDays = rundayList.map(day => dayMapping[day]);
	function generateCalendar(month, year) {
		const firstDay = new Date(year, month, 1);
		const lastDay = new Date(year, month + 1, 0);
		const startDay = firstDay.getDay();
		const totalDays = lastDay.getDate();

		let html = `
   <div class="calendar-header">
   <button id="prevMonth" `+ (month === currentDate.getMonth() ? 'disabled' : '') + `>&lt;</button>
   <h2>` + year + '년 ' + (month + 1) + `월</h2>
   <button id="nextMonth" `+ (month >= currentDate.getMonth() + 1 ? 'disabled' : '') + `>&gt;</button>
   </div>
   <table>
   <thead>
   <tr>
   <th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
   </tr>
   </thead>
   <tbody>`;

		let date = 1;
		for (let i = 0; i < 6; i++) {
			html += '<tr>';
			for (let j = 0; j < 7; j++) {
				if (i === 0 && j < startDay) {
					html += '<td></td>';
				} else if (date > totalDays) {
					html += '<td></td>';
				} else {
					const currentDateObj = new Date(year, month, date);
					const today = new Date();
					today.setHours(0, 0, 0, 0);

					const isDisabled = currentDateObj < today || !activeDays.includes(j);
					const isSelectable = !isDisabled;

					html += '<td class="' + (isSelectable ? 'selectable' : 'disabled') + '" ' +
						'data-date="' + year + '-' + String(month + 1).padStart(2, '0') + '-' + String(date).padStart(2, '0') + '" ' +
						(isDisabled ? 'disabled' : '') + '>' +
						date +
						'</td>';
					date++;
				}
			}
			html += '</tr>';
			if (date > totalDays) {
				break;
			}
		}
		html += '</tbody></table>';
		calendar.innerHTML = html;

		document.getElementById('prevMonth').addEventListener('click', () => {
			if (month > currentDate.getMonth()) {
				currentMonth--;
				generateCalendar(currentMonth, currentYear);
			}
		});

		document.getElementById('nextMonth').addEventListener('click', () => {
			if (month < currentDate.getMonth() + 1) {
				currentMonth++;
				generateCalendar(currentMonth, currentYear);
			}
		});

		document.querySelectorAll('.selectable').forEach(cell => {
			cell.addEventListener('click', function() {
				document.querySelectorAll('.selected').forEach(el => el.classList.remove('selected'));
				this.classList.add('selected');
				const selectedDate = this.dataset.date;
				document.getElementById('selected_date').innerText = selectedDate;
				document.getElementById('pick_date_icon').setAttribute('src', '/svg/calander_icon_tomato.svg');

				checkParams(parameters.value, 'selectedDate', selectedDate);
			});
		});
	}

	generateCalendar(currentMonth, currentYear);
});

function panTo(lat, lng) {
	// 이동할 위도 경도 위치를 생성합니다 
	var moveLatLon = new kakao.maps.LatLng(lat, lng);

	map.panTo(moveLatLon);
}     
