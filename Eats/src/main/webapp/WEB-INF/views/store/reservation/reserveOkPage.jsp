<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
    #reserveTime input[type='select']:focus {
        outline: none;
        border-color: #4CAF50;
        box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.1);
    }
    #reserveTime input[type="date"]:hover {
        border-color: #4CAF50;
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
        display: flex;
        justify-content: space-between;
        align-items: center;
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
        display: flex;
        align-items: center;
    }
    
    .guest-info .name {
        font-weight: bold;
        font-size: 1.1em;
    }
    
    .guest-info .count {
        color: #666;
    }
    
    .reservation-info {
        display: flex;
        align-items: center;
        color: #757575;
        font-size: 14px;
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

    /* 드래그 중인 예약 카드 스타일 */
    .dragging {
        opacity: 0.5;
        background-color: #f0f0f0;
        border: 2px dashed #666;
    }

    /* 테이블 선택/하이라이트 스타일 */
    .table-card.highlighted {
        border: 3px solid #2196F3 !important;
        box-shadow: 0 0 10px rgba(2, 235, 138, 0.856);
    }

    .table-card.selected {
        background-color: #E3F2FD !important;
        border: 3px solid #1976D2 !important;
        transform: scale(1.02);
    }

    .table-card.available.dragover {
        background-color: #E8F5E9;
        border-color: #4CAF50;
    }

    .reservation-card.selected {
        background-color: #E3F2FD;
        border: 2px solid #2196F3;
        transform: translateX(5px);
        transition: all 0.2s ease;
    }

    /* 유효하지 않은 테이블 표시 */
    .table-card.invalid {
        opacity: 0.5;
        cursor: not-allowed;
        border-color: #ff0000 !important;
    }

    .table-card.available:hover {
        transform: scale(1.02);
        transition: all 0.2s ease;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    .quick-assign {
        padding: 6px 12px;
        background-color: #2196F3;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 13px;
        transition: all 0.2s ease;
    }

    .quick-assign:hover {
        background-color: #1976D2;
        transform: translateY(-1px);
    }

    .quick-assign:active {
        transform: translateY(1px);
    }
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.5);
        z-index: 1000;
    }

    .modal-content {
        position: relative;
        background-color: #fff;
        margin: 15% auto;
        padding: 20px;
        width: 500px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .modal-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 1px solid #eee;
    }

    .close-modal {
        font-size: 24px;
        font-weight: bold;
        cursor: pointer;
        color: #666;
    }

    .close-modal:hover {
        color: #333;
    }

    .detail-section {
        margin-bottom: 20px;
        padding: 15px;
        background-color: #f8f9fa;
        border-radius: 6px;
    }

    .detail-section h4 {
        margin-bottom: 15px;
        color: #2196F3;
    }

    .info-row {
        display: flex;
        margin-bottom: 10px;
        padding: 5px 0;
        align-items: center;
    }

    .info-label {
        flex: 0 0 100px;
        font-weight: bold;
        color: #757575;
        display: flex;
        align-items: center;
    }

    .info-value {
        flex: 1;
        color: #121212;
    }
    .reservation-card.assigned {
        background-color: #E3F2FD;
        border: 1px solid #90CAF9;
    }

    .assigned-tag {
        padding: 4px 8px;
        background-color: #4CAF50;
        color: white;
        border-radius: 4px;
        font-size: 12px;
    }
    .reload{
        padding: 6px 12px;
        background-color: #2196F3;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 13px;
        transition: all 0.2s ease;
    }
    .time{
        display: flex;
        align-items: center;
    }
    .tel{
        display: flex;
        align-items: center;
    }
    .name{
        display: flex;
        align-items: center;
    }
    .count{
        display: flex;
        align-items: center;
    }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file="../store_Header.jsp"%>
    <%@ include file="../nav.jsp"%>
    <!--<c:if test = "${empty sessionScope.storeIdx}">
        <script>
            alert('로그인이 필요합니다.');
            location.href = '/storeLogin';
        </script>
    </c:if>-->
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
                        <button class = "reload" onclick="updateReservations()">새로고침</button>
                    </div>
                </div>
                <div class="list-content">
                    <c:forEach var="rsv" items="${dto.lists}">
                        <div class="reservation-card ${rsv.reserve_state == 1 ? 'assigned' : ''}"
                            onclick="showReservationDetail(this)"
                            data-reserve-idx="${rsv.reserve_idx}"
                            data-guest-count="${rsv.reserve_count}"
                            data-user-name="${rsv.user_name}"
                            data-user-tel="${rsv.user_tel}"
                            data-reserve-time="${rsv.reserve_time}"
                            data-request="${rsv.request}">
                            <div class="guest-info">
                                <span class="name">${rsv.user_name}</span>
                                <span class="count">(${rsv.reserve_count}인)</span>
                            </div>
                            <div class="reservation-info">
                                <span class="time">${rsv.reserve_time}</span>
                                <span class="tel">${rsv.user_tel}</span>
                            </div>
                            <div class="action-buttons">
                                <c:if test="${rsv.reserve_state == 0}">
                                    <button class="quick-assign" onclick="quickAssign(${rsv.reserve_idx}, ${rsv.reserve_count})">빠른배치</button>
                                </c:if>
                                <c:if test="${rsv.reserve_state == 1}">
                                    <span class="assigned-tag">배정완료</span>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div id="reservationModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>예약 상세 정보</h3>
                <span class="close-modal">&times;</span>
            </div>
            <div class="modal-body">
                <div class="detail-section">
                    <h4>예약자 정보</h4>
                    <div class="info-row">
                        <div class="info-label"><span class="material-icons">person</span>&nbsp;예약자명</div>&nbsp;
                        <div class="info-value" id="modalUserName"></div>
                    </div>
                    <div class="info-row">
                        <div class="info-label"><span class="material-icons">phone</span>&nbsp;연락처</div>&nbsp;
                        <div class="info-value" id="modalUserTel"></div>
                    </div>
                </div>
                <div class="detail-section">
                    <h4>예약 정보</h4>
                    <div class="info-row">
                        <div class="info-label"><span class="material-icons">schedule</span>&nbsp;예약 시간</div>&nbsp;
                        <div class="info-value" id="modalReserveTime"></div>
                    </div>
                    <div class="info-row">
                        <div class="info-label"><span class="material-icons">group</span>&nbsp;인원</div>&nbsp;
                        <div class="info-value" id="modalGuestCount"></div>
                    </div>
                    <div class="info-row">
                        <div class="info-label"><span class="material-icons">list</span>&nbsp;요청사항</div>&nbsp;
                        <div class="info-value" id="modalRequest"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
