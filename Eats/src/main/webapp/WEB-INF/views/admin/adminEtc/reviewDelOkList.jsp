<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/WEB-INF/views/admin/common/header.jsp"%>

<script>
	function reviewDelete_Act(rv_idx, state_val){
		
		var form = document.getElementById('reviewDeleteForm');
		
		
		var review_yn;
		var rev_del_state;
		if(state_val == '승인'){
			review_yn = 0;	//비활성
			rev_del_state = 1;	//승인
			
		//반려
		}else {
			review_yn = 1;	//활성
			rev_del_state = 2;	//반려
			
		}
		
		document.getElementById('rv_idx').value = rv_idx;
		document.getElementById('rev_state').value = review_yn;
		document.getElementById('del_state').value = rev_del_state;
		
		form.action = "reviewDelete";
		form.submit();	
	}
</script>

<div class="mainCon_1400">
	<input type="hidden" name="admin_idx" id="admin_idx" value="${admin_idx}">
	<h2>리뷰삭제신청승인</h2>
	
	
	<form id="reviewDeleteForm" method="post" >
		<input type="hidden" name="rv_idx" id="rv_idx" value="">
		<input type="hidden" name="rev_state" id="rev_state" value="">
		<input type="hidden" name="del_state" id="del_state" value="">
	</form>
	
	<div class="tableList mb60">
		<table>
			<thead>
				<tr>
					<th>no.</th>
					<th class="ws100">회원아이디</th>
					<th class="ws400">등록된 리뷰</th>
					<th class="ws400">삭제신청사유</th>
					<th class="ws100">매장아이디</th>
					<th class="ws200">승인/반려</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty lists }">
					<tr>
						<td colspan="6" align="center">
							리뷰삭제 신청건이 없습니다.
						</td>
					</tr>
				</c:if>
				<c:if test="${!empty lists }">
					<c:forEach var="dto" items="${lists }">
						<tr>
							<td class="a_center">
								${dto.rev_idx }
							</td>
							<td class="a_left">
								${dto.user_id }
							</td>
							<td class="a_left">
								${dto.rev_content }
							</td>
							<td class="a_left">
								${dto.del_reason }
							</td>
							<td class="a_left">
								${dto.store_id }
							</td>
							
							<td class="a_center">
								<c:if test="${dto.del_state == '0'}">
									<input type="button" name="" id="" class="btn_orange" value="승인" onclick="reviewDelete_Act(${dto.rev_idx}, '승인')">
									<input type="button" name="" id="" class="btn_black" value="반려" onclick="reviewDelete_Act(${dto.rev_idx}, '반려')">
								</c:if>
								<c:if test="${dto.del_state == '1'}">
									승인완료<br>
									(${dto.check_date })
								</c:if>
								<c:if test="${dto.del_state == '2'}">
									반려<br>
									(${dto.check_date })
								</c:if>
								
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
		<!-- 
		<div class="listPaging">
			<span> ◀ </span>
			<span>1</span>
			<span>2</span>
			<span>3</span>
			<span>4</span>
			<span>5</span>
			<span> ▶ </span>
		</div>
		 -->
	</div>
</div>
   
<%@include file="/WEB-INF/views/admin/common/footer.jsp"%>