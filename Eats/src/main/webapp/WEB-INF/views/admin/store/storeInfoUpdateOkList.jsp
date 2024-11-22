<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="/WEB-INF/views/admin/common/header.jsp"%>

<script>
	function cancel_box_open(su_idx){
		//alert(su_idx);
		
		//반려사유 +반려하기버튼 보여주기
		var open_box = document.getElementById("cancel_box_"+su_idx);
		open_box.style.display = "block";
		
		//반려버튼 가리기
		var cancel_before = document.getElementById("cancel_before_"+su_idx);
		cancel_before.style.display = "none";
	}
	
	function infoUpdate_Act(su_idx, su_state, store_idx){
		
		var form = document.getElementById('infoUpdateSaveForm');
		document.getElementById('su_idx').value = su_idx;

		document.getElementById('su_state').value = su_state;
		
		var su_reason = document.getElementById('cancel_input_'+su_idx).value;
		
		var su_name = document.getElementById('su_name_'+su_idx).value;
		var su_tel = document.getElementById('su_tel_'+su_idx).value;
		var su_addr = document.getElementById('su_addr_'+su_idx).value;
		var su_daddr = document.getElementById('su_daddr_'+su_idx).value;
		var su_ceo = document.getElementById('su_ceo_'+su_idx).value;

		//승인일경우 반려사유 없음
		if(su_state == '승인'){
			su_reason = "";
		}
		document.getElementById('su_reason').value = su_reason;
		
		document.getElementById('store_idx').value = store_idx;
		document.getElementById('su_name').value = su_name;
		document.getElementById('su_tel').value = su_tel;
		document.getElementById('su_addr').value = su_addr;
		document.getElementById('su_daddr').value = su_daddr;
		document.getElementById('su_ceo').value = su_ceo;
		//alert(su_reason);
		
		form.action = "infoUpdateAction";
		form.submit();
	}
	
</script>

<div class="mainCon_1400">
	<input type="hidden" name="admin_idx" id="admin_idx" value="${admin_idx}">
	<h2>정보수정신청승인</h2>
	
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
					<th class="ws200">매장명</th>
					<th class="ws200">전화번호</th>
					<th class="ws400">주소</th>
					<th class="ws100">대표자명</th>
					<th class="ws400">승인/반려</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty lists }">
					<tr>
						<td colspan="5" align="center">
							정보수정신청이 없습니다.
						</td>
					</tr>
				</c:if>
				<c:if test="${!empty lists }">
					<c:forEach var="dto" items="${lists }">
						<tr>
							<td class="a_center">
								${dto.su_idx }
							</td>
							<td class="a_left">
								<c:if test="${dto.su_name != null && fn:trim(dto.store_name) != fn:trim(dto.su_name) }">
									<span class="beforeText">${dto.store_name }</span>
									<br>
									<span class="afterText">→ ${dto.su_name }</span>
									
									<input type="hidden" name="" id="su_name_${dto.su_idx }" value=" ${dto.su_name }">
								</c:if>
								<c:if test="${dto.su_name == null || fn:trim(dto.store_name) == fn:trim(dto.su_name) }">
									<input type="hidden" name="" id="su_name_${dto.su_idx }" value="${dto.store_name }">
								</c:if>
							</td>
							<td class="a_left">
								<c:if test="${dto.su_tel != null && fn:trim(dto.store_tel) != fn:trim(dto.su_tel) }">
									<span class="beforeText">${dto.store_tel }</span>
									<br>
									<span class="afterText">→ ${dto.su_tel }</span>
									
									<input type="hidden" name="" id="su_tel_${dto.su_idx }" value=" ${dto.su_tel }">
								</c:if>
								<c:if test="${dto.su_tel == null || fn:trim(dto.store_tel) == fn:trim(dto.su_tel) }">
									<input type="hidden" name="" id="su_tel_${dto.su_idx }" value="${dto.store_tel }">
								</c:if>
							</td>
							<td class="a_left">
								<c:if test="${(dto.su_addr != null || dto.su_daddr != null) && (fn:trim(dto.store_addr) != fn:trim(dto.su_addr) || fn:trim(dto.store_daddr) != fn:trim(dto.su_daddr))}">
									<span class="beforeText">
										${dto.store_addr }
										${dto.store_daddr }</span>
									<br>
									<span class="afterText">
										→ ${dto.su_addr }
										${dto.su_daddr }
									</span>
									
									<input type="hidden" name="" id="su_addr_${dto.su_idx }" value=" ${dto.su_addr }">
									<input type="hidden" name="" id="su_daddr_${dto.su_idx }" value=" ${dto.su_daddr }">
								</c:if>
								<c:if test="${(dto.su_addr == null || dto.su_daddr == null) || (fn:trim(dto.store_addr) == fn:trim(dto.su_addr) || fn:trim(dto.store_daddr) == fn:trim(dto.su_daddr))}">
									<input type="hidden" name="" id="su_addr_${dto.su_idx }" value="${dto.store_addr }">
									<input type="hidden" name="" id="su_daddr_${dto.su_idx }" value=" ${dto.store_daddr }">
								</c:if>
							</td>
							<td class="a_left">
								<c:if test="${ dto.su_ceo != null && fn:trim(dto.store_ceo) != fn:trim(dto.su_ceo)}">
									<span class="beforeText">${dto.store_ceo }</span>
									<br>
									<span class="afterText">→ ${dto.su_ceo }</span>
									
									<input type="hidden" name="" id="su_ceo_${dto.su_idx }" value=" ${dto.su_ceo }">
								</c:if>
								<c:if test="${dto.su_ceo == null || fn:trim(dto.store_ceo) == fn:trim(dto.su_ceo) }">
									<input type="hidden" name="" id="su_ceo_${dto.su_idx }" value="${dto.store_ceo }">
								</c:if>
							</td>
							
							<td class="a_center">
								<c:if test="${dto.su_state == '대기'}">
									<input type="button" name="" id="" class="btn_orange" value="승인" onclick="infoUpdate_Act(${dto.su_idx }, '승인', ${dto.store_idx })">
									<input type="button" name="" id="cancel_before_${dto.su_idx }" class="btn_black" value="반려" onclick="cancel_box_open(${dto.su_idx })">
								
									<div class="cancel_box" id="cancel_box_${dto.su_idx }">
										<input type="text" name="" id="cancel_input_${dto.su_idx }" class="ws200" placeholder="반려사유를 입력해주세요." value="">
										<input type="button" name="" id="" class="btn_red" value="반려하기" onclick="infoUpdate_Act(${dto.su_idx }, '반려', ${dto.store_idx })">
									</div>
								</c:if>
								
								<c:if test="${dto.su_state != '대기'}">
									<c:if test="${dto.su_state == '반려'}">
										${dto.su_state }
										(${dto.su_reason })
									</c:if>
									<c:if test="${dto.su_state == '승인'}">
										${dto.su_state }
									</c:if>
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