<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_800">
	<form name="" action="" method="post">	
			<input type="hidden" name="sj_idx" value="${sj_idx}">
	
	<input type="hidden" name="admin_idx" id="" value="<%= admin_idx %>">
		<c:if test="${not empty data}">	
			<h2>입점신청정보</h2>
			<div class="btnBox_top">
				<input type="button" class="btn_black" value="승인">
				<input type="button" class="btn_gray" value="반려">
			</div>
			<div class="tableWrite_4 mb60">
				<table>
					<tr>
						<th>매장명</th>
						<td>${data.sj_name}</td>
						<th>아이디</th>
						<td>${data.sj_id}</td>
					</tr>
					<tr>
						<th>입점신청일</th>
						<td>${data.sj_req_date}</td>
						<th>이메일</th>
						<td>${data.sj_email}</td>
					</tr>
					<tr>
						<th>사업자등록번호</th>
						<td>${data.biz_num}</td>
						<th>아이디</th>
						<td>${data.sj_id}</td>
					</tr>
					<tr>
						<th>대표자명</th>
						<td>${data.owner_name}</td>
						<th>연락처</th>
						<td>${data.owner_tel}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">
							${data.sj_addr} 
							<br />
							${data.sj_daddr}
						</td>
					</tr>
				</table>
			</div>
		</c:if>
	</form>
</div>
   
<%@include file="../common/footer.jsp"%>