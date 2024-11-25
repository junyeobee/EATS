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

	<c:if test="${empty data}">
		<form name="storeNewsSave" action="storeNewsSave" method="post" enctype="multipart/form-data">
			<input type="hidden" name="store_idx" id="store_idx" value="${sessionScope.storeIdx}">
			<input type="hidden" name="s_news_del" id="" value="N">
		
			<h2>소식 글쓰기</h2>
		
			<div class="tableWrite_2 mb60">
				<table>
					<tr>
						<th class="th_center" colspan="2">
							<input type="text" name="s_news_title" class="ws400 tac" id="" value="" placeholder="소식 제목을 입력해주세요.">
						</th>
					</tr>
					<tr>
						<th class="th_center" colspan="2">
							<span class="img_th_span">
								등록 이미지 : 
								<input type="file" name="s_news_img" id="" class="" value="">
							</span>
						</th>
					</tr>
					<tr>
						<td>
							<textarea name="s_news_content" style="height:220px; height:600px; padding:10px; " placeholder="내용을 입력해주세요"></textarea>
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
	
		<form name="storeNewsUpdate" action="storeNewsUpdate" method="post" enctype="multipart/form-data">
			<input type="hidden" name="store_idx" id="" value="1">			
			<input type="hidden" name="s_news_idx" value="${news_idx}">
		
			<h2>소식 수정하기</h2>
		
			<div class="tableWrite_2 mb60">
				<table>
					<tr>
						<th class="th_center" colspan="2">
							<input type="text" name="s_news_title" class="ws400 tac" id="" value="${data.s_news_title}">
						</th>
					</tr>
					<tr>
						<th class="th_center" colspan="2">
							<span class="img_th_span">
								수정할 이미지 : 
								<input type="file" name="s_news_img" id="" class="" value="${data.s_news_img}">
							</span>
						</th>
					</tr>
					<tr>
						<th class="th_right"><div class="mt50">현재 이미지</div></th>
						<th class=""><div class="mt50">내용</div></th>
					</tr>
					<tr>
						<td style="width:50px;">
								<c:if test="${empty data.s_news_img}">
									<div style="width:640px; height:420px; border:1px solid gray; text-align:center; line-height:420px;">저장된 이미지가 없습니다.</div>
								</c:if>
								<c:if test="${not empty data.s_news_img}">
									<img src="/img/storeNewsImg/${data.s_news_img}">
								</c:if>
						</td>
						<td>
							<textarea name="s_news_content" style="height:220px; height:400px; padding:10px;">${data.s_news_content}</textarea>
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
  
   		</div>
	</div>
</body>
</html>