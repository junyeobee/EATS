<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th, td, div, span, input, textarea{
	color:black;
}
.table-wrapper{
	width:100%;
	margin:30px auto;
}
.review-table{
	width:90%;
	margin:20px auto;
}
</style>
</head>
<body>
<%@include file="../store_Header.jsp" %>
<%@include file="../nav.jsp" %>
<div class="table-wrapper">
	<table class="review-table">
		<thead>
			<tr>
				<th>작성일</th>
				<th>작성자</th>
				<th>별점</th>
				<th>내용</th>
			</tr>	
		</thead>
		<tbody>
			<!-- foreach 돌릴 부분 -->
		</tbody>
	</table>
	<div class="paging">
	123
	</div>
</div>
</body>
</html>