<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_1400">
	<form name="imgSave" action="imgSave" method="post">
		<input type="text" name="store_idx" id="" value="1">
		<h2>소식 관리</h2>
		<div class="btnBox_top">
			<input type="button" class="btn_black" value="글쓰기" onclick="location.href='/store/storeNewsWrite'">
		</div>
		<div class="tableList mb60">
			<table>
				<thead>
					<tr>
						<th>no.</th>
						<th>소식내용</th>
						<th>등록일</th>
						<th>삭제여부</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="a_center">1</td>
						<td class="a_left ws800">매장명</td>
						<td class="a_center">2000-01-01</td>
						<td class="a_center">삭제</td>
						<td class="a_center">
							<input type="button" name="" id="" class="btn_skyblue" value="상세보기" onclick="location.href='/store/storeNewsRead'">
						</td>
					</tr>
					<tr>
						<td class="a_center">1</td>
						<td class="a_left ws800">매장명</td>
						<td class="a_center">2000-01-01</td>
						<td class="a_center">삭제</td>
						<td class="a_center">
							<input type="button" name="" id="" class="btn_skyblue" value="상세보기" onclick="">
						</td>
					</tr>
					<tr>
						<td class="a_center">1</td>
						<td class="a_left ws800">매장명</td>
						<td class="a_center">2000-01-01</td>
						<td class="a_center">삭제</td>
						<td class="a_center">
							<input type="button" name="" id="" class="btn_skyblue" value="상세보기" onclick="">
						</td>
					</tr>
					<tr>
						<td class="a_center">1</td>
						<td class="a_left ws800">매장명</td>
						<td class="a_center">2000-01-01</td>
						<td class="a_center">삭제</td>
						<td class="a_center">
							<input type="button" name="" id="" class="btn_skyblue" value="상세보기" onclick="">
						</td>
					</tr>
					<tr>
						<td class="a_center">1</td>
						<td class="a_left ws800">매장명</td>
						<td class="a_center">2000-01-01</td>
						<td class="a_center">삭제</td>
						<td class="a_center">
							<input type="button" name="" id="" class="btn_skyblue" value="상세보기" onclick="">
						</td>
					</tr>
					<tr>
						<td class="a_center">1</td>
						<td class="a_left ws800">매장명</td>
						<td class="a_center">2000-01-01</td>
						<td class="a_center">삭제</td>
						<td class="a_center">
							<input type="button" name="" id="" class="btn_skyblue" value="상세보기" onclick="">
						</td>
					</tr>
					<tr>
						<td class="a_center">1</td>
						<td class="a_left ws800">매장명</td>
						<td class="a_center">2000-01-01</td>
						<td class="a_center">삭제</td>
						<td class="a_center">
							<input type="button" name="" id="" class="btn_skyblue" value="상세보기" onclick="">
						</td>
					</tr>
					<tr>
						<td class="a_center">1</td>
						<td class="a_left ws800">매장명</td>
						<td class="a_center">2000-01-01</td>
						<td class="a_center">삭제</td>
						<td class="a_center">
							<input type="button" name="" id="" class="btn_skyblue" value="상세보기" onclick="">
						</td>
					</tr>
					<tr>
						<td class="a_center">1</td>
						<td class="a_left ws800">매장명</td>
						<td class="a_center">2000-01-01</td>
						<td class="a_center">삭제</td>
						<td class="a_center">
							<input type="button" name="" id="" class="btn_skyblue" value="상세보기" onclick="">
						</td>
					</tr>
					<tr>
						<td class="a_center">1</td>
						<td class="a_left ws800">매장명</td>
						<td class="a_center">2000-01-01</td>
						<td class="a_center">삭제</td>
						<td class="a_center">
							<input type="button" name="" id="" class="btn_skyblue" value="상세보기" onclick="">
						</td>
					</tr>
				</tbody>
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