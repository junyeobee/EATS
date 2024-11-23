<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
    .reservation-container {
        padding: 20px;
        font-family: 'Noto Sans KR', sans-serif;
        margin-left: 240px;
        margin-top: 100px;
        height: calc(100vh - 100px); 
    }
    
    .date-time-select {
        display: flex;
        gap: 10px;
        margin-bottom: 20px;
        padding: 10px;
        background: #fff;
        border-radius: 8px;
    }

    .date-select input[type="date"] {
        -webkit-appearance: none;
        appearance: none;
        
        padding: 8px 12px;
        width: 200px;
        
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        
        font-family: 'Noto Sans KR', sans-serif;
        font-size: 14px;
        
        background-color: white;
    
        cursor: pointer;
    }

    .date-select input[type="date"]::-webkit-calendar-picker-indicator {
        background-image: url('data:image/svg+xml;utf8,<svg fill="black" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
        background-position: center;
        background-size: contain;
        opacity: 1;
        cursor: pointer;
        width: 20px;
        height: 20px;
    }

    #reserveTime {
        padding: 8px 12px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        width: 100px;
        background: #fff;
    }
    #reserveTime option {
        padding: 8px 12px;
        font-size: 14px;
    }
    #reserveTime option:hover {
        background-color: #f5f5f5;
    }
    #reserveTime option:checked {
        background-color: #f0f0f0;
    }
    #reserveTime option:focus {
        outline: none;
        background-color: #f0f0f0;
    }
    #reserveTime:focus {
        outline: none;
        border-color: #4CAF50;
        box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.1);
    }
    #reserveTime:hover {
        border-color: #111;
    }

    .date-select input[type="date"]:focus {
        outline: none;
        border-color: #4CAF50;
        box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.1);
    }

    .date-select input[type="date"]:hover {
        border-color: #4CAF50;
    }

    .time-select select {
        padding: 8px 12px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        width: 100px;
        background: #fff;
    }
    
    .main-content {
        display: flex;
        gap: 20px;
        height: calc(100% - 80px);
    }
    .table-layout {
        flex: 0.7;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        display: flex;
        flex-direction: column;
    }

    .table-grid-container {
        flex: 1;
        overflow-y: auto;
        overflow-x: hidden;
    }

    .table-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 20px;
        padding: 15px;
    }

    .table-card {
        border-radius: 25px;
        padding: 20px;
        min-height: 80px;
        display: flex;
        flex-direction: column;
        border: 2px solid;
    }

    .table-card.available {
        background-color: #E8F5E9;
        border-color: #81C784;
    }

    .table-card.none {
        background-color: #FFEBEE;
        border-color: #E57373;
    }

    .table-num {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 8px;
    }

    .table-type {
        font-weight: normal;
        margin-left: 5px;
    }

    .table-info {
        margin: 5px 0;
    }

    .capacity {
        font-size: 16px;
    }

    .status {
        padding: 5px 10px;
        border-radius: 15px;
        background-color: white;
        font-size: 14px;
        display: inline-block;
        margin-top: 8px;
    }

    .available .status {
        color: #2E7D32;
    }

    .none .status {
        color: #C62828;
    }
    
    .reservation-list {
        flex: 0.3;
        border: 1px solid #ddd;
        border-radius: 8px;
        overflow: hidden;
    }
    
    .list-header {
        padding: 20px;
        border-bottom: 1px solid #ddd;
    }
    
    .list-content {
        height: calc(100% - 70px);
        overflow-y: auto;
        padding: 15px;
    }
    
    .reservation-card {
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 8px;
        margin-bottom: 10px;
        cursor: pointer;
        transition: 0.3s;
    }
    
    .reservation-card:hover {
        background-color: #f5f5f5;
    }
    
    .guest-info {
        margin-bottom: 5px;
    }
    
    .guest-info .name {
        font-weight: bold;
        font-size: 1.1em;
    }
    
    .guest-info .count {
        color: #666;
    }
    
    .reservation-info {
        color: #666;
        font-size: 0.9em;
    }

    .action-buttons {
        margin-top: 10px;
        text-align: right;
    }

    .quick-assign {
        padding: 5px 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 12px;
    }

    .quick-assign:hover {
        background-color: #45a049;
    }
    
    @media (max-width: 1024px) {
        .main-content {
            flex-direction: column;
        }
    }
    </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file="../store_Header.jsp"%>
    <%@ include file="../nav.jsp"%>
	<div class="reservation-container">
        <div class="date-time-select">
            <div class="date-select">
                <input type="date" id="reserveDate" value="${today}" min="${today}" max="${maxDate}">
            </div>
            
            <div class="time-select">
                <select id="reserveTime">
                    <c:forEach var="time" items="${timeList}">
                        <option value="${time}" ${time eq currentTime ? 'selected' : ''}>${time}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
    
        <div class="main-content">
            <div class="table-layout">
                <h3>테이블 현황</h3>
                <div class="table-grid-container">
                <div class="table-grid">
                    <c:forEach var="table" items="${dto.tables}">
                        <div class="table-card ${table.stat == 1 ? 'none' : 'available'}" 
                             data-table-num="${table.table_num}">
                            <div class="table-num">${table.table_num}번<span class="table-type">(${table.tableType==null?'기본':table.tableType})</span></div>
                            <div class="table-info">
                                <span class="capacity">${table.cnt}인석</span>
                            </div>
                            <div>
                                <span class="status">${table.stat == -1 ? '예약가능' : '예약됨'}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                </div>
            </div>
    
            <div class="reservation-list">
                <div class="list-header">
                    <h3>예약 현황</h3>
                    <div>

                    </div>
                </div>
                <div class="list-content">
                    <c:forEach var="rsv" items="${dto.lists}">
                        <div class="reservation-card">
                            <div class="guest-info">
                                <span class="name">${rsv.user_name}</span>
                                <span class="count">(${rsv.reserve_count}인)</span>
                            </div>
                            <div class="reservation-info">
                                <span class="time">${rsv.reserve_time}</span>
                                <span class="tel">${rsv.user_tel}</span>
                            </div>
                            <div class="action-buttons">
                                <button class="quick-assign" onclick="quickAssign(${rsv.reserve_idx}, ${rsv.reserve_count})">빠른배치</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
