<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
    .review-container {
        width: 100%;
        margin-top: 80px;
        margin-left: 240px;
        padding: 20px;
    }
    
    .review-list {
        width: 90%;
        margin: 20px auto;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }
    
    .review-item {
        background: white;
        border: 1px solid #eee;
        border-radius: 8px;
        padding: 20px;
        cursor: pointer;
        transition: all 0.2s;
        width:80%;
    }
    
    .review-item:hover {
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    
    .review-header {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }
    
    .review-user {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    
    .user-icon {
        width: 40px;
        height: 40px;
        background: #f0f0f0;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    .review-meta {
        margin-left: auto;
        color: #666;
        font-size: 14px;
    }
    
    .review-content {
        margin: 10px 0;
    }
    
    .review-stars {
        color: #FFD700;
    }
    
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        z-index: 1000;
    }
    
    .modal-content {
        position: relative;
        background: #E5F3FF;
        width: 90%;
        max-width: 600px;
        margin: 50px auto;
        border-radius: 12px;
        padding: 20px;
        top:100px;
    }
    
    .modal-close {
        position: absolute;
        right: 20px;
        top: 20px;
        cursor: pointer;
        font-size: 24px;
    }
    
    .user-info {
        background: white;
        padding: 15px;
        border-radius: 8px;
        margin-bottom: 20px;
    }
    
    .rev-info{
        background: white;
        padding: 15px;
        border-radius: 8px;
        margin-bottom: 20px;
    }
    
    .review-tags {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin: 15px 0;
    }
    
    .tag {
        background: #e7f3ff;
        color: #1a73e8;
        padding: 4px 12px;
        border-radius: 16px;
        font-size: 14px;
    }
    
    .review-actions {
        display: flex;
        gap: 10px;
        margin-top: 20px;
    }
    
    .btn {
        padding: 8px 16px;
        border-radius: 6px;
        border: none;
        cursor: pointer;
        font-size: 14px;
        flex:1;
    }
    
    .btn-primary {
        background: #1a73e8;
        color: white;
    }
    
    .btn-outline {
        border: 1px solid #1a73e8;
        color: #1a73e8;
        background: white;
    }
    .del-modal-container{
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        z-index: 1000;
    }
    .delete-modal {
        position:absolute;
        top: 35%;
        left: 35%;
        background: white;
        padding: 20px;
        border-radius: 12px;
        width: 90%;
        max-width: 400px;
        z-index: 1100;
    }
    
    .delete-reason {
        margin: 20px 0;
    }
    
    .reason-option {
        display: flex;
        align-items: center;
        gap: 10px;
        margin: 10px 0;
    }
    
    .reason-input {
        width: 100%;
        padding: 8px;
        margin-top: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    #reviewMenu{
        font-weight:900;
    }
    #reviewContent {
        border:2px solid black;
        width:95%;
        min-height:80px;
        padding: 10px;
        border-radius: 3px;
    }
    .menuDiv{
        margin:10px;
        display: flex;
        color : #349FFB;
        font-weight: 600;
    }
    .menuDiv div{
        margin-right: 10px;
        border: 2px solid #349FFB;
        padding : 5px 10px;
        border-radius:15px;
    }
    .center{
        display: flex;
        align-items: center;
        text-align: center; 
        height:30px;
        color:#757575;
    }
    .material-icons{
        height:20px;
    }
</style>

