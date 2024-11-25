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
	margin-top : 80px;
	margin-left : 240px;
}
.review-table{
	width:90%;
	margin:20px auto;
}
</style>

<script src = "../js/ajaxJs.js"></script>
<script>
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var jsondata=JSON.parse(data);
			alert(jsondata.user_name);
		}
	}
}
function showDetail(i){
	var params='rev_idx='+i;
	sendRequest('/store/review/detail', params, showResult, 'get');
}
</script>
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
			<c:if test = "${empty lists }">
				<tr>
					<td colspan= "4">없어요</td>
				</tr>
			</c:if>
			<c:forEach items="${lists }" var="dto">
				<tr onclick = "showDetail(${dto.rev_idx})">
					<td>${dto.rev_writedate.split(" ")[0] }</td>
					<td>${dto.user_nickname }</td>
					<td>${dto.rev_score }</td>
					<td>${dto.rev_content }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="paging">
	123
	</div>
	<dialog id = "detailPage">
		
	</dialog>
</div>
</body>
</html>