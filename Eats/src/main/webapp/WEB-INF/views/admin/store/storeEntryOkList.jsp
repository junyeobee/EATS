<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/WEB-INF/views/admin/common/header.jsp"%>

<div class="mainCon_1400">
	<input type="hidden" name="admin_idx" id="admin_idx" value="${admin_idx}">
	<h2>입점신청승인</h2>
	
	
	<form id="infoUpdateSaveForm" method="post" >
		<input type="hidden" name="su_idx" id="su_idx" value="">
		<input type="hidden" name="su_state" id="su_state" value="">
		<input type="hidden" name="su_reason" id="su_reason" value="">
		
		<input type="hidden" name="store_idx" id="store_idx" value="">
		<input type="hidden" name="su_name" id="su_name" value="">
		<input type="hidden" name="su_tel" id="su_tel" value="">
		<input type="hidden" name="su_addr" id="su_addr" value="">
		<input type="hidden" name="su_daddr" id="su_daddr" value="">
		<input type="hidden" name="su_ceo" id="su_ceo" value="">
	</form>
	
	<div class="tableList mb60">
		<table>
			<thead>
				<tr>
					<th>no.</th>
					<th class="ws200">신청매장명</th>
					<th class="ws200">아이디</th>
					<th class="ws200">연락처</th>
					<th class="ws300">이메일</th>
					<th class="ws200">입점신청일</th>
					<th class="ws200">상세보기</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty lists }">
					<tr>
						<td colspan="5" align="center">
							입점신청이 없습니다.
						</td>
					</tr>
				</c:if>
				<c:if test="${!empty lists }">
					<c:forEach var="dto" items="${lists }">
						<tr>
							<td class="a_center">
								${dto.sj_idx }
							</td>
							<td class="a_left">
								${dto.sj_name }
							</td>
							<td class="a_left">
								${dto.sj_id }
							</td>
							<td class="a_left">
								${dto.owner_tel }
							</td>
							<td class="a_left">
								${dto.sj_email }
							</td>
							
							<td class="a_center">
								${dto.sj_req_date }
							</td>
							<td class="a_center">
								<input type="button" class="btn_gray" value="상세보기" onclick="location.href='/admin/storeEntryDetail?sj_idx=${dto.sj_idx }'">
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" align="center">
						${pageStr }
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
   
<%@include file="/WEB-INF/views/admin/common/footer.jsp"%>