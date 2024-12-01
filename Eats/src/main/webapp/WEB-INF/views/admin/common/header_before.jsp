<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/manager/storeCss.css">

<meta charset="UTF-8">
<title>eats</title>

<%
	//String admin_idx = (String) session.getAttribute("admin_idx");
	//int admin_idx = (int)session.getAttribute("admin_idx");
	int admin_idx = 1;

	if (admin_idx == 0) {
%>
		<script type="text/javascript">
			//alert("로그인해주세요!");
			//window.location.href = "/login";	//로그인페이지로 설정필요
		</script>
<%
	}
%>

</head>
<body>
	<div class="header">
	</div>
	<div class="contents">
		<div class="leftMenu">
		</div>
		<div class="mainCont">