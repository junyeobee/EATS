<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_800">
	<form name="" action="" method="post">
	
		<input type="hidden" name="store_idx" value="<%= storeIdx %>">
		<h2>운영설정</h2>
		<div class="btnBox_top">
			<input type="submit" class="btn_black" value="수정요청">
		</div>
		<div class="tableWrite_4 mb60">
			<table>
			</table>
		</div>
	</form>
</div>
   
<%@include file="../common/footer.jsp"%>