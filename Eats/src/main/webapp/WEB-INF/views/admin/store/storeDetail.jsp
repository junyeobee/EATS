<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_800">
	<form name="" action="" method="post">	
		<input type="hidden" name="st_idx" value="${store_idx}">
	
		<input type="hidden" name="admin_idx" id="" value="<%= admin_idx %>">
		<c:if test="${not empty data}">	
			<h2>[파브리]매장정보</h2>
			<div class="tableWrite_4 mb60">
				<table>
					<tr>
						<th>매장명</th>
						<td>${data.store_idx}</td>
						<th>이메일</th>
						<td>${data.store_idx}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${data.store_idx}</td>
						<th>대표자명</th>
						<td>${data.store_idx}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">
							${data.store_idx} 
							<br />
							${data.store_idx}
						</td>
					</tr>
				</table>
			</div>
		</c:if>
		
		<c:if test="${not empty data}">	
			<h2>영업시간</h2>
			<div class="tableWrite_4 mb60">
				<table>
					<tr>
						<th>일</th>
						<td>${data.store_idx}</td>
						<th>목</th>
						<td>${data.store_idx}</td>
					</tr>
					<tr>
						<th>월</th>
						<td>${data.store_idx}</td>
						<th>금</th>
						<td>${data.store_idx}</td>
					</tr>
					<tr>
						<th>화</th>
						<td>${data.store_idx}</td>
						<th>토</th>
						<td>${data.store_idx}</td>
					</tr>
					<tr>
						<th>수</th>
						<td>${data.store_idx}</td>
						<th>브레이크타임</th>
						<td>${data.store_idx}</td>
					</tr>
				</table>
			</div>
		</c:if>
	</form>
</div>
   
<%@include file="../common/footer.jsp"%>