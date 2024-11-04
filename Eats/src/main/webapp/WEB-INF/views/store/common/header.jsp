<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
	body {margin:0; padding:0; font-size:12px;}
	.header {width:100%; height:80px; background:#DAF0FF;}
	.contents {display: flex;}
	.contents > * {float:left;}
	.contents .leftMenu {width:200px; height: calc(100vh - 80px); background:#DAF0FF;}
	.contents .mainCont {width:calc(100% - 200px); padding:20px 30px;}
	
	.contents .mainCont .mainCon_1 {width:40%;}
	
	
	/* 이미지관리-저장버튼 박스 */
	.mainCon_1 .btnBox_top > * {float:right; margin-top:-40px;}
	
	
	
	/* 이미지관리-이미지등록테이블박스 */
	.mainCon_1 .tableWrite_2 {}
	.mainCon_1 .tableWrite_2 table {}
	.mainCon_1 .tableWrite_2 table tr {height:30px;}
	.mainCon_1 .tableWrite_2 table tr th {width:40%; text-align:right; padding-right:20px;}
	.mainCon_1 .tableWrite_2 table tr td {width:60%;}
	
	
	
	.mainCon_2 .mc2_imgBox {}
	.mainCon_2 .mc2_imgBox > span {display:inline-block; width:19%;}
	
	.mainCon_2 .mc2_imgBox span img {width:90%; margin:0 4%;}
	
	.mainCon_2 .mc2_imgBox > span > span {float:right; width:13%; font-size:20px;}
	/*
	.mainCon_2 .mc2_imgBox span input {width:26%; margin:0 37%;}
	*/
	
	/* 이미지관리 - 상단컨텐츠 박스 */
	.mb60 {margin-bottom:60px;}
	
	/* 이미지관리 - 저장버튼 */
	.btn_black {background:black; color:white; text-align:center; border:1px solid black; border-radius:5px; padding:5px 10px;}
	
	/* 이미지관리 - 삭제버튼 */
	.btn_gray {background:#ccc; color:black; text-align:center; border:1px solid #555; border-radius:5px; padding:5px 10px;}
	
</style>

<meta charset="UTF-8">
<title>eats</title>
</head>
<body>
	<div class="header">
	</div>
	<div class="contents">
		<div class="leftMenu">
		</div>
		<div class="mainCont">