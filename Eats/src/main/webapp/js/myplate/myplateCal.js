document.addEventListener('DOMContentLoaded', function() {
    const calendar = document.getElementById('calendar');
    const currentDate = new Date();
    let currentMonth = currentDate.getMonth();
    let currentYear = currentDate.getFullYear();

	// 날짜 형태를 2024-11-18에서 2024년 11월 18일로 변환
	function formatDate(dateStr) {
		const [year, month, day] = dateStr.split('-');
		return `${year}년 ${month}월 ${day}일`;
	}
	
	const dateArea=document.getElementById('selected_date');
	const today=`${currentYear}-${String(currentMonth+1).padStart(2, '0')}-${String(currentDate.getDate()).padStart(2, '0')}`;
	dateArea.textContent=formatDate(today);
	
    function generateCalendar(month, year) {
        const firstDay = new Date(year, month, 1);
        const lastDay = new Date(year, month + 1, 0);
        const startDay = firstDay.getDay();
        const totalDays = lastDay.getDate();

        let html = `
            <div class="calendar-header">
                <button id="prevMonth">&lt;</button>
                <h2>${year}년 ${month + 1}월</h2>
                <button id="nextMonth">&gt;</button>
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
                    const dateStr = `${year}-${String(month + 1).padStart(2, '0')}-${String(date).padStart(2, '0')}`;
                    
                    // 오늘 날짜인지 확인
                    const isToday = currentDateObj.getDate() === currentDate.getDate() &&
                                  currentDateObj.getMonth() === currentDate.getMonth() &&
                                  currentDateObj.getFullYear() === currentDate.getFullYear();

                    html += `<td class="selectable ${isToday ? 'selected' : ''}" ` +
                           `data-date="${dateStr}">${date}</td>`;
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

        // 날짜 선택
        document.querySelectorAll('.selectable').forEach(cell => {
            cell.addEventListener('click', function() {
                document.querySelectorAll('.selected').forEach(el => el.classList.remove('selected'));
                this.classList.add('selected');
                //선택된 날짜 = this.dataset.date
				
                //console.log('Selected date:', this.dataset.date);
				var dateArea=document.getElementById('selected_date');
				dateArea.textContent=formatDate(this.dataset.date);
				
				var param = 'date='+this.dataset.date;
				sendRequest('/user/myplate/getTodayList', param, showList, 'GET');
				
            });
        });

        // 이전/다음 월 버튼
        document.getElementById('prevMonth').addEventListener('click', () => {
            if (currentMonth === 0) {
                currentYear--;
                currentMonth = 11;
            } else {
                currentMonth--;
            }
            generateCalendar(currentMonth, currentYear);
        });

        document.getElementById('nextMonth').addEventListener('click', () => {
            if (currentMonth === 11) {
                currentYear++;
                currentMonth = 0;
            } else {
                currentMonth++;
            }
            generateCalendar(currentMonth, currentYear);
        });
    }

    generateCalendar(currentMonth, currentYear);
	sendRequest('/user/myplate/getTodayList', 'date='+today, showList, 'GET');
});

function showList(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			var jsondata = JSON.parse(data);
			
			makeList(jsondata);
		}
	}
}

function makeList(data){
	let rHtml='';
	if(data.reserveList.length==0){
		rHtml+='<p>예약 내역이 없습니다.</p>'
	}else{
		rHtml+='<ul class="cal-ul">'
		for(var i=0; i<data.reserveList.length; i++){
			var reserve=data.reserveList[i];
			rHtml+='<li class="cal-list-item">'+
				'<div class="img-wrapper"><img src="/img/storeUploadImg/'+reserve.store_img+'"></div>'
				+'<div>'
				+'<ul class="inner-ul">'
				+'<li>'+reserve.store_name+'</li>'
				+'<li>'+reserve.reserve_date+'</li>'
				+'<li>'+reserve.reserve_time+'</li>'
				+'<li>'+reserve.reserve_count+'명</li>'
				+'</ul>'
				+'</div></li>';
		}
		rHtml+='</ul>';
	}
	
	document.getElementById('reserve-list-box').innerHTML=rHtml;
	
	let aHtml='';
	if(data.alarmList.length==0){
		aHtml+='<p>신청 내역이 없습니다.</p>';
	}else{
		aHtml+='<ul class="cal-ul">'
		for(var i=0; i<data.alarmList.length; i++){
			var alarm=data.alarmList[i];
			aHtml+='<li class="cal-list-item">'+
				'<div class="img-wrapper"><img src="/img/storeUploadImg/'+alarm.store_img+'"></div>'
				+'<div>'
				+'<ul class="inner-ul">'
				+'<li>'+alarm.store_name+'</li>'
				+'<li>'+alarm.reserve_date+'</li>'
				+'<li>'+alarm.reserve_time+'</li>'
				+'<li>'+alarm.reserve_count+'명</li>'
				+'</ul>'
				+'</div></li>';
			}
		aHtml+='</ul>';
	}
	
	document.getElementById('alarm-list-box').innerHTML=aHtml;
}