<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_400">
	<form name="imgSave" action="imgSave" method="post" enctype="multipart/form-data">
		<input type="text" name="store_idx" id="" value="1">
		<h2>이미지 관리</h2>
		<div class="btnBox_top">
			<input type="submit" class="btn_black" value="저장">
		</div>
		<div class="tableWrite_2 mb60">
			<table>
				<tr>
					<th>메인이미지</th>
					<td>
						<input type="file" name="store_img1" id="" value="">
					</td>
				</tr>
				<tr>
					<th>서브이미지1</th>
					<td>
						<input type="file" name="store_img2" id="" value="">
					</td>
				</tr>
				<tr>
					<th>서브이미지2</th>
					<td>
						<input type=file name="store_img3" id="" value="">
					</td>
				</tr>
				<tr>
					<th>서브이미지3</th>
					<td>
						<input type="file" name="store_img4" id="" value="">
					</td>
				</tr>
				<tr>
					<th>서브이미지4</th>
					<td>
						<input type="file" name="store_img5" id="" value="">
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
  
<div class="mainCon_0">
	<h3>등록된 이미지 확인</h3>
	<div class="mc0_imgBox">
	
	<c:if test="${empty data}">
		<span>등록된 사원이 없습니다.</span>
	</c:if>
	
	<c:if test="${not empty data}">
	    <p>store_img1: ${data.store_img1}</p>
	    <p>store_img2: ${data.store_img2}</p>
	    <p>store_img3: ${data.store_img3}</p>
	    <p>store_img4: ${data.store_img4}</p>
	    <p>store_img5: ${data.store_img5}</p>
	    
	    
	    

		<span>
			<span>X</span>
			<img src="C:/EATS/Eats/src/main/webapp/storeUploadImg/${data.store_img1 }">
			
		</span>
		<span>
			<span>X</span>
			<img src="C:/EATS/Eats/src/main/webapp/storeUploadImg/${data.store_img2 }">
		</span>
		<span>
			<span>X</span>
			<img src="C:/EATS/Eats/src/main/webapp/storeUploadImg/${data.store_img3 }">
		</span>
		<span>
			<span>X</span>
			<img src="C:/EATS/Eats/src/main/webapp/storeUploadImg/${data.store_img4 }">
		</span>
		<span>
			<span>X</span>
			<img src="C:/EATS/Eats/src/main/webapp/storeUploadImg/${data.store_img5 }">
		</span>
	</c:if>


		<span>
			<span>X</span>
			<img src="/img/store/img_sample.png">
		</span>
		
		<span>
			<img src="/img/store/img_none.png">
		</span>
		
		<span>
			<img src="/img/store/img_none.png">
		</span>
		
		<span>
			<img src="/img/store/img_none.png">
		</span>
		
		<span>
			<img src="/img/store/img_none.png">
		</span>
		
		<!-- 
		<span>
			<img src="/img/store/img_none.png">
			<input type="button" class="btn_gray" value="삭제">
		</span>
		 -->
	</div>
</div>
  
   
<%@include file="../common/footer.jsp"%>