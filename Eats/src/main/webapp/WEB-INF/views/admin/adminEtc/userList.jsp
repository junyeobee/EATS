<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/WEB-INF/views/admin/common/header.jsp"%>

<div class="mainCon_1400">
	<input type="hidden" name="admin_idx" id="" value="<%= admin_idx %>">
	<h2>가입회원조회</h2>
	
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
					<th class="ws100">로그인방법</th>
					<th class="ws100">아이디</th>
					<th class="ws400">회원명</th>
					<th class="ws100">이메일</th>
					<th class="ws100">생년월일</th>
					<th class="ws100">성별</th>
					<th class="ws200">상세보기</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty lists }">
					<tr>
						<td colspan="5" align="center">
							회원정보가 없습니다.
						</td>
					</tr>
				</c:if>
				<c:if test="${!empty lists }">
					<c:forEach var="dto" items="${lists }">
						<tr>
							<td class="a_center">
								${dto.user_idx }
							</td>
							<td class="a_left">
								<c:if test="${dto.join_method != 'NORMAL'}">
									카카오계정
								</c:if>
								<c:if test="${dto.join_method == 'NORMAL'}">
									잇츠계정
								</c:if>
							</td>
							<td class="a_left">
								<c:if test="${dto.join_method != 'NORMAL'}">
									${dto.kakao_id }
								</c:if>
								<c:if test="${dto.join_method == 'NORMAL'}">
									${dto.user_id }
								</c:if>
							</td>
							<td class="a_left">
								${dto.user_name }
							</td>
							<td class="a_left">
								${dto.user_email }
							</td>
							<td class="a_left">
								${dto.user_birth }
							</td>
							<td class="a_left">
								<c:if test="${dto.user_gender == 1}">
									남자
								</c:if>
								<c:if test="${dto.user_gender == 2}">
									여자
								</c:if>
							</td>
							
							<td class="a_center">
								<input type="button" class="btn_gray" value="상세보기" onclick="location.href='/admin/userDetail?user_idx=${dto.user_idx }'">
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