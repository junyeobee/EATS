<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* calendar.css */
.calendar-wrap {
    width: 300px;
    margin: 20px auto;
    font-family: Arial, sans-serif;
}

.calendar-wrap .calendar-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

.calendar-wrap .calendar-header button {
	padding: 5px 10px;
    cursor: pointer;
    background-color: #ff533e;
    border-radius: 5px;
    border: 0;
    color: white;
}

.calendar-wrap .calendar-header button:disabled {
    opacity: 0.5;
    cursor: not-allowed;
}

.calendar-wrap table {
    width: 100%;
    border-collapse: collapse;
}

.calendar-wrap th, td {
    padding: 12px 4px;
    text-align: center;
    border: 0;
}

.calendar-wrap th {
    /* background-color: #f5f5f5; */
}

.calendar-wrap td{
	border-radius:50%;
}

.calendar-wrap .disabled {
    color: #ccc;
    cursor: not-allowed;
}

.calendar-wrap .selectable {
    cursor: pointer;
}

.calendar-wrap .selectable:hover {
    background-color: #ff533e;
    color:#fefefe;
    opacity:0.8;
}

.calendar-wrap .selected {
    background-color: #ff533e; 
    color: white;
}
</style>
</head>
<body>
<div class="calendar-wrap">
        <div id="calendar"></div>
        <form id="reservationForm">
            <input type="hidden" id="selectedDate" name="selectedDate">
            <!-- 다른 예약 관련 입력 필드들 -->
        </form>
    </div>
</body>
<script>

//calendar.js
document.addEventListener('DOMContentLoaded', function() {
    const calendar = document.getElementById('calendar');
    const currentDate = new Date();
    let currentMonth = currentDate.getMonth();
    let currentYear = currentDate.getFullYear();
    
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
                    
                    const isDisabled = currentDateObj < today;
                    const isSelectable = !isDisabled;
                    
                    // 여기도 EL 구문 충돌 방지를 위해 수정
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
        
        // 이벤트 리스너 등록
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
        
        // 날짜 선택 이벤트
        document.querySelectorAll('.selectable').forEach(cell => {
            cell.addEventListener('click', function() {
                document.querySelectorAll('.selected').forEach(el => el.classList.remove('selected'));
                this.classList.add('selected');
                const selectedDate = this.dataset.date;
                document.getElementById('selectedDate').value = selectedDate;
            });
        });
    }
    
    console.log('Current Year:', currentYear);
    console.log('Current Month:', currentMonth);
    
    generateCalendar(currentMonth, currentYear);
});
</script>
</html>