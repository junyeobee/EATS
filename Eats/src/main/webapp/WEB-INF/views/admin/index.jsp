<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/WEB-INF/views/admin/common/header.jsp"%>

<div class="mainCon_1400">
	<input type="text" name="admin_idx" id="" value="${admin_idx }">
	
	
	<form id="reviewDeleteForm" method="post" >
		<input type="hidden" name="rv_idx" id="rv_idx" value="">
		<input type="hidden" name="rev_state" id="rev_state" value="">
		<input type="hidden" name="del_state" id="del_state" value="">
	</form>
	
	<div class="mc_left tableList mb60">
		<h2>입점신청</h2>
		<div class="btnBox_top">
			<span class="pageChange" onclick="location.href='/admin/storeEntryOkList'">이동</span>
		</div>
		<table>
			<thead>
				<tr>
					<th>no.</th>
					<th class="ws100">입점신청매장</th>
					<th class="ws400">입점신청일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty store_lists }">
					<tr>
						<td colspan="5" align="center">
							입점신청건이 없습니다.
						</td>
					</tr>
				</c:if>
				<c:if test="${!empty store_lists }">
					<c:forEach var="dto" items="${store_lists }">
						<tr>
							<td class="a_center">
								${dto.sj_idx }
							</td>
							<td class="a_left">
								${dto.sj_name }
							</td>
							<td class="a_left">
								${dto.sj_req_date }
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	
	<div class="mc_right tableList mb60">
		<h2>리뷰삭제신청</h2>
		<div class="btnBox_top">
			<span class="pageChange" onclick="location.href='/admin/reviewDelOkList'">이동</span>
		</div>
		<table>
			<thead>
				<tr>
					<th>no.</th>
					<th class="ws400">등록된 리뷰</th>
					<th class="ws400">삭제신청사유</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty review_lists }">
					<tr>
						<td colspan="5" align="center">
							리뷰삭제신청건이 없습니다.
						</td>
					</tr>
				</c:if>
				<c:if test="${!empty review_lists }">
					<c:forEach var="dto" items="${review_lists }">
						<tr>
							<td class="a_center">
								${dto.rev_idx }
							</td>
							<td class="a_left">
								${dto.rev_content }
							</td>
							<td class="a_left">
								${dto.del_reason }
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>
   
<%@include file="/WEB-INF/views/admin/common/footer.jsp"%>