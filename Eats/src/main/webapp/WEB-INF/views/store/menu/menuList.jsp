<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="../store_Header.jsp"%>
		<%@ include file="../nav.jsp"%>
<title>메뉴 수정</title>

<style>



body {
	margin: 0;
	padding: 0;
	background-color: #f8f9fa;
	padding: 2rem;
}

	.dashboard-container {
			width:100%;
			margin-left: 280px;
			margin-top: 64px;
			padding: 32px;
		/* 	background-color: #eff9ff; */
		}

.menu-header {
	margin-bottom: 2rem;
}

.menu-title {
	font-size: 1.5rem;
	font-weight: 700;
	margin-bottom: 1rem;
}

.tab-group {
	display: flex;
	gap: 0.5rem;
	margin-bottom: 2rem;
}

.tab {
	padding: 0.5rem 1rem;
	border-radius: 20px;
	font-size: 0.9rem;
	cursor: pointer;
	background: none;
	border: 2px solid #349FFB;
	color: #349FFB;
}

.tab.active {
	background-color: #349FFB;
	color: white;
}

.menu-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(190px, 1fr));
    row-gap: 1.6rem; /* 행 간격 */
    column-gap: 2rem; /* 열 간격 */
    margin-bottom: 2rem;
}

.menu-item {
	position: relative;
	border-radius: 12px;
	overflow: hidden;
	background: white;
	border: 2px solid transparent;
	cursor: pointer;
	transition: all 0.2s ease;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.menu-item.selected {
	border-color: #349FFB;
}

.menu-item:hover .edit-button {
	opacity: 1;
}

.menu-image {
	width: 100%;
	aspect-ratio: 1;
	object-fit: cover;
}

.menu-info {
	padding: 1rem;
}

.menu-name {
	font-size: 0.95rem;
	font-weight: 500;
	margin-bottom: 0.25rem;
}

.menu-description {
	font-size: 14px;
	color: #666;
	margin-bottom: 0.5rem;
}

.menu-price {
	font-weight: 700;
	color: #333;
}

.edit-button {
	position: absolute;
	top: 0.5rem;
	right: 0.5rem;
	background-color: #349FFB;
	color: white;
	border: none;
	padding: 0.3rem 0.8rem;
	border-radius: 4px;
	font-size: 0.8rem;
	opacity: 0;
	transition: opacity 0.2s ease;
}

.delete-button {
	background-color: #ccc;
	color: black;
	border: none;
	padding: 0.3rem 0.8rem;
	border-radius: 4px;
	font-size: 14px;
	transition: opacity 0.2s ease;
}

.add-button {
	background-color: #349FFB;
	color: white;
	border: none;
	padding: 0.3rem 0.8rem;
	border-radius: 4px;
	font-size: 14px;
	transition: opacity 0.2s ease;
}

.pagination {
	display: flex;
	justify-content: center;
	gap: 0.5rem;
	margin-top: 2rem;
}

.page-number {
	width: 30px;
	height: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 1px solid #ddd;
	border-radius: 4px;
	cursor: pointer;
	font-size: 0.9rem;
}

.page-number:hover {
	background-color: #f0f0f0;
}

.page-number.active {
	background-color: #349FFB;
	color: white;
	border-color: #349FFB;
}
h2{width:300px;}

p{
color:#F3553C;
font-size:12px;

}
form{

width:100%;
position:absolute;
}
.bt_wrap{
width:300px;
height:50px;
position: relative;
right:0;

}
.menu_wrap{
width:1400px;

overflow: hidden;

}
</style>
</head>

<body>
<div class="dashboard-container">
	<!-- 카테고리 출력 -->
	<p style='color:gray;' ><c:out value="${sessionScope.storeName }"></c:out></p>
	<div class="menu-header category-tabs">
	
		<h1 class="menu-title">메뉴 관리</h1>
		<c:if test="${empty lists }">
			<div class="tab-group">
				<button class="tab active">전체</button>
			</div>
		</c:if>

		 <div class="tab-group">
        <button class="tab active" onclick="loadMenu('0'); setActiveTab(this)">전체</button>
        <c:forEach var="dto" items="${lists}">
            <button class="tab" id="${dto.m_cate_idx}" onclick="loadMenu('${dto.m_cate_idx}'); setActiveTab(this)">${dto.m_cate_name}</button>
        </c:forEach>
    </div>
	</div>




	<!-- 메뉴 출력 -->

	<form name="deleteMenu" action="deleteMenu" method="post">
		<div class="bt_wrap">
		<input type="button" value="선택삭제" class="delete-button" onclick="submitSelectedMenus();">
		<input type="button" value="등록하기" class="add-button" onclick="location.href='StoreMenuInsert'"> 
		
		</div>
		<div class="menu_wrap">
		<div class="menu-grid" id="menuList">
			<!-- 메뉴 아이템 반복 -->
			<c:if test="${empty menu }">
				<h2>등록된 메뉴가 없습니다.</h2>
			</c:if>

			<c:forEach var="menu" items="${menu}">
				<div class="menu-item" data-menu-idx="${menu.menu_idx}"
					onclick="toggleMenuSelection(this.dataset.menuIdx);">
					<img src="../img/menu/${menu.menu_img}" alt="메뉴" class="menu-image">

					<input type="button" class="edit-button" value="수정" onclick="location.href='/menuUpdatePage/${menu.menu_idx}'">
					<div class="menu-info">
						<c:if test="${menu.menu_preorder == 2}">
							<p>선주문</p>
						</c:if>
						<c:if test="${menu.menu_preorder != 2}">
							<p>일반 주문</p>
						</c:if>
						<div class="menu-name">${menu.menu_name}</div>
						<div class="menu-description">${menu.menu_info }</div>
						<div class="menu-price">${menu.menu_price }</div>
					</div>
				</div>
				<input type="hidden" name="menu_idx" value="${menu.menu_idx }">
			</c:forEach>
		</div>
		</div>
	
	</form>


	<div class="pagination"></div>
	</div>
</body>

<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function loadMenu(idx){
	var params='idx='+idx;
	sendRequest('menuListAjax', params, showSendResult, 'GET');
}
function showSendResult(){
	var menuList = document.getElementById('menuList');
	
	
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var jsondata = JSON.parse(data);
			menuList.innerHTML='';
			
			
			
			if(Array.isArray(jsondata) && jsondata.length > 0){
			  jsondata.forEach( (menu) => {
				     var menuItemDiv = document.createElement('div');
			            menuItemDiv.className = 'menu-item';
			            menuItemDiv.setAttribute('data-menu-idx', menu.menu_idx);
			            menuItemDiv.onclick = function() {
			                toggleMenuSelection(menu.menu_idx); 
			            };
	
			            var img = document.createElement('img');
			            img.src = '../img/menu/'+menu.menu_img;
			            img.alt = '메뉴';
			            img.className = 'menu-image';

			            var editButton = document.createElement('input');
			            editButton.type = 'button';
			            editButton.className = 'edit-button';
			            editButton.value = '수정';
			            editButton.onclick = function() {
			                location.href = '/menuUpdatePage/' + menu.menu_idx; 
			            };

			            var menuInfoDiv = document.createElement('div');
			            menuInfoDiv.className = 'menu-info';
			            
			           
			            if (menu.menu_preorder === 2) {
			                menuInfoDiv.innerHTML += "<div class='menu-preorder' style='color: #F3553C; font-size: 12px;'>선주문</div>";
			            } else {
			                menuInfoDiv.innerHTML += "<div class='menu-preorder' style='color: #F3553C; font-size: 12px;'>일반 주문</div>";
			            }

			            
			            
			            menuInfoDiv.innerHTML += "<div class='menu-name'>" + menu.menu_name + "</div><div class='menu-description'>" + menu.menu_info + "</div><div class='menu-price'>" + menu.menu_price + "</div>";


			            // 메뉴 아이템에 요소 추가
			            menuItemDiv.appendChild(img);
			            menuItemDiv.appendChild(editButton);
			            menuItemDiv.appendChild(menuInfoDiv);
			            menuList.appendChild(menuItemDiv); 
			        });

			       
			     
			    } else {
			        menuList.innerHTML = '<h2>등록된 메뉴가 없습니다.</h2>'; 
            }	
		}
	}
}


let selectedMenuIdxs = []; 

function toggleMenuSelection(menuIdx) {
    const menuDiv = event.currentTarget; 
    menuIdx = parseInt(menuIdx); 

    const index = selectedMenuIdxs.indexOf(menuIdx);
    
    if (index === -1) {
      
        selectedMenuIdxs.push(menuIdx);
        menuDiv.style.border = '4px solid #007bff'; 
    } else {
        // 메뉴가 선택된 경우
        selectedMenuIdxs.splice(index, 1);
        menuDiv.style.border = ''; 
    }
    
    console.log(selectedMenuIdxs); 
}



function submitSelectedMenus() {

    const form = document.deleteMenu;
    form.querySelectorAll('input[name="menu_idx"]').forEach(input => input.remove());
    
    selectedMenuIdxs.forEach(idx => {
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'menu_idx'; 
        input.value = idx; 
        form.appendChild(input);
    });

    
    form.submit();
}


function setActiveTab(selectedTab) {
    // 모든 탭에서 active 클래스를 제거
    const tabs = document.querySelectorAll('.tab');
    tabs.forEach(tab => {
        tab.classList.remove('active');
    });
    
    // 클릭한 탭에 active 클래스 추가
    selectedTab.classList.add('active');
}

</script>
</html>