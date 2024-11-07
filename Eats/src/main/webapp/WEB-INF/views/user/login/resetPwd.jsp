<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	font-family: "Noto Sans KR", sans-serif;
}
form{
	margin:100px auto;
	border:2px solid #FFB53C;
	border-radius:10px;
	background-color:#FFF8EB;
	text-align:center;
	width:50%;
	height:350px;
	display: flex;
    flex-direction: column;
    justify-content: center;
    font-family: "Noto Sans KR", sans-serif;
}
.logo-wrapper{
	width:20%;
	margin:20px auto;
	text-align:center;
}
.logo-wrapper img{
	width:150px;
}
.title-wrapper{
	color:#FFB53C;
}
.content-wrapper{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
input[type="text"]{
	width: 300PX;
    padding: 15px 0;
    border: 1px solid #FFB53C;
    height: 30px;
    border-radius: 5px;
    padding: 10px 5px 10px 10px;
    color: #1E1E1E;
    font-family: "Noto Sans KR", sans-serif;
}
input[type="submit"]{
	font-size: 15px;
    padding: 20px 10px;
    margin: 20px 0px;
    border-radius: 5px;
    border: 0;
    font-family: "Noto Sans KR", sans-serif;
	background-color:#FFB53C;
	color:#FFF8EB;
	border:0;
	width:315PX;
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
</head>
<body>
<c:if test="${empty session.userId }">
<script type="text/javascript">
	alert("잘못된 접근입니다.");
	window.location.href = "/";
</script>
</c:if>
<form name="pwdResetForm" action="userResetPwd" method="post">
<div class="logo-wrapper">
	<a href="/"><img src="img/eats_logo.png"></a>
</div>

<div class="title-wrapper">
	<h3></h3>
</div>
<div class="content-wrapper">
	<input type="text" name="newPwd" placeholder="새로운 비밀번호를 입력해주세요">
	<input type="submit" value="재설정">
</div>
</form>
</body>
</html>