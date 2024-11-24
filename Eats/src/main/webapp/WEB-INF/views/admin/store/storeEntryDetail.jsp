<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<script>

	function entryACT_cancel(){


		var open_box = document.getElementById("reason_box");
		open_box.style.display = "block";
		
		var btn_cancel = document.getElementById("btn_cancel");
		btn_cancel.style.display = "none";
		
		
		
	}
	
	function entryACT(ea_val){
		alert(ea_val);
		
		alert("여기서 위도 경도 구해서 form에 담아 넘겨서 저장시켜야함!!!!!!!!!!!!!!!!!!!");
		
		
		var form = document.getElementById('entryAction');
		form.entry_value.value = ea_val;
		//document.getElementById('su_idx').value = su_idx;
		//document.getElementById('su_state').value = su_state;
		//alert("test");
		if(ea_val == 'N'){
			
			var reason_input = form.cancel_reason.value;
			if(!reason_input){
				alert("반려사유가 입력되지 않았습니다. 입력 후 진행해주세요.");
				return false;
			}
		}

		form.action = "entryAction";
		form.submit();
		
		
	}
</script>




<div class="mainCon_800">
	<form name="" id="entryAction" action="" method="post">	
		<input type="hidden" name="sj_idx" value="${sj_idx}">
		<input type="hidden" name="entry_value" id="entry_value" value="${entry_value}">
		<input type="hidden" name="sj_email" id="sj_email" value="${data.sj_email}">
	
		<input type="hidden" name="admin_idx" id="admin_idx" value="${admin_idx}">
		<c:if test="${not empty data}">	
			<h2>입점신청정보</h2>
			
			<!-- 0대기 1승인 2반려 -->
			<c:if test="${data.sj_stat == 0}">	
				<div class="btnBox_top">
					<input type="button" class="btn_black" value="승인" onclick="entryACT('Y')">
					<input type="button" class="btn_gray" id="btn_cancel" value="반려" onclick="entryACT_cancel('N')">
				</div>
				<div id="reason_box" style="width:100%; height:30px; margin:50px 0; text-align:right; display:none;">
					반려사유:<input type="text" name="cancel_reason" class="ws300">
					<input type="button" name="" id="" class="btn_red" value="반려하기" onclick="entryACT('N')">
				</div>
			</c:if>
			<c:if test="${data.sj_stat == 1}">
				<div class="btnBox_top">승인완료</div>
			</c:if>
			<c:if test="${data.sj_stat == 2}">
				<div class="btnBox_top" style="text-align:right;">
					반려<br>
					반려사유:${data.sj_reason}
				</div>
			</c:if>
			
			<span id="latlng"></span>
			
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
							<input type="text" name="addr_number" value="${data.sj_addr} ">
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