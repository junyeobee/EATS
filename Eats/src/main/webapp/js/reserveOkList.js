

function selectThisList(reserve_idx) {
	var params = 'reserve_idx=' + reserve_idx;
	sendRequest('selectThisList', params, showSelectList, 'POST');
}

function showSelectList() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = XHR.responseText;
			var dList = JSON.parse(data).dList[0];

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
			+'<div class="detail-item"><span id="card-info" class="description">KB국민카드</span><span id="card-info-detail">'
			+'카드 번호</span></div><div class="detail-item"><span class="description">결제금액</span>'
			+'<span id="reserveCount-text">50,000원</span></div></div></div>';
		}
	}
}