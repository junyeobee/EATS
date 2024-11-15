<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_800">
	<form name="infoUpdateReq" action="storeInfoUpdateReqSave" method="post">
	
		<c:if test="${not empty data}">	
		<input type="hidden" name="store_idx" value="<%= storeIdx %>">
			
			<input type=text name="su_state" id="" class="ws400" value="대기" placeholder="">
			<input type=text name="su_reason" id="" class="ws400" value="" placeholder="">
			<h2>정보수정신청</h2>
			<div class="btnBox_top">
				<input type="submit" class="btn_black" value="수정요청">
			</div>
			<div class="tableWrite_4 mb60">
				<table>
					<tr>
						<th>현재 매장명</th>
						<td>${data.store_name}</td>
						<th>수정할 매장명</th>
						<td>
							<input type="text" name="su_name" id="" value="">
						</td>
					</tr>
					<tr>
						<th>현재 전화번호</th>
						<td>${data.store_tel}</td>
						<th>수정할 전화번호</th>
						<td>
							<input type="text" name="su_tel" id="" value="">
						</td>
					</tr>
					<tr>
						<th>현재 대표자명</th>
						<td>${data.store_ceo}</td>
						<th>수정할 대표자명</th>
						<td>
							<input type="text" name="su_ceo" id="" value="">
						</td>
					</tr>
					<tr>
						<th>현재 주소</th>
						<td colspan="3">
							${data.store_addr} 
							<br />
							${data.store_daddr}
						</td>
					</tr>
					<tr>
						<th>수정할 주소</th>
						<td colspan="3">
							<br />
							<input type=text name="su_addr" id="" class="ws400" value="" placeholder="기본주소">
							<br /><br />
							<input type=text name="su_daddr" id="" class="ws400" value="" placeholder="상세주소">
						</td>
					</tr>
				</table>
			</div>
		</c:if>
	</form>
</div>
   
<%@include file="../common/footer.jsp"%>