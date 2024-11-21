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
			<span class="big_title">
				<a href="#">매장관리</a>
			</span>
			<span class="small_title">
				<a href="/store/storeImage">이미지관리</a>
			</span>
			<span class="small_title">
				<a href="/store/storeCateOne">태그관리</a>
			</span>
			<span class="small_title">
				<a href="/store/storeInfoUpdateReq">정보수정신청</a>
			</span>
			<span class="small_title">
				<a href="/store/storeTime">영업시간수정</a>
			</span>
			<span class="small_title">
				<a href="/store/storeCateTwo">특징관리</a>
			</span>
			<span class="small_title">
				<a href="/store/storeGrid">매장그리드</a>
			</span>
			<span class="small_title">
				<a href="/store/storeNewsList">소식관리</a>
			</span>
		</div>
		<div class="mainCont">