<script src = "../js/ajaxJs.js"></script>
<script>
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var jsondata=JSON.parse(data);
			alert(jsondata.user_name);
		}
	}
}
function showDetail(i){
	var params='rev_idx='+i;
	sendRequest('/store/review/detail', params, showResult, 'get');
}
</script>
</head>
<body>
    <%@ include file="../store_Header.jsp" %>
    <%@ include file="../nav.jsp" %>
    
    <div class="review-container">
        <div class="review-list">
            <c:if test="${empty lists}">
                <div class="review-item">등록된 리뷰가 없습니다.</div>
            </c:if>
            <c:forEach items="${lists}" var="dto">
                <div class="review-item" onclick="showDetail(${dto.rev_idx})">
                    <div class="review-header">
                        <div class="review-user">
                            <div class="user-icon">
                                <i class="fas fa-user"></i>
                            </div>
                            <div>
                                <div>${dto.user_nickname}</div>
                                <div class="review-stars">
                                    <c:forEach begin="1" end="${dto.rev_score}">★</c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="review-meta">
                            ${dto.rev_writedate.split(" ")[0]}
                        </div>
                    </div>
                    <div class="review-content">
                        ${dto.rev_content}
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div id="reviewModal" class="modal">
        <div class="modal-content">
            <h3>방문 정보</h3>
            <div class="user-info">
                <div class = "user-description" id = "userName"></div>
                <div class = "user-description" id = "reserveInfo">
                <div class = "user-description" id = "reserveTime"></div>
                <div class = "user-description" id = "reserveClock"></div>
                <div class = "user-description" id = "reserveCnt"></div>
                <div class = "user-description" id = "reserveTable"></div>
                </div>
            </div>
            <div class = "rev-info">
	            <div id="reviewScore" class="review-stars"></div>
	            <div id="reviewContent" class="review-content"></div>
	            <div id="reviewTags" class="review-tags"></div>
	            <div id="reviewMenu"></div>
            </div>
            <div class="review-actions">
                <button class="btn btn-outline" onclick="closeModal('reviewModal')">닫기</button>
                <button class="btn btn-primary" onclick="openDeleteModal()">삭제 요청</button>
            </div>
        </div>
    </div>
    <div class ="del-modal-container" id = "deleteModal">
        <div id="d" class="delete-modal">
            <h3>리뷰 삭제 사유</h3>
            <div class="delete-reason">
                <div class="reason-option">
                    <input type="radio" name="deleteReason" id="reason1" value="부적절한 내용 포함">
                    <label for="reason1">부적절한 내용 포함</label>
                </div>
                <div class="reason-option">
                    <input type="radio" name="deleteReason" id="reason2" value="허위사실 및 비방">
                    <label for="reason2">허위사실 및 비방</label>
                </div>
                <div class="reason-option">
                    <input type="radio" name="deleteReason" id="reason3" value="가짜 리뷰 의심">
                    <label for="reason3">가짜 리뷰 의심</label>
                </div>
                <div class="reason-option">
                    <input type="radio" name="deleteReason" id="reason4" value="기타">
                    <label for="reason4">기타</label>
                </div>
                <textarea id="otherReason" class="reason-input" placeholder="기타 사유를 입력해주세요" style="display:none;"></textarea>
            </div>
            <div class="review-actions">
                <button class="btn btn-outline" onclick="closeModal('deleteModal')">취소</button>
                <button class="btn btn-primary" onclick="submitDeleteRequest()">제출하기</button>
            </div>
        </div>
    </div>
	<script src = "../js/ajaxJs.js"></script>
    <script>
        function showDetail(revIdx) {
            sendRequest('/store/review/detail', 'rev_idx=' + revIdx, function() {
                if (XHR.readyState == 4 && XHR.status == 200) {
                    const data = JSON.parse(XHR.responseText);
                    document.querySelector('.modal-content').dataset.reviewIdx = revIdx;
                    document.getElementById('userName').innerHTML = '<div class ="center"><span class="material-icons">account_circle</span>&nbsp;&nbsp;<span>'+data.user_name +' 고객님</span></div>';
                    document.getElementById('reserveTime').innerHTML = '<div class ="center"><span class="material-icons">calendar_month</span>&nbsp;&nbsp;<span>'+data.reserve_date+'</span></div>';
                    document.getElementById('reserveClock').innerHTML =  '<div class ="center"><span class="material-icons">schedule</span>&nbsp;&nbsp;<span>'+data.reserve_time+'</span></div>';
                    document.getElementById('reserveCnt').innerHTML =  '<div class ="center"><span class="material-icons">group</span>&nbsp;&nbsp;<span>'+data.reserve_count+"명</span><div>"
                    document.getElementById('reserveTable').innerHTML =  '<div class ="center"><span class="material-icons">table_bar</span>&nbsp;&nbsp;<span>'+data.sts_num + "번 테이블</span></div>";
                    
                    const stars = '★'.repeat(data.rev_score);
                    document.getElementById('reviewScore').textContent = stars;
                    
                    document.getElementById('reviewContent').textContent = data.rev_content;
                    
                    const tags = data.rev_tag.split(',');
                    const tagsHtml = tags.map(tag => '<span class="tag">'+tag.trim()+'</span>').join('');
                    document.getElementById('reviewTags').innerHTML = tagsHtml;

                    document.getElementById('reviewMenu').textContent = '주문메뉴';

                    let divTag = document.createElement('div');
                    divTag.setAttribute('class', 'menuDiv');
                    let rev_menu = data.rev_menu;
                    if(rev_menu.includes('/')) rev_menu = rev_menu.split('/');
                    for(let i = 0; i < rev_menu.length; i++){
                        let menu = rev_menu[i]
                        let menuDiv = document.createElement('div');
                        menuDiv.textContent = menu;
                        divTag.appendChild(menuDiv);
                    }
                    document.getElementById('reviewMenu').appendChild(divTag);
                    
                    openModal('reviewModal');
                }
            }, 'GET');
        }

        function openModal(modalId) {
            document.getElementById(modalId).style.display = 'block';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        function openDeleteModal() {
            closeModal('reviewModal');
            openModal('deleteModal');
        }

        function submitDeleteRequest() {
            const selectedReason = document.querySelector('input[name="deleteReason"]:checked');
            if (!selectedReason) {
                alert('삭제 사유를 선택해주세요.');
                return;
            }

            let reason = selectedReason.value;
            if (reason === '기타') {
                const otherReason = document.getElementById('otherReason').value;
                if (!otherReason.trim()) {
                    alert('기타 사유를 입력해주세요.');
                    return;
                }
                reason = otherReason;
            }

            const reviewIdx = document.querySelector('.modal-content').dataset.reviewIdx;
            
            sendRequest('/store/review/revDelreq', 'rev_idx=' + reviewIdx, function() {
                if (XHR.readyState == 4) {
                    if (XHR.status == 200) {
                        alert('리뷰 삭제 요청이 정상적으로 처리되었습니다.');
                        closeModal('deleteModal');
                    } else if (XHR.status == 204) {
                        alert('이미 삭제 요청된 리뷰입니다.');
                        closeModal('deleteModal');
                    } else {
                        alert('요청 처리 중 오류가 발생했습니다.');
                    }
                }
            }, 'GET');
        }

        document.querySelectorAll('input[name="deleteReason"]').forEach(radio => {
            radio.addEventListener('change', function() {
                const otherReason = document.getElementById('otherReason');
                otherReason.style.display = this.value === '기타' ? 'block' : 'none';
            });
        });

        window.onclick = function(event) {
            if (event.target.classList.contains('modal')) {
                closeModal(event.target.id);
            }
        }
    </script>
</body>
</html>