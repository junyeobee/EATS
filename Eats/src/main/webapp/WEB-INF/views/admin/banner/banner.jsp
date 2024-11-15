<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 목록</title>
</head>
<body>

	<table>
		<thead>
			<tr>
				<th>✅</th>
				<th>번호</th>
				<th>배너명</th>
				<th>배너url</th>
				<th>사용여부</th>
				<th>수정</th>
			</tr>
		</thead>
		
		<tbody>
		<c:if test="${empty lists }">
		
		 	<tr>
		 		<td>등록된 배너가 없습니다.</td>
		 	</tr>
		 
		</c:if>
		
		<c:forEach var="dto" items="${lists }">
			<tr>
			<td><input type="checkbox"></td>
			<td>${dto.banner_idx }</td>
			<td>${dto.banner_name }</td>
			<td>${dto.banner_url }</td>
			<c:if test="${dto.banner_stat ==1}">
			<td>사용</td>
			</c:if>
			
			<td><input type="button" value="수정"></td>
			</tr>
		</c:forEach>
		</tbody>

	</table>

</body>
</html>