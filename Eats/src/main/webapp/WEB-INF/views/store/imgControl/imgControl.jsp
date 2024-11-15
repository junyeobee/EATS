<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>


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

<div class="mainCon_400">
	<form name="imgSave" id="imgSave" action="imgUpdate2" method="post" enctype="multipart/form-data">
		<input type="hidden" name="store_idx" value="<%= storeIdx %>">
		<input type="hidden" name="si_idx" id="si_idx">
		
		<h2>이미지 관리</h2>
		<div class="btnBox_top">
			<input type="submit" class="btn_black" value="저장">
		</div>
	
		<div class="tableWrite_2 mb60">
			<table>
			
				<c:if test="${empty lists }">
					<c:set var="img_num" value="1" />
					<c:forEach begin="1" end="5" var="tr" varStatus="tr_sta">
						<tr>
							<th>이미지 ${img_num}</th>
							<td>
								<input type="file" name="store_imgs" id="" value="">
								<input type="hidden" name="store_img_db" id="" value="">
					            <input type="hidden" name="img_order" id="" value="${img_num}">
							</td>
						</tr>
					    <c:set var="img_num" value="${img_num + 1}"/>
					</c:forEach>
				</c:if>
				
				<c:if test="${!empty lists }">
				    <c:set var="img_num" value="1" /> <!-- img_num은 1부터 시작 -->
				    
				    <!-- img_order에 맞춰서 출력 -->
				    <c:forEach var="i" begin="1" end="5">
				        <tr>
				            <th>이미지 ${i}</th>
				            <td>
				                <input type="file" name="store_imgs" id="" value="">
				
				                <c:set var="matched" value="false" /> <!-- 매칭 여부 -->
				                <c:forEach var="dto" items="${lists}">
				                    <c:if test="${dto.img_order == i}">
				                        <input type="hidden" name="store_img_db" id="" value="${dto.store_img}">
				                        <input type="hidden" name="img_order" id="" value="${dto.img_order}">
				                        <input type="hidden" name="store_img_idx" id="" value="${dto.si_idx}">
				                        <c:set var="matched" value="true" /> <!-- 매칭됨 -->
				                    </c:if>
				                </c:forEach>
				
				                <!-- 만약 매칭된 값이 없으면 빈 값 -->
				                <c:if test="${not matched}">
				                    <input type="hidden" name="store_img_db" id="" value="">
				                    <input type="hidden" name="img_order" id="" value="${i}">
				                    <input type="hidden" name="store_img_idx" id="" value="">
				                </c:if>
				            </td>
				        </tr>
				    </c:forEach>
				</c:if>
			</table>
		</div>
	</form>
</div>
  
	    	
<div class="mainCon_0">
	<h3>등록된 이미지 확인</h3>
	<div class="mc0_imgBox">
		
		<c:if test="${empty lists}">
			<span>등록된 이미지가 없습니다.</span>
		</c:if>
		
		<c:if test="${not empty lists}">
   	
		    <c:set var="img_num" value="1" /> <!-- img_num은 1부터 시작 -->
			<c:forEach var="dto" items="${lists }">
				<span>
					<c:if test="${not empty dto.store_img}">
						<span onclick="imgDelete(${dto.si_idx}, ${img_num })">X</span>
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
   
<%@include file="../common/footer.jsp"%>