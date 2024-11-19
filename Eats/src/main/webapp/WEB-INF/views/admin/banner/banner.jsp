<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 목록</title>
<style>
body{
	width:50%;
	margin:100px auto;
}
/* 테이블 기본 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    margin: 20px 0;
}

/* 헤더 스타일 */
thead th {
    padding: 15px;
    background-color: #f8f9fa;
    border-top: 1px solid #dee2e6;
    border-bottom: 1px solid #dee2e6;
    text-align: left;
    font-weight: normal;
    color: #333;
}

/* 바디 스타일 */
tbody td {
    padding: 15px;
    border-bottom: 1px solid #dee2e6;
    color: #333;
}

/* 체크박스 스타일 */
input[type="checkbox"] {
    width: 16px;
    height: 16px;
    cursor: pointer;
}

/* 수정 버튼 스타일 */
input[type="button"] {
    background-color: #349FFB;
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 4px;
    cursor: pointer;
}

/* 데이터 없을 때 스타일 */
.no-data td {
    text-align: center;
    padding: 30px 0;
    color: #666;
}

/* 상단 버튼 영역 */
.button-group {
    text-align: right;
    margin: 20px 0;
}

.button-group button {
    padding: 8px 20px;
    margin-left: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.btn-delete {
    background-color: #6c757d;
    color: white;
}

.btn-register {
    background-color: #349FFB;
    color: white;
}
</style>
</head>

<body>

<h2>배너 관리</h2>
<div class="button-group">
    <button class="btn-delete">선택삭제</button>
    <button class="btn-register"><a href="/bannerInsert">등록하기</a></button>
</div>
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
			<c:if test="${dto.banner_stat ==2}">
			<td>사용안함</td>
			</c:if>
			
			<td><input type="button" value="수정"></td>
			</tr>
		</c:forEach>
		
		</tbody>

	</table>

</body>
</html>