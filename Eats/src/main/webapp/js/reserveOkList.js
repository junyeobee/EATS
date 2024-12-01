var calendar_container = document.getElementById('calendar_container');

function selectThisList(reserve_idx) {
	console.log(reserve_idx);
	var params = 'reserve_idx=' + reserve_idx;
	sendRequest('selectThisList', params, showSelectList, 'POST');
}

function showSelectList() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = XHR.responseText;
			var dList = JSON.parse(data).dList[0];
			console.log(JSON.parse(data).dList);
			var state ='';
			var st_class='';
			if (dList.reserve_state==0){
				state='승인 대기';
				st_class='st_ready';
			} else if (dList.reserve_state==1){
				state='승인됨';
				st_class='st_apply';
			} else if (dList.reserve_state==2) {
				state='취소됨';
				st_class='st_cancel';
			} else if (dList.reserve_state==3) {
				state='방문 완료';
				st_class='st_visit';
			} else if (dList.reserve_state==4) {
				state='노쇼';
				st_class='st_noshow';
			}
			
			var reqmsg ='요청사항 없음';
			if(dList.request!=null && dList.request!=''){
				reqmsg=dList.request;
			}
			
			var pbox = document.getElementById('reserve_details');
			pbox.innerHTML='';
			pbox.innerHTML = '<div class="detail-section"><h3>고객 정보</h3>'+
			'<div class="detail-grid"><div class="detail-item"><span class="description">성함</span>'
			+'<span>'+dList.user_name+'</span></div><div class="detail-item">'
			+'<span class="description">연락처</span><span id="reserve-Tel">'+dList.user_tel+'</span>'
			+'</div></div></div><div class="detail-section"><h3>예약 정보</h3><div class="detail-grid">'
			+'<div class="detail-item"><span class="description">날짜/시간</span><span id="time-text">'
			+dList.reserve_date+' '+dList.reserve_time+'</span></div><div class="detail-item">'
			+'<span class="description">인원</span> <span id="totalCnt">'+dList.reserve_count+'명</span>'
			+'</div><div class="detail-item"><span class="description">상태</span><span class="status-tag '+st_class+'">'+state+'</span>'
			+'</div><div class="detail-item"><span class="description">테이블</span><span id="tableNum">'+dList.table_num+'번'
			+'테이블<span id="tableType">('+dList.cate_value_name+')</span></span></div></div>'
			+'<div class="detail-section"><h4>요청 사항</h4><div class="request-section"><span id="request-text">'
			+reqmsg+'</span></div></div></div><div class="detail-section"><h3>결제 정보</h3><div class="detail-grid">'
			+'<div class="detail-item"><span id="card-info" class="description">결제 방법</span><span id="card-info-detail">'
			+'카드 결제'+'</span></div><div class="detail-item"><span class="description">결제금액</span>'
			+'<span id="reserveCount-text">'+dList.pay_price+'원</span></div></div></div>';
		}
	}
}

var search_btn = document.getElementById('search_button');
var search = document.getElementById('search_text');
var paramDate =document.getElementById('selected_date').innerText;
paramDate = paramDate=='날짜선택'?'':paramDate;

search_btn.addEventListener('click', function() {
	location.href='/store/reserveOkListPage?searching='+search.value
	+'&selectedDate='+paramDate;;
});
search.addEventListener('keyup', function(e) {
	if(e.keyCode == 13) {
		location.href='/store/reserveOkListPage?searching='+search.value
		+'&selectedDate='+paramDate;
	}
});

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

					html += '<td class="selectable" data-date="'
					+ year + '-' + String(month + 1).padStart(2, '0') + '-' + String(date).padStart(2, '0') +
					'" selectable>' +date +'</td>';
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

				location.href='reserveOkListPage?searching='+search.value+'&selectedDate='+selectedDate;
			});
		});
	}

	generateCalendar(currentMonth, currentYear);
});

function openCalendar() {
	if(calendar_container.style.display=="block"){
		calendar_container.style.display="none";
	} else {
		calendar_container.style.display="block";
	}

}