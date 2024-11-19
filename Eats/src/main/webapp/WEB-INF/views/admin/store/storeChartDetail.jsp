<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_800">
	<form name="" action="" method="post">	
			<input type="hidden" name="sj_idx" value="${st_idx}">
	
	<input type="hidden" name="admin_idx" id="" value="<%= admin_idx %>">
		<c:if test="${not empty data}">	
			<h2>[파브리]매장통계</h2>
			<div class="tableWrite_4 mb60">
				<table>
					<tr>
						<th>매장명</th>
						<td>${data.store_idx}</td>
						<th>아이디</th>
						<td>${data.store_idx}</td>
					</tr>
					<tr>
						<th>입점신청일</th>
						<td>${data.store_idx}</td>
						<th>이메일</th>
						<td>${data.store_idx}</td>
					</tr>
					<tr>
						<th>사업자등록번호</th>
						<td>${data.store_idx}</td>
						<th>아이디</th>
						<td>${data.store_idx}</td>
					</tr>
					<tr>
						<th>대표자명</th>
						<td>${data.store_idx}</td>
						<th>연락처</th>
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
	</form>
</div>
   
<%@include file="../common/footer.jsp"%>