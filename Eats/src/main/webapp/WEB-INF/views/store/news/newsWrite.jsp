<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/header.jsp"%>

<div class="mainCon_800">

	<c:if test="${empty data}">
		<form name="storeNewsSave" action="storeNewsSave" method="post" enctype="multipart/form-data">
			<input type="hidden" name="store_idx" id="store_idx" value="${sessionScope.storeIdx}">
			<input type="hidden" name="s_news_del" id="" value="N">
		
			<h2>소식 글쓰기</h2>
		
			<div class="tableWrite_2 mb60">
				<table>
					<tr>
						<th>소식제목</th>
						<td>
							<input type="text" name="s_news_title" id="" value="">
						</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td>
							<input type="file" name="s_news_img" id="" value="">
						</td>
					</tr>
					<tr>
						<th>소식내용</th>
						<td>
							<textarea name="s_news_content" class=""></textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class="btnBox_bottom">
				<input type="submit" class="btn_black" value="저장">
				<input type="button" class="btn_gray" value="취소" onclick="location.href='/store/storeNewsList'">
			</div>
			
		</form>
	</c:if>
	
	<c:if test="${not empty data}">
		<h2>소식 수정하기</h2>
		
		<form name="storeNewsUpdate" action="storeNewsUpdate" method="post" enctype="multipart/form-data">
			<input type="hidden" name="store_idx" id="" value="1">			
			<input type="hidden" name="s_news_idx" value="${news_idx}">
		
			<h2>소식 글쓰기</h2>
		
			<div class="tableWrite_2 mb60">
				<table>
					<tr>
						<th>소식제목</th>
						<td>
							<input type="text" name="s_news_title" id="" value="${data.s_news_title}">
						</td>
					</tr>
					<tr>
						<th>수정할 이미지</th>
						<td>
							<input type="file" name="s_news_img" id="" value="${data.s_news_img}">
						</td>
					</tr>
					<tr>
						<th>현재이미지</th>
						<td>
							<img src="/img/storeNewsImg/${data.s_news_img}">
						</td>
					</tr>
					<tr>
						<th>소식내용</th>
						<td>
							<textarea name="s_news_content" class="">${data.s_news_content}</textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class="btnBox_bottom">
				<input type="submit" class="btn_black" value="수정">
				<input type="button" class="btn_gray" value="취소" onclick="location.href='/store/storeNewsList'">
			</div>
			
		</form>
	</c:if>
</div>
  
   
<%@include file="../common/footer.jsp"%>