document.getElementById('reserveDate').addEventListener('change', selectDate);
document.getElementById('reserveTime').addEventListener('change', updateReservations);
//일자 선택, 일자 선택하면 해당 날짜의 예약 가능한 시간대들이 들어감
function selectDate() {
    let date = document.getElementById('reserveDate').value;
    let xhr = new XMLHttpRequest();
    xhr.open('GET', '/reserveDateInTime?date=' + date);
    xhr.onload = function() {
        if (xhr.status === 200) {
            let data = JSON.parse(xhr.responseText);
            let timeSelect = document.getElementById('reserveTime');
            timeSelect.innerHTML = '';
            data.forEach(function(time) {
                let option = document.createElement('option');
                option.value = time;
                option.innerText = time;
                timeSelect.appendChild(option);
            });
        } else {
            console.error(xhr.status);
        }
    };
    xhr.onerror = function() {
        console.error('집가고싶다..');
    };
    xhr.send();
}

//날짜,시간 선택시 예약정보를 불러오는 메소드
function updateReservations() {
    let date = document.getElementById('reserveDate').value;
    let time = document.getElementById('reserveTime').value;
    
    let xhr = new XMLHttpRequest();
    xhr.open('GET', '/reservations?date=' + date + '&time=' + time);
    xhr.onload = function() {
        if (xhr.status === 200) {
            const data = JSON.parse(xhr.responseText);
            const tables = data.tables;
            const lists = data.lists;
            updateReservationList(tables, lists);
        }
        else if(xhr.status == 400){
            alert('예약 정보를 불러오는데 실패했습니다.');
        }
        else if(xhr.status == 404){
            alert('잘못된 요청입니다.');
        }
    };
    xhr.send();
}
//모달창오픈, 예약신청자 정보 받아옴(예약 신청자 div를 클릭 시 오픈, 해당 예약자의 정보 출력)
function showReservationDetail(element) {
    let reserveIdx = element.getAttribute('data-reserve-idx');
    
}
//예약 정보를 불러오는 메소드, 시간대까지 선택했다면, 해당 시간대의 예약요청목록 출력
function updateReservationList(tables, lists) {
    let grid = document.querySelector('.list-content');
    let html = '';
    let tableGrid = document.querySelector('.table-grid');
    lists.forEach(function(list) {
        if(list.reserve_state === 0){
            html += `
                <div class="reservation-card">
                    <div class="guest-info">
                        <span class="name">`+list.user_name+`</span>
                        <span class="count">(`+list.reserve_count+`인)</span>
                    </div>
                    <div class="reservation-info">
                        <span class="time">`+list.reserve_time+`</span>
                        <span class="tel">`+list.user_tel+`</span>
                    </div>
                    <div class="action-buttons">
                        <button class="quick-assign" onclick="quickAssign("`+list.reserve_idx+`","`+list.reserve_count+`">빠른배치</button>
                    </div>
                </div>
            `;
        }
    });
    grid.innerHTML = html;
    html = '';
    tables.forEach(function(table) {
        let status = (table.stat === -1 || table.stat === 0) ? '예약가능' : '예약됨';
        let cardClass = (table.stat === -1 || table.stat === 0) ? 'available' : 'none';
        let type = table.tableType === null? '기본' : table.tableType;
        html += `
            <div class="table-card `+cardClass+`" data-table-num="`+table.table_num+`">
                <div class="table-num">`+table.table_num+`번<span class="table-type">(`+type+`)</span></div>
                <div class="table-info">
                    <span class="capacity">`+table.cnt+`인석</span>
                </div>
                <div>
                    <span class="status">`+status+`</span>
                </div>
            </div>
        `;
    });
    tableGrid.innerHTML = html;
    
}
//테이블 선택 메소드
function selectTable(reserveIdx, guestCount){
    //예약자를 테이블에 배치하는 메소드. 드롭다운 or 선택해서 넣기
    //요청사항에 테이블타입이 있다면, 해당 테이블이 하이라이트 등 표시가됨.
    //없다면 기본 테이블타입이 활성화
}
//예약자 빠른 배치 메소드.
function quickAssign(reserveIdx, guestCount) {
    //체크박스가 체크된 목록들(예약자)를 빠른배치하는 기능
    //요청사항에 테이블타입이 있다면, 해당 테이블로 자동배치(최대인원이 맞는 테이블).
    //없다면 기본테이블부터 배치(최대인원이 맞는 테이블)
    
}
</script>
</html>