<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빈자리 알림 관리</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
<script>
    $('#datePicker')
       .datepicker({
          format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
          startDate: '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
          endDate: '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
          autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
          calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
          clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
          datesDisabled: ['2019-06-24', '2019-06-26'], //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
          daysOfWeekDisabled: [0, 6], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
          daysOfWeekHighlighted: [3], //강조 되어야 하는 요일 설정
          disableTouchKeyboard: false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
          immediateUpdates: false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
          multidate: false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
          multidateSeparator: ',', //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
          templates: {
             leftArrow: '&laquo;',
             rightArrow: '&raquo;',
          }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
          showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
          title: '테스트', //캘린더 상단에 보여주는 타이틀
          todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
          toggleActive: true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
          weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
          language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
       })
       .on('changeDate', function (e) {
       });
 </script>
</head>
<body>
    <%@ include file="../store_Header.jsp"%>
    <%@ include file="../nav.jsp"%>
    <div style="margin-left: 240px; margin-top: 80px; padding: 20px;">
        <div class="bin-alarm-wrapper">
            <!-- 왼쪽: 알림 설정 섹션 -->
            <div class="alarm-setting-section">
                <div class="setting-header">빈자리 알림 설정</div>
                <div class="setting-body">
                    <!-- 날짜/시간 선택 -->
                    <div class="date-time-area">
                        <div class="date-input-wrap">
                            <div class="label">날짜</div>
                            <input type="date" id="selectedDate" class="date-input"/>
                        </div>
                        <div class="time-input-wrap">
                            <div class="label">시간</div>
                            <select id="selectedTime" class="time-select">
                                <option value="">시간선택</option>
                            </select>
                        </div>
                    </div>
                    
                    <!-- 선택된 테이블 표시 영역 -->
                    <div class="table-select-area">
                        <div class="label">선택된 테이블</div>
                        <div class="selected-tables"></div>
                        <button class="add-table-btn" onclick="openTableModal()">
                            <span>+</span>
                        </button>
                    </div>
        
                    <!-- 알림 내용 작성 -->
                    <div class="mail-content-area">
                        <div class="label">알림 내용</div>
                        <textarea id="mailContent" placeholder="알림 내용을 작성하세요."></textarea>
                        <button onclick="sendAlarms()" class="send-btn">알림 발송</button>
                    </div>
                </div>
            </div>
        
            <!-- 오른쪽: 알림 신청자 목록 -->
            <div class="alarm-list-section">
                <div class="list-header">알림 신청자 목록</div>
                <div class="list-body">
                    <div id="alarmsList" class="alarms-list"></div>
                </div>
            </div>
        </div>
     
     <!-- 테이블 선택 모달 -->
     <div id="tableModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>테이블 선택</h3>
                <button onclick="closeTableModal()" class="close-btn">&times;</button>
            </div>
            <div class="modal-body">
                <div class="select-all-wrap">
                    <label>
                        <input type="checkbox" id="selectAllTables" onchange="toggleAllTables()">
                        전체 선택
                    </label>
                </div>
                <div id="tableList" class="table-list"></div>
            </div>
            <div class="modal-footer">
                <button onclick="confirmTableSelection()" class="confirm-btn">확인</button>
            </div>
        </div>
     </div>
     
     <style>
        /* 기본 레이아웃 */
        .bin-alarm-wrapper {
            display: flex;
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .alarm-setting-section,
        .alarm-list-section {
            flex: 1;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        
        .setting-header,
        .list-header {
            padding: 20px;
            font-size: 18px;
            font-weight: bold;
            border-bottom: 1px solid #eee;
        }
        
        .setting-body,
        .list-body {
            padding: 20px;
        }
        
        /* 입력 영역 공통 스타일 */
        .date-time-area,
        .table-select-area,
        .mail-content-area {
            margin-bottom: 20px;
        }
        
        .label {
            font-size: 14px;
            color: #666;
            margin-bottom: 8px;
        }
        
        /* 날짜/시간 선택 */
        .date-input-wrap,
        .time-input-wrap {
            margin-bottom: 15px;
        }
        
        .date-input,
        .time-select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        /* 테이블 선택 영역 */
        .selected-tables {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 10px;
            min-height: 40px;
            border: 1px solid #eee;
            border-radius: 4px;
            padding: 10px;
        }
        
        .table-tag {
            background: #e3f2fd;
            padding: 4px 12px;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .add-table-btn {
            width: 100%;
            padding: 8px;
            background: #f5f5f5;
            border: 1px dashed #ddd;
            border-radius: 4px;
            cursor: pointer;
        }
        
        /* 알림 내용 작성 영역 */
        #mailContent {
            width: 100%;
            min-height: 100px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
            resize: vertical;
        }
        
        .send-btn {
            width: 100%;
            padding: 12px;
            background: #1976d2;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
        /* 모달 관련 스타일 - 기존과 동일 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
        }
        
        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            width: 90%;
            max-width: 500px;
            border-radius: 8px;
        }
        
        /* 모달 내부 스타일 - 기존과 동일 */
        .modal-header,
        .modal-body,
        .modal-footer {
            padding: 15px 20px;
        }
        
        .modal-header {
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .modal-footer {
            border-top: 1px solid #eee;
            text-align: right;
        }
        
        /* 알림 신청자 목록 스타일 */
        .alarms-list {
            border: 1px solid #eee;
            border-radius: 4px;
        }
        
        .alarm-user {
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #eee;
        }
        
        .alarm-user:last-child {
            border-bottom: none;
        }
        
        /* 버튼 호버 효과 */
        .send-btn:hover,
        .add-table-btn:hover,
        .confirm-btn:hover {
            opacity: 0.9;
        }
        </style>

<script>
    document.addEventListener('DOMContentLoaded', function() {
       // 오늘 날짜로 초기화
       var today = new Date();
       var dateStr = today.getFullYear() + '-' + String(today.getMonth() + 1).padStart(2, '0') + '-' + String(today.getDate()).padStart(2, '0');
       document.getElementById('selectedDate').value = dateStr;
       
       // 선택된 날짜의 영업시간에 따른 시간 옵션 설정
       getTimeOptions(dateStr);
    });
    
    function getTimeOptions(date) {
       var xhr = new XMLHttpRequest();
       xhr.open('GET', '/reserveDateInTime?date=' + date, true);
       
       xhr.onreadystatechange = function() {
           if(xhr.readyState === 4 && xhr.status === 200) {
               var timeList = JSON.parse(xhr.responseText);
               var timeSelect = document.getElementById('selectedTime');
               timeSelect.innerHTML = '<option value="">시간선택</option>';
               
               if(timeList.length === 1 && timeList[0] === "휴무일입니다.") {
                   timeSelect.innerHTML = '<option value="">' + timeList[0] + '</option>';
                   return;
               }
               
               timeList.forEach(function(time) {
                   var option = document.createElement('option');
                   option.value = time;
                   option.textContent = time;
                   timeSelect.appendChild(option);
               });
               
               if(date === document.getElementById('selectedDate').value) {
                   var now = new Date();
                   var currentHour = now.getHours();
                   var currentMinute = now.getMinutes();
                   var roundedMinute = Math.ceil(currentMinute / 30) * 30;
                   if(roundedMinute === 60) {
                       currentHour++;
                       roundedMinute = 0;
                   }
                   var currentTime = String(currentHour).padStart(2, '0') + ':' + String(roundedMinute).padStart(2, '0');
                   
                   for(var i = 0; i < timeSelect.options.length; i++) {
                       if(timeSelect.options[i].value >= currentTime) {
                           timeSelect.selectedIndex = i;
                           break;
                       }
                   }
                   searchEmptyTables();
               }
           }
       };
       xhr.send();
    }
    
    document.getElementById('selectedDate').addEventListener('change', function() {
       getTimeOptions(this.value);
    });
    
    function searchEmptyTables() {
        var date = document.getElementById('selectedDate').value;
        var time = document.getElementById('selectedTime').value;
        
        // 유효성 검사
        if(!date || !time) {
            alert('날짜와 시간을 선택해주세요.');
            return;
        }
        
        // 2. /binTables로 GET 요청
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/binTables?date=' + date + '&time=' + time, true);
        
        xhr.onreadystatechange = function() {
            if(xhr.readyState === 4 && xhr.status === 200) {
                var tables = JSON.parse(xhr.responseText);
                displayEmptyTables(tables);
                getAlarms(date, time);
            }
        };
        xhr.send();
    }
    
    function displayEmptyTables(tables) {
        var container = document.querySelector('.selected-tables');
        container.innerHTML = '';

        tables.forEach(function(table) {
        var tableCard = document.createElement('div');
        tableCard.className = 'table-card';
        tableCard.onclick = function() { selectTable(this, table); };

        tableCard.innerHTML = 
            '<h4>테이블 ' + table.table_num + '</h4>' +
            '<p>수용인원: ' + table.sts_num + '명</p>';

        container.appendChild(tableCard);
        });
    }
    
    function getAlarms(date, time) {
       var xhr = new XMLHttpRequest();
       xhr.open('GET', '/alarms?date=' + date + '&time=' + time, true);
       
       xhr.onreadystatechange = function() {
           if(xhr.readyState === 4 && xhr.status === 200) {
               var alarms = JSON.parse(xhr.responseText);
               displayAlarms(alarms);
           }
       };
       
       xhr.send();
    }
    
    function displayAlarms(alarms) {
       var container = document.getElementById('alarmsList');
       container.innerHTML = '';
       
       alarms.forEach(function(alarm) {
           var alarmDiv = document.createElement('div');
           alarmDiv.className = 'alarm-user';
           
           alarmDiv.innerHTML = 
               '<div>' + alarm.user_name + ' - ' + alarm.alarm_count + '명</div>' +
               '<div>' + alarm.user_email + '</div>';
           
           container.appendChild(alarmDiv);
       });
    }
    
    function selectTable(element, table) {
       var selected = document.querySelector('.selected-table');
       if(selected) {
           selected.classList.remove('selected-table');
       }
       
       element.classList.add('selected-table');
       filterMatchingAlarms(table.sts_num);
    }
    
    function filterMatchingAlarms(capacity) {
       var alarmItems = document.querySelectorAll('.alarm-user');
       alarmItems.forEach(function(item) {
           var count = parseInt(item.textContent.split('명')[0].split('-')[1].trim());
           if(count <= capacity) {
               item.style.display = 'flex';
           } else {
               item.style.display = 'none';
           }
       });
    }
    
    document.getElementById('selectedTime').addEventListener('change', function() {
        var date = document.getElementById('selectedDate').value;
        var time = this.value;
        
        if(!date || !time) return;
        
        fetchAlarms(date, time);
    });

    function fetchAlarms(date, time) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/alarms?date=' + date + '&time=' + time, true);
        
        xhr.onreadystatechange = function() {
            if(xhr.readyState === 4 && xhr.status === 200) {
                var alarms = JSON.parse(xhr.responseText);
                displayAlarms(alarms);
            }
        };
        xhr.send();
    }

    function displayAlarms(alarms) {
        var container = document.getElementById('alarmsList');
        container.innerHTML = '';
        
        alarms.forEach(function(alarm) {
            var alarmDiv = document.createElement('div');
            alarmDiv.className = 'alarm-user';
            alarmDiv.innerHTML = 
                '<div class="alarm-info">' +
                    '<span>' + alarm.user_name + '</span> - ' +
                    '<span class="alarm-count">' + alarm.alarm_count + '명</span>' +
                '</div>' +
                '<div class="alarm-email">' + alarm.user_email + '</div>';
            container.appendChild(alarmDiv);
        });
    }

    function sendAlarms() {
    var content = document.getElementById('mailContent').value;
    var selectedTables = document.querySelectorAll('.table-tag');
    var alarmUsers = document.querySelectorAll('.alarm-user');
    
    if(selectedTables.length === 0) {
        alert('테이블을 선택해주세요.');
        return;
    }
    
    if(!content.trim()) {
        alert('알림 내용을 입력해주세요.');
        return;
    }

    // 선택된 모든 테이블의 수용인원 배열
    var tableCapacities = Array.from(selectedTables).map(table => 
        parseInt(table.dataset.capacity)
    );

    // 수용인원이 같거나 작은 알림 신청자들의 이메일 수집
    var targetEmails = Array.from(alarmUsers)
        .filter(user => {
            // 신청 인원수 파싱
            var countText = user.querySelector('div').textContent;
            var requestCount = parseInt(countText.split('명')[0].split('-')[1].trim());
            // 신청 인원수가 테이블 수용인원 중 하나라도 작거나 같으면 true
            return tableCapacities.some(capacity => requestCount <= capacity);
        })
        .map(user => user.querySelector('div:last-child').textContent.trim());

    if(targetEmails.length === 0) {
        alert('선택된 테이블에 맞는 알림 신청자가 없습니다.');
        return;
    }

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/sendAlarms', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    
    var data = {
        userEmails: targetEmails,
        content: content
    };
    
    xhr.onreadystatechange = function() {
        if(xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            if(response.success) {
                alert('알림이 발송되었습니다.');
                document.getElementById('mailContent').value = '';
                document.querySelector('.selected-tables').innerHTML = '';
            } else {
                alert('알림 발송에 실패했습니다.');
            }
        }
    };
    
    xhr.send(JSON.stringify(data));
}

    function openTableModal() {
        var date = document.getElementById('selectedDate').value;
        var time = document.getElementById('selectedTime').value;
        
        if(!date || !time) {
            alert('날짜와 시간을 먼저 선택해주세요.');
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/binTables?date=' + date + '&time=' + time, true);
        
        xhr.onreadystatechange = function() {
            if(xhr.readyState === 4 && xhr.status === 200) {
                var tables = JSON.parse(xhr.responseText);
                displayTableList(tables);
                var modal = document.getElementById('tableModal');
                modal.style.display = 'block';
            }
        };
        
        xhr.send();
    }

    function closeTableModal() {
       var modal = document.getElementById('tableModal');
       modal.style.display = 'none';
    }

    function toggleAllTables() {
       var allCheckbox = document.getElementById('selectAllTables');
       var tableCheckboxes = document.querySelectorAll('.table-checkbox');
       
       tableCheckboxes.forEach(function(checkbox) {
           checkbox.checked = allCheckbox.checked;
       });
    }

    function confirmTableSelection() {
        var selectedTables = document.querySelectorAll('.table-checkbox:checked');
        var selectedTablesDiv = document.querySelector('.selected-tables');
        selectedTablesDiv.innerHTML = '';
        
        selectedTables.forEach(function(checkbox) {
            var tableTag = document.createElement('div');
            tableTag.className = 'table-tag';
            // 여기서 data-capacity 속성을 추가해야 합니다
            tableTag.dataset.capacity = checkbox.dataset.capacity;
            tableTag.textContent = checkbox.dataset.table_num + '번 테이블';
            selectedTablesDiv.appendChild(tableTag);
        });
        
        closeTableModal();
    }
    function displayTableList(tables) {
        var container = document.getElementById('tableList');
        container.innerHTML = '';
        
        tables.forEach(function(table) {
            var tableItem = document.createElement('div');
            tableItem.className = 'table-item';
            
            var label = document.createElement('label');
            label.style.display = 'flex';
            label.style.alignItems = 'center';
            label.style.padding = '10px';
            label.style.border = '1px solid #ddd';
            label.style.borderRadius = '4px';

            var checkbox = document.createElement('input');
            checkbox.type = 'checkbox';
            checkbox.className = 'table-checkbox';
            checkbox.dataset.table_num = table.table_num;
            checkbox.dataset.capacity = table.sts_num;

            var infoDiv = document.createElement('div');
            infoDiv.style.marginLeft = '10px';

            var tableNumDiv = document.createElement('div');
            tableNumDiv.textContent = '테이블 ' + table.table_num;

            var capacityDiv = document.createElement('div');
            capacityDiv.style.fontSize = '12px';
            capacityDiv.style.color = '#666';
            capacityDiv.textContent = '몇명?: ' + table.sts_num + '명';

            infoDiv.appendChild(tableNumDiv);
            infoDiv.appendChild(capacityDiv);
            label.appendChild(checkbox);
            label.appendChild(infoDiv);
            tableItem.appendChild(label);
            container.appendChild(tableItem);
        });
    }

    window.onclick = function(event) {
        var modal = document.getElementById('tableModal');
        if (event.target == modal) {
            closeTableModal();
        }
    }
</script>
</body>
</html>