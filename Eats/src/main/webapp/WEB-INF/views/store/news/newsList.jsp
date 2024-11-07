<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_1400">
	<input type="text" name="store_idx" id="" value="1">
	<h2>소식 관리</h2>
	<div class="btnBox_top">
		<input type="button" class="btn_black" value="글쓰기" onclick="location.href='/store/storeNewsWrite'">
	</div>
	
	<form>
	
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
								<td class="a_left ws800">${dto.s_news_title }</td>
								<td class="a_center">${dto.s_news_date }</td>
								<td class="a_center">
									${dto.s_news_del }
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
			<div class="listPaging">
				<span> ◀ </span>
				<span>1</span>
				<span>2</span>
				<span>3</span>
				<span>4</span>
				<span>5</span>
				<span> ▶ </span>
			</div>
		</div>
	</form>
</div>
   
<%@include file="../common/footer.jsp"%>