document.addEventListener('DOMContentLoaded', function() {
    updateReservations();
});
document.getElementById('reserveDate').addEventListener('change', selectDate);
document.getElementById('reserveTime').addEventListener('change', updateReservations);
document.querySelector('.close-modal').onclick = function() {
    document.getElementById('reservationModal').style.display = 'none';
}

window.onclick = function(event) {
    var modal = document.getElementById('reservationModal');
    if (event.target == modal) {
        modal.style.display = 'none';
    }
}

function selectDate() {
    var date = document.getElementById('reserveDate').value;
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/reserveDateInTime?date=' + date);
    
    xhr.onload = function() {
        if (xhr.status === 200) {
            var data = JSON.parse(xhr.responseText);
            var timeSelect = document.getElementById('reserveTime');
            timeSelect.innerHTML = '';
            data.forEach(function(time) {
                var option = document.createElement('option');
                option.value = time;
                option.textContent = time;
                timeSelect.appendChild(option);
            });
            updateReservations();
        }
    };
    xhr.send();
}

function updateReservations() {
    var date = document.getElementById('reserveDate').value;
    var time = document.getElementById('reserveTime').value;
    
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/reservations?date=' + date + '&time=' + time);
    
    xhr.onload = function() {
        if (xhr.status === 200) {
            var data = JSON.parse(xhr.responseText);
            console.log(data.lists);
            updateReservationList(data.tables, data.lists);
            initTableAssignment();
        }
    };
    xhr.send();
}

function updateReservationList(tables, lists) {
    var grid = document.querySelector('.list-content');
    var reservationHtml = '';
    
    lists.forEach(function(list) {
        console.log(list.reserve_stat);
        var buttonHtml = list.reserve_state === 0 
        ? '<button onclick="event.stopPropagation(); quickAssign(' + list.reserve_idx + ',' + list.reserve_count + ')" class="quick-assign">빠른배치</button>'
        : '<span class="assigned-tag">배정완료</span>';

        reservationHtml += '<div class="reservation-card ' + (list.reserve_state === 1 ? 'assigned' : '') + '" ' +
            'onclick="showReservationDetail(this)" ' +
            'data-reserve-idx="' + list.reserve_idx + '" ' +
            'data-guest-count="' + list.reserve_count + '" ' +
            'data-user-name="' + list.user_name + '" ' +
            'data-user-tel="' + list.user_tel + '" ' +
            'data-reserve-time="' + list.reserve_time + '" ' +
            'data-request="' + (list.request || '') + '">' +
            '<div class="guest-info">' +
                '<span class="name">' + list.user_name + '</span>&nbsp;' +
                '<span class="count">(' + list.reserve_count + '인)</span>' +
            '</div>' +
            '<div class="reservation-info">' +
                '<span class="time"><span class="material-icons">schedule</span>&nbsp;' + list.reserve_time + '</span>' +
            '</div>' +
            '<div class="reservation-info">'+
                '<span class="tel"><span class="material-icons">phone</span>&nbsp;' + list.user_tel + '</span>' +
            '</div>' +
            '<div class="action-buttons">' + buttonHtml + '</div>' +
            '</div>';
    });
    grid.innerHTML = reservationHtml;

    var tableGrid = document.querySelector('.table-grid');
    var tableHtml = '';
    
    tables.forEach(function(table) {
        var isAvailable = (table.stat === -1 || table.stat === 0);
        tableHtml += '<div class="table-card ' + (isAvailable ? 'available' : 'none') + '" ' +
            'data-table-num="' + table.table_num + '" ' +
            'data-capacity="' + table.cnt + '" ' +
            'data-type="' + (table.tableType || '기본') + '">' +
            '<div class="table-num">' + table.table_num + '번' +
            '<span class="table-type">(' + (table.tableType || '기본') + ')</span></div>' +
            '<div class="table-info">' +
            '<span class="capacity">' + table.cnt + '인석</span>' +
            '</div>' +
            '<div><span class="status">' + (isAvailable ? '예약가능' : '예약됨') + '</span></div>' +
            '</div>';
    });
    tableGrid.innerHTML = tableHtml;
}
function showReservationDetail(element) {
    var modal = document.getElementById('reservationModal');
    document.getElementById('modalUserName').textContent = element.dataset.userName;
    document.getElementById('modalUserTel').textContent = element.dataset.userTel;
    document.getElementById('modalReserveTime').textContent = element.dataset.reserveTime;
    document.getElementById('modalGuestCount').textContent = element.dataset.guestCount + '인';
    document.getElementById('modalRequest').textContent = element.dataset.request || '없음';
    
    modal.style.display = 'block';
}
function handleDragOver(e) {
    e.preventDefault();
    var tableElement = e.currentTarget;
    var draggingCard = document.querySelector('.dragging');
    
    if (!draggingCard) return;
    
    var guestCount = parseInt(draggingCard.dataset.guestCount);

    removeAllHighlights();

    if (isValidTable(tableElement, guestCount)) {
        tableElement.classList.add('highlighted');
    } else {
        tableElement.classList.add('invalid');
    }
}

