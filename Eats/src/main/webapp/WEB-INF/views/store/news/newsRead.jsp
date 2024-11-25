<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/store/storeContCss.css">

<meta charset="UTF-8">
<title>eats</title>

</head>
<body>
	<%@ include file="../store_Header.jsp"%>
	<%@ include file="../nav.jsp"%>
	 <div class="container" style="margin-top:150px; margin-left:100px; ">
		<div class="mainCont">

<div class="mainCon_800">
	<input type="hidden" name="news_idx" value="${news_idx}">
	
	<h2>소식 상세보기</h2>
	<c:if test="${empty data}">
		<span>등록된 소식이 없습니다.</span>
	</c:if>
	
	<c:if test="${not empty data}">
	
		<div style="text-align:right; margin-bottom:10px;">등록일 : ${data.s_news_date}</div>
		<div class="tableWrite_2 mb60">
			<table>
				<tr>
					<th class="th_center" colspan="2">${data.s_news_title}</th>
				</tr>
				<tr>
					<td>
						<span>
							<c:if test="${not empty data.s_news_img}">
								<img src="/img/storeNewsImg/${data.s_news_img}">
							</c:if>
							<c:if test="${empty data.s_news_img}">
								저장된 이미지가 없습니다.
							</c:if>
						</span>
					</td>
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
  		</div>
	</div>
</body>
</html>