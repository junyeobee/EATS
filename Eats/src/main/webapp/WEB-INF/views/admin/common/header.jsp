<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- noto sans kr font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/manager/headerCss.css">
<link rel="stylesheet" href="/css/manager/navigationCss.css">
<link rel="stylesheet" href="/css/manager/storeCss.css">

<script type="text/javascript" src="/js/ajaxJs.js"></script>
<script type="text/javascript" src="/js/adminScript.js"></script>

<style>
a, button, input, select, h1, h2, h3, h4, h5, * {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border: none;
	text-decoration: none;
	background: none;
	-webkit-font-smoothing: antialiased;
}

menu, ol, ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}


.body_box {
	width: 1440px;
	margin: 0 auto;
	display: flex;
	flex-direction: row;
}

.my_contents {
	overflow: auto;
	font-family: "Noto Sans KR", sans-serif;
	width: 1240px;
	/*
	height:100%;
	*/
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 45px;
	row-gap: 25px;
}
</style>

<title>eats</title>
</head>

<body>

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
	<%@ include file="/layout_component/header.jsp"%>
	<div class="body_box" id="body_box">
		<%@ include file="/layout_component/navigation.jsp"%>
		<div class="my_contents" id="my_contents">
