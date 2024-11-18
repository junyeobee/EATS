document.addEventListener('DOMContentLoaded', function() {
const calendar = document.getElementById('calendar');
const currentDate = new Date();
let currentMonth = currentDate.getMonth();
let currentYear = currentDate.getFullYear();

let rundayStr = document.getElementById('runningDayList').value;
// 대괄호 제거하고 공백 정리
let rundayList = rundayStr.replace(/[\[\]]/g, '').split(',').map(day => day.trim());

const dayMapping = {
    '일': 0, '월': 1, '화': 2, '수': 3, '목': 4, '금': 5, '토': 6
};

const reserveData=document.getElementById('reserve_date').value;
let reserveDataObj=null;
if(reserveData){
	reserveDataObj = new Date(reserveData);
	
	currentMonth=reserveDataObj.getMonth();
	currentYear=reserveDataObj.getFullYear();
}

let activeDays = rundayList.map(day => dayMapping[day]);

function generateCalendar(month, year) {
   const firstDay = new Date(year, month, 1);
   const lastDay = new Date(year, month + 1, 0);
   const startDay = firstDay.getDay();
   const totalDays = lastDay.getDate();

   let html = `
   <div class="calendar-header">
   <button id="prevMonth" `+ (month === currentDate.getMonth() ? 'disabled' : '') +`>&lt;</button>
   <h2>` + year + '년 ' + (month + 1) + `월</h2>
   <button id="nextMonth" `+ (month >= currentDate.getMonth() + 1 ? 'disabled' : '') +`>&gt;</button>
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
			   
			   //예약 날짜와 현재 셀의 날짜가 같은지 확인
			   const isReserved = reserveDataObj &&
			   		reserveDataObj.getDate() === date &&
					reserveDataObj.getMonth() === month &&
					reserveDataObj.getFullYear() === year;
					
				const dateStr=`${year}-${String(month+1).padStart(2, '0')}-${String(date).padStart(2, '0')}`;

				html += `<td class="${isSelectable ? 'selectable' : 'disabled'} ${isReserved ? 'selected' : ''}" ` +
				                        `data-date="${dateStr}" ` +
				                        `${isDisabled ? 'disabled' : ''}>${date}</td>`;
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
           document.getElementById('reserve_date').value = selectedDate;
       });
   });
}

console.log('Current Year:', currentYear);
console.log('Current Month:', currentMonth);

generateCalendar(currentMonth, currentYear);
});