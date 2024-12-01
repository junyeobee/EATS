<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/WEB-INF/views/admin/common/header.jsp"%>

<div class="mainCon_1400">
	<input type="hidden" name="admin_idx" id="admin_idx" value="${admin_idx}">
	<h2>가입회원조회</h2>
	
	<!-- 
	<form id="" method="get" action="/admin/userList">
		
		<select name="search_key">
			<option value="user_id">아이디</option>
			<option value="user_name">이름</option>
		</select>
		<input type="text" name="search_value" id="" value="">
		<input type="submit" value="검색">
		
	</form>
	 -->
	
	<div class="tableList mb60">
		<table>
			<thead>
				<tr>
					<th>no.</th>
					<th class="ws100">로그인방법</th>
					<th class="ws200">아이디</th>
					<th class="ws200">회원명</th>
					<th class="ws400">이메일</th>
					<th class="ws150">생년월일</th>
					<th class="ws100">성별</th>
					<th class="ws100">상세보기</th>
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
							<td class="a_center">
								<c:if test="${dto.join_method != 'NORMAL'}">
									카카오
								</c:if>
								<c:if test="${dto.join_method == 'NORMAL'}">
									잇츠
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
							<td class="a_center">
								${dto.user_name }
							</td>
							<td class="a_left">
								${dto.user_email }
							</td>
							<td class="a_center">
								${dto.user_birth }
								
							</td>
							<td class="a_center">
								<c:if test="${dto.user_gender == 1}">
									남자
								</c:if>
								<c:if test="${dto.user_gender == 2}">
									여자
								</c:if>
							</td>
							
							<td class="a_center">
								<input type="button" class="btn_orange" value="상세보기" onclick="location.href='/admin/userDetail?user_idx=${dto.user_idx }'">
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<!-- 
			<tfoot>
				<tr>
					<td colspan="8" align="center">
						<div class="mt20">${pageStr }</div>
					</td>
				</tr>
			</tfoot>
			 -->
		</table>
	</div>
		<div class="listPaging">
			${pageStr }
		</div>
</div>
   
<%@include file="/WEB-INF/views/admin/common/footer.jsp"%>