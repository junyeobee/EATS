<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/header.jsp"%>

<div class="mainCon_800">
		<input type="hidden" name="store_idx" value="<%= storeIdx %>">
		<input type="hidden" name="news_idx" value="${news_idx}">
	
	<h2>소식 상세보기</h2>
	
	<c:if test="${empty data}">
		<span>등록된 소식이 없습니다.</span>
	</c:if>
	
	<c:if test="${not empty data}">
		<div class="tableWrite_2 mb60">
			<table>
				<tr>
					<th>등록일</th>
					<td>${data.s_news_date}</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td>
						<span>
							<img src="/img/storeNewsImg/${data.s_news_img}">
						</span>
					</td>
				</tr>
				<tr>
					<th>소식</th>
					<td>
						<pre>${data.s_news_content}</pre>
					</td>
				</tr>
			</table>
		</div>
		
		<c:if test="${data.s_news_del == 'N'}">
			<div class="btnBox_bottom">
				<input type="button" class="btn_gray" value="수정" onclick="location.href='/store/storeNewsUpdateForm?news_idx=${data.s_news_idx }'">
				<input type="button" class="btn_black" value="삭제" onclick="location.href='/store/storeNewsUpDel?news_idx=${data.s_news_idx }'">
			</div>
		</c:if>
		<c:if test="${data.s_news_del == 'Y'}">
			<div class="btnBox_bottom">
				<input type="button" class="btn_gray" value="리스트" onclick="location.href='/store/storeNewsList'">
			</div>
		</c:if>
		
	</c:if>
</div>
  
   
<%@include file="../common/footer.jsp"%>