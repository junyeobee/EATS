
window.addEventListener('load', function(){ 
	var tags = document.getElementsByClassName('filter_tag');
	var params = document.getElementsByClassName('tagParam');
	
	for(var i=0; i<params.length; i++) {
		for(var j=0; j<tags.length; j++) {
			if(params[i].value==tags[j].id) {
				tags[j].style.backgroundColor = '#ffb53c';
				tags[j].style.borderColor = '#ffb53c';
				tags[j].firstElementChild.style.color = 'white';
			}
		}
	}
});

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

		var newUrl = (paramArr[0]+paramArr[1]).replace(/\s+/g, ' ');
		location.href = 'searchStore?'+newUrl;

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
	//pickArea.innerText=city+' '+t.innerText;
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
	var selectedTime= h+":"+m;
	
	checkParams(parameters.value, 'selectedTime',selectedTime);
}

function checkParams(paramValue, paramName, value) {
	var params = paramValue.split('&');
	var result = '';
	for (var i = 0; i < params.length; i++) {
		if (i > 0) {
			result += '&';
		}
		if (params[i].includes(paramName)) {
			
			if(paramName=='tagWord') {
				result+=params[i]+'%20'+value;
			} else {
				result += paramName + '=' + value;
			}
		} else {
			result += params[i];
		}
	}

	location.href='searchStore?'+result;
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
			time_paper.style.overflow='hidden';
		} else {
			time_paper.style.height = '100%';
			time_paper.style.overflow='auto';
		}
}

function resetThisTag(range) {
	if(range=='all') {
		console.log(range);
		location.href='/searchStore';
	} else {
		var url = document.getElementById('parameters').value;
		var tags = url.split('tagWord=')[1].split(' ');
		var newUrl = url.split('tagWord=')[0]+'tagWord=';
		for(var i=1; i<tags.length; i++) {
			if(tags[i].split(',')[0]!=range) {
				newUrl += ' '+tags[i];
			}
		}
		
		location.href='searchStore?'+newUrl;
	}
}

function viewStoreDetail(store_idx,selectedDate) {
	location.href='/user/storeInfo?store_idx='+store_idx+'&reserve_date='+selectedDate;
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


var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3
	//지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴




function panTo() {
	// 이동할 위도 경도 위치를 생성합니다 
	var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);

	// 지도 중심을 부드럽게 이동시킵니다
	// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	map.panTo(moveLatLon);
}

function zoomIn() {
	// 현재 지도의 레벨을 얻어옵니다
	var level = map.getLevel();

	// 지도를 1레벨 내립니다 (지도가 확대됩니다)
	map.setLevel(level - 1);

	// 지도 레벨을 표시합니다
	displayLevel();
}

function zoomOut() {
	// 현재 지도의 레벨을 얻어옵니다
	var level = map.getLevel();

	// 지도를 1레벨 올립니다 (지도가 축소됩니다)
	map.setLevel(level + 1);

	// 지도 레벨을 표시합니다
	displayLevel();
}

function displayLevel() {
	var levelEl = document.getElementById('maplevel');
	levelEl.innerHTML = '현재 지도 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
}

function getInfo() {
	// 지도의 현재 중심좌표를 얻어옵니다 
	var center = map.getCenter();

	// 지도의 현재 레벨을 얻어옵니다
	var level = map.getLevel();

	// 지도타입을 얻어옵니다
	var mapTypeId = map.getMapTypeId();

	// 지도의 현재 영역을 얻어옵니다 
	var bounds = map.getBounds();

	// 영역의 남서쪽 좌표를 얻어옵니다 
	var swLatLng = bounds.getSouthWest();

	// 영역의 북동쪽 좌표를 얻어옵니다 
	var neLatLng = bounds.getNorthEast();

	// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
	var boundsStr = bounds.toString();
}


function relayout() {

	// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
	// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
	// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
	map.relayout();
}

