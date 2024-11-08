<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_600">
	<input type="text" name="store_idx" id="" value="1">
	<input type="text" name="news_idx" value="${news_idx}">
	
	<h2>소식 상세보기</h2>
	<c:if test="${empty data}">
		<span>등록된 사원이 없습니다.</span>
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
							<img src="/storeNewsImg/${data.s_news_img}">
						</span>
					</td>
				</tr>
				<tr>
					<th>소식</th>
					<td>
						${data.s_news_content}
					</td>
				</tr>
			</table>
		</div>
		<div class="btnBox_bottom">
			<input type="button" class="btn_gray" value="수정">
			<input type="button" class="btn_black" value="삭제">
		</div>
		
	</c:if>
</div>
  
   
<%@include file="../common/footer.jsp"%>