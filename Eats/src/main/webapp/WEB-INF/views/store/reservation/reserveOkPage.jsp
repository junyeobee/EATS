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
                            <div class="table-num">${table.table_num}번<span class="table-type">(${table.tableType})</span></div>
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
document.getElementById('reserveDate').addEventListener('change', selectDate(event));
document.getElementById('reserveTime').addEventListener('change', updateReservations);
function selectDate(e) {
    let date = document.getElementById('reserveDate').value;
    let xhr = new XMLHttpRequest();
    xhr.open('GET', '/store/reserveDateInTime?date=' + date);
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
            updateReservations();
        }
    };
}
function updateReservations() {
    var date = document.getElementById('reserveDate').value;
    var time = document.getElementById('reserveTime').value;
    
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/store/reservations?date=' + date + '&time=' + time);
    xhr.onload = function() {
        if (xhr.status === 200) {
            var data = JSON.parse(xhr.responseText);
            updateTableLayout(data.tables);
            updateReservationList(data.reservations);
        }
    };
    xhr.send();
}

function showReservationDetail(element) {
    var reserveIdx = element.getAttribute('data-reserve-idx');
}

function updateTableLayout(tables) {
    var grid = document.querySelector('.table-grid');
    var html = '';
    
    tables.forEach(function(table) {
        html += '<div class="table-item ' + 
                (table.stat == 1 ? 'none' : 'available') + 
                '" data-table-num="' + table.tableNum + 
                '" data-capacity="' + table.cnt + 
                '" data-type="' + table.tableType + '">' +
                '<span class="table-num">T' + table.tableNum + '</span>' +
                '<span class="capacity">' + table.cnt + '인석</span>' +
                '</div>';
    });
    
    grid.innerHTML = html;
}

function quickAssign(reserveIdx, guestCount) {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/store/quickAssign');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            updateReservations();
        }
    };
    xhr.send(JSON.stringify({
        reserveIdx: reserveIdx,
        guestCount: guestCount
    }));
}
</script>
</html>