<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- noto sans kr font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/user/showIdCSS.css">
<body>
<c:if test="${empty session.userId }">
<script type="text/javascript">
	alert("잘못된 접근입니다.");
	window.location.href = "/";
</script>
</c:if>
<div class="id-show-wrapper">
	<div class="logo-wrapper">
		<img src="img/eats_logo.png">
	</div>
	<div class="id-wrapper">
		<h3>아이디는</h3>
		<h1>${userId }</h1>
		<p>입니다</p>
	</div>
</div>
</body>
</html>