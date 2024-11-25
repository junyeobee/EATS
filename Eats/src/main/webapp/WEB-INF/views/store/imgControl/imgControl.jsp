<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/store/storeContCss.css">

<meta charset="UTF-8">
<title>eats</title>

<script>
	function imgDelete(si_idx, imgNum){
		
		if(imgNum == 1){
			alert("메인이미지는 삭제할 수 없습니다.");
			return false;
		}

		if(imgNum > 1){
	        var isConfirmed = confirm("이미지를 삭제하면 복구되지 않습니다. 정말 삭제하시겠습니까?");
	        
	        if (isConfirmed) {
	            var form = document.getElementById('imgSave'); 
	            document.getElementById('si_idx').value = si_idx; 
	            
	            form.action = "imgUpDel2"; 
	            form.submit();
	        }
		}
	}
</script>
</head>
<body>
	<%@ include file="../store_Header.jsp"%>
	<%@ include file="../nav.jsp"%>
	 <div class="container" style="margin-top:150px; margin-left:300px; ">
		<div class="mainCont">
			<div class="mainCon_img">
				<form name="imgSave" id="imgSave" action="imgUpdate2" method="post" enctype="multipart/form-data">
					<input type="hidden" name="store_idx" id="store_idx" value="${store_idx}">
					<input type="hidden" name="si_idx" id="si_idx">
					
					<h2>이미지 등록</h2>
				
					
					<div class="btnBox_top2">
						<input type="submit" class="btn_black" value="저장">
					</div>
						
					<div class="img_align_left">
						<c:if test="${empty lists }">
						
							<c:set var="img_num" value="1" />
							<c:forEach begin="1" end="5" var="tr" varStatus="tr_sta">
									
									
								<c:if test="${img_num == 1 }">
									<c:set var="img_title" value="&lt;메인이미지&gt;" />
									<c:set var="main_img_title" value="style='font-weight:600; font-size:16px;'" />
								</c:if>
								<c:if test="${img_num != 1 }">
									<c:set var="img_title" value="이미지 ${img_num}" />
									<c:set var="main_img_title" value="" />
								</c:if>
								<span>
					    
									
							     	<label for="file-input_${img_num}" ${main_img_title }>${img_title}</label>
							 		<br>
									<input type="file" name="store_imgs" id="file-input_${img_num}" value="" class="input_file">
									
									
									<input type="hidden" name="store_img_db" id="" value="">
						            <input type="hidden" name="img_order" id="" value="${img_num}">
								    <c:set var="img_num" value="${img_num + 1}"/>
								</span>
							</c:forEach>
						</c:if>
						
						
						<c:if test="${!empty lists }">
						    <c:set var="img_num" value="1" /> <!-- img_num은 1부터 시작 -->
						    
						    <!-- img_order에 맞춰서 출력 -->
						    <c:forEach var="i" begin="1" end="5">
						    
								<c:if test="${i == 1 }">
									<c:set var="img_title" value="&lt;메인이미지&gt;" />
									<c:set var="main_img_title" value="style='font-weight:600; font-size:16px;'" />
								</c:if>
								<c:if test="${i != 1 }">
									<c:set var="img_title" value="이미지 ${i}" />
									<c:set var="main_img_title" value="" />
								</c:if>
								<span>
							     	<label for="file-input_${i}" ${main_img_title }>${img_title}</label>
							 		<br>
									<input type="file" name="store_imgs" id="file-input_${i}" value="" class="input_file">
									
									
					                <c:set var="matched" value="false" /> <!-- 매칭 여부 -->
					                <c:forEach var="dto" items="${lists}">
					                    <c:if test="${dto.img_order == i}">
					                        <input type="hidden" name="store_img_db" id="" value="${dto.store_img}">
					                        <input type="hidden" name="img_order" id="" value="${dto.img_order}">
					                        <input type="hidden" name="store_img_idx" id="" value="${dto.si_idx}">
					                        <c:set var="matched" value="true" /> <!-- 매칭됨 -->
					                    </c:if>
					                </c:forEach>
				                </span>
						
				                <!-- 만약 매칭된 값이 없으면 빈 값 -->
				                <c:if test="${not matched}">
				                    <input type="hidden" name="store_img_db" id="" value="">
				                    <input type="hidden" name="img_order" id="" value="${i}">
				                    <input type="hidden" name="store_img_idx" id="" value="">
				                </c:if>
									
						    </c:forEach>
						</c:if>
					</div>
					
				</form>
				
				<div class="mt50">
					<h3>등록 이미지 확인</h3>
				</div>
					
				<div class="img_align_left hs400">
					<c:if test="${empty lists}">
						<span>등록된 이미지가 없습니다.</span>
					</c:if>
					
					<c:if test="${not empty lists}">
			   	
					    <c:set var="img_num" value="1" /> <!-- img_num은 1부터 시작 -->
						<c:forEach var="dto" items="${lists }">
						
						
							<span style="padding: 5px 10px;">
								<c:if test="${not empty dto.store_img}">
									<span class="cspi img_del_btn" onclick="imgDelete(${dto.si_idx}, ${img_num })">X</span>
									<img src="/img/storeUploadImg/${dto.store_img }">
								</c:if>
							</span>
							
							<input type="hidden" name="store_img_idx" id="" value="${dto.si_idx }">
							<input type="hidden" name="store_img_db" id="" value="${dto.store_img }">
							<input type="hidden" name="img_order" id="" value="${dto.img_order }">
							
							<c:set var="img_num" value="${img_num+1 }" />
							
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>