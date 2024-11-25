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

<div class="mainCon_1400">
	
	<h2>소식 관리</h2>
	<div class="btnBox_top">
		<input type="button" class="btn_black" value="글쓰기" onclick="location.href='/store/storeNewsWrite'">
	</div>
	
	<form>
		<input type="hidden" name="store_idx" id="store_idx" value="${store_idx}">
		<div class="tableList mb60">
			<table>
				<thead>
					<tr>
						<th>no.</th>
						<th>소식제목</th>
						<th>등록일</th>
						<th>삭제여부</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
				
					<c:if test="${empty lists }">
						<tr>
							<td colspan="5" align="center">
								등록된 게시글이 없습니다.
							</td>
						</tr>
					</c:if>
					<c:if test="${!empty lists }">
						<c:forEach var="dto" items="${lists }">
							<tr>
								<td class="a_center">${dto.s_news_idx }</td>
								<td class="a_left30 ws600">${dto.s_news_title }</td>
								<td class="a_center">${dto.s_news_date }</td>
								<td class="a_center">
									<c:choose>
									    <c:when test="${dto.s_news_del != 'N'}">
									    	삭제완료
									    </c:when>
									    <c:otherwise>
									    	
									    </c:otherwise>
									</c:choose>
								</td>
								<td class="a_center">
									<input type="button" name="" id="" class="btn_skyblue" value="상세보기" onclick="location.href='/store/storeNewsRead?news_idx=${dto.s_news_idx }'">
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
		</div>
	</form>
</div>

		</div>
	</div>
</body>
</html>