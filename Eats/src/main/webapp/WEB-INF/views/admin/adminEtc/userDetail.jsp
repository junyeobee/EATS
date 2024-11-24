<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_800">
	<form name="" action="" method="post">	
		<input type="hidden" name="user_idx" value="${user_idx}">
		<input type="hidden" name="admin_idx" id="" value="<%= admin_idx %>">
		
		
		<c:if test="${not empty data}">
		
			<c:set var="user_login_id" value="${data.user_id }" />
			<c:set var="user_login_type" value="잇츠계정" />
			
			<c:if test="${data.join_method != 'NORMAL'}">
				<c:set var="user_login_id" value="${data.kakao_id }" />
				<c:set var="user_login_type" value="카카오계정" />
			</c:if>
				
			<h2>[${user_login_id }]회원정보</h2>
			<div class="tableWrite_4 mb60">
				<table>
					<tr>
						<th>아이디</th>
						<td>
							${user_login_id }
						</td>
						<th>로그인방법</th>
						<td>
							${user_login_type }
						</td>
					</tr>
					<tr>
						<th>회원명</th>
						<td>${data.user_name}</td>
						<th>이메일</th>
						<td>${data.user_email}</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${data.user_birth}</td>
						<th>성별</th>
						<td>
							<c:if test="${data.user_gender == 1}">
								남자
							</c:if>
							<c:if test="${data.user_gender == 2}">
								여자
							</c:if>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="tableWrite_4 mb60">
				<table>
					<tr>
						<th>닉네임</th>
						<td>${data.user_nickname}</td>
						<th>연락처</th>
						<td>${data.user_tel}</td>
					</tr>
						<th>포인트</th>
						<td colspan="3">${data.user_point}</td>
					</tr>
					<tr>
						<th>소개글</th>
						<td colspan="3">${data.user_intro}</td>
					</tr>
				</table>
			</div>
		</c:if>
	</form>
</div>
   
<%@include file="../common/footer.jsp"%>