function removeAllHighlights() {
    document.querySelectorAll('.table-card').forEach(function(table) {
        table.classList.remove('highlighted', 'invalid');
    });
}

function initTableAssignment() {
    var reservationCards = document.querySelectorAll('.reservation-card');
    var availableTables = document.querySelectorAll('.table-card.available');
    
    reservationCards.forEach(function(card) {
        card.setAttribute('draggable', true);
        card.addEventListener('dragstart', handleDragStart);
        card.addEventListener('dragend', handleDragEnd);
    });
    
    availableTables.forEach(function(table) {
        table.addEventListener('dragover', handleDragOver);
        table.addEventListener('dragleave', function(e) {
            e.preventDefault();
            table.classList.remove('highlighted', 'invalid');
        });
        table.addEventListener('drop', handleDrop);
    });
}

function handleDragStart(e) {
    e.target.classList.add('dragging');
    e.dataTransfer.setData('reserveIdx', e.target.dataset.reserveIdx);
    e.dataTransfer.setData('guestCount', e.target.dataset.guestCount);
}

function handleDragEnd(e) {
    e.target.classList.remove('dragging');
}

function handleDrop(e) {
    e.preventDefault();
    var tableElement = e.target.closest('.table-card');
    var reserveIdx = e.dataTransfer.getData('reserveIdx');
    var guestCount = parseInt(e.dataTransfer.getData('guestCount'));
    
    if (isValidTable(tableElement, guestCount)) {
        assignTable(reserveIdx, tableElement.dataset.tableNum);
    } else {
        alert('해당 테이블에는 배치할 수 없습니다.');
    }
    removeAllHighlights();
}

function quickAssign(reserveIdx, guestCount) {
    var bestTable = findBestTable(guestCount);
    if (bestTable) {
        if (confirm('테이블 ' + bestTable + '번에 배치하시겠습니까?')) {
            assignTable(reserveIdx, bestTable);
        }
    } else {
        alert('적합한 테이블이 없습니다.');
    }
}

function findBestTable(guestCount) {
    var bestTable = null;
    var minCapacityDiff = Infinity;
    
    document.querySelectorAll('.table-card.available').forEach(function(table) {
        var capacity = parseInt(table.dataset.capacity);
        if (capacity >= guestCount) {
            var diff = capacity - guestCount;
            if (diff < minCapacityDiff) {
                minCapacityDiff = diff;
                bestTable = table.dataset.tableNum;
            }
        }
    });
    
    return bestTable;
}

function isValidTable(tableElement, guestCount) {
    if (!tableElement || !tableElement.classList.contains('available')) return false;
    return parseInt(tableElement.dataset.capacity) >= guestCount;
}

function assignTable(reserveIdx, tableNum) {
    console.log('Assigning table ' + tableNum + ' to reservation ' + reserveIdx);
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/assign?reserveIdx=' + reserveIdx + '&tableNum=' + tableNum);
    
    xhr.onload = function() {
        if (xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.result === 1) {
                alert('테이블이 배정되었습니다.');
                updateReservations();
            } else {
                alert('테이블 배정에 실패했습니다.');
            }
        } else {
            alert('서버 오류가 발생했습니다.');
        }
    };
    removeAllHighlights();
    xhr.send();
}
</script>
</html>