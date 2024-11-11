<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>


<script>

	function imgSaveCheck(){

		var store_img1 = document.getElementsByName('store_img1')[0].value;
		var store_img2 = document.getElementsByName('store_img2')[0].value;
		var store_img3 = document.getElementsByName('store_img3')[0].value;
		var store_img4 = document.getElementsByName('store_img4')[0].value;
		var store_img5 = document.getElementsByName('store_img5')[0].value;
		
		if(store_img1 == "" && store_img2 == "" && store_img3 == "" && store_img4 == "" && store_img5 == ""){
			alert("수정할 이미지가 존재하지 않습니다.");
			return false;
		}
	}
	
	function imgDelete(imgNum){
		
		if(imgNum == 1){
			alert("메인이미지는 삭제할 수 없습니다.");
			return false;
		}

		var form = document.getElementById('imgSave');
		document.getElementById('img_num').value = imgNum;
		
		form.action = "imgUpDel";
		form.submit();
	}
</script>

<div class="mainCon_400">
	<form name="imgSave" id="imgSave" action="imgUpdate" method="post" enctype="multipart/form-data" onsubmit="return imgSaveCheck();">
		<input type="hidden" name="store_idx" value="<%= storeIdx %>">
		<input type="hidden" name="img_num" id="img_num">
		
		<h2>이미지 관리</h2>
		<div class="btnBox_top">
			<input type="submit" class="btn_black" value="저장">
		</div>
		
		<c:if test="${not empty data}">
			<input type="hidden" name="si_idx" id="" value="${data.si_idx }">
			
			<div class="tableWrite_2 mb60">
				<table>
					<tr>
						<th>메인이미지</th>
						<td>
							<input type="file" name="store_img1" id="" value="">
							<input type="hidden" name="store_img1_db" id="" value="${data.store_img1 }">
						</td>
					</tr>
					<tr>
						<th>서브이미지1</th>
						<td>
							<input type="file" name="store_img2" id="" value="">
							<input type="hidden" name="store_img2_db" id="" value="${data.store_img2 }">
						</td>
					</tr>
					<tr>
						<th>서브이미지2</th>
						<td>
							<input type=file name="store_img3" id="" value="">
							<input type=hidden name="store_img3_db" id="" value="${data.store_img3 }">
						</td>
					</tr>
					<tr>
						<th>서브이미지3</th>
						<td>
							<input type="file" name="store_img4" id="" value="">
							<input type="hidden" name="store_img4_db" id="" value="${data.store_img4 }">
						</td>
					</tr>
					<tr>
						<th>서브이미지4</th>
						<td>
							<input type="file" name="store_img5" id="" value="">
							<input type="hidden" name="store_img5_db" id="" value="${data.store_img5 }">
						</td>
					</tr>
				</table>
			</div>
		</c:if>
	</form>
</div>
  
<div class="mainCon_0">
	<h3>등록된 이미지 확인</h3>
	<div class="mc0_imgBox">
		
		<c:if test="${empty data}">
			<span>등록된 이미지가 없습니다.</span>
		</c:if>
		
		<c:if test="${not empty data}">
		    
	    	<!-- 경로를 변수로 설정 -->
	    	<!-- <c:set var="basePath" value="C:/EATS/Eats/src/main/webapp/storeUploadImg/" />-->   
	    	<!-- <c:set var="basePath" value="C:/ssangyoung_java/eats/eats/src/main/webapp/storeUploadImg/" /> -->     
		    
	    	<c:set var="basePath" value="/storeUploadImg/" />
			<span>
				<c:if test="${empty data.store_img1 }">
					<span></span>
					<img src="/img/store/img_none.png">
				</c:if>
				<c:if test="${not empty data.store_img1}">
					<span onclick="imgDelete(1)">X</span>
					<img src="${data.store_img1 }">
				</c:if>
			</span>
			<span>
				<c:if test="${empty data.store_img2 }">
					<span></span>
					<img src="/img/store/img_none.png">
				</c:if>
				<c:if test="${not empty data.store_img2}">
					<span onclick="imgDelete(2)">X</span>
					<img src="${data.store_img2 }">
				</c:if>
			</span>
			<span>
				<c:if test="${empty data.store_img3 }">
					<span></span>
					<img src="/img/store/img_none.png">
				</c:if>
				<c:if test="${not empty data.store_img3}">
					<span onclick="imgDelete(3)">X</span>
					<img src="${data.store_img3 }">
				</c:if>
			</span>
			<span>
				<c:if test="${empty data.store_img4 }">
					<span></span>
					<img src="/img/store/img_none.png">
				</c:if>
				<c:if test="${not empty data.store_img4}">
					<span onclick="imgDelete(4)">X</span>
					<img src="${data.store_img4 }">
				</c:if>
			</span>
			<span>
				<c:if test="${empty data.store_img5 }">
					<span></span>
					<img src="/img/store/img_none.png">
				</c:if>
				<c:if test="${not empty data.store_img5}">
					<span onclick="imgDelete(5)">X</span>
					<img src="${data.store_img5 }">
				</c:if>
			</span>
		</c:if>
	</div>
</div>
  
   
<%@include file="../common/footer.jsp"%>