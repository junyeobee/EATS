<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_400">
	<form name="infoUpdateReq" action="storeInfoUpdateReqSave" method="post">
	
		<input type="hidden" name="store_idx" value="<%= storeIdx %>">
			
		<h2>태그관리</h2>
		<div class="btnBox_top">
			<input type="submit" class="btn_black" value="저장">
		</div>
		
		

		<c:if test="${empty list_key }">
			등록된 카테고리가 존재하지 않습니다. 관리자에게 문의하세요.
		</c:if>
		
		<c:if test="${!empty list_key}">
    <!-- main_arr를 빈 ArrayList로 초기화 -->
    <c:set var="main_arr" value="[]"/>

    <!-- listMap을 순회 -->
    <c:forEach var="entry" items="${listMap}">
        <c:set var="listValue" value="${entry.value}" />
    
        <!-- entry.key로 cate_key_idx 확인 -->
        <c:set var="cateKey" value="${entry.key}" />
        
        <c:if test="${!empty listValue}">
            <div class="cateBox">
                <div class="cb_top">
                    <span>&lt; ${cateKey} &gt;</span>

                    <input type="hidden" name="cate_key_idx" value="${cateKey}" class="ws80">

                    <select name="" id="" class="ml20">
                        <option value="">태그선택</option>
                        <c:forEach var="tag" items="${listValue}">
                            <option value="${tag.cate_value_idx}">${tag.cate_key_idx}////${tag.cate_value_idx}////${tag.cate_value_name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="cb_bottom mt10">
                    <span>
                        <span>태그1</span>
                        <span class="ml10 cspi">X</span>
                    </span>
                    <span>
                        <span>태그2</span>
                        <span class="ml10 cspi">X</span>
                    </span>
                    <span>
                        <span>태그3</span>
                        <span class="ml10 cspi">X</span>
                    </span>
                </div>
            </div>
        </c:if>

        <!-- main_arr에 cateKey 값을 배열처럼 추가 -->
        <c:set var="main_arr" value="${fn:concat(main_arr, [cateKey])}" />
    </c:forEach>

    <!-- main_arr 배열 출력 (디버깅용) -->
    <c:forEach var="item" items="${main_arr}">
        <p>${item}</p>
    </c:forEach>
    
    확인1-2
    <c:forEach var="item" items="${mainArr}">
	    <p>${item}</p>  <!-- 배열의 값을 출력 -->
	</c:forEach>
	
	
	
	확인2	
	<c:set var="main_arr" value=""/>
	
	<c:forEach var="data_key" items="${list_key}">
	    <!-- main_arr에 cate_key_name 값을 추가 -->
	    <c:set var="main_arr" value="${main_arr} ${data_key.cate_key_name}"/>
	</c:forEach>
	
	<!-- main_arr 출력 -->
	<p>${main_arr}</p>
		
	
	
	확인3
	<c:set var="main_arr" value="" />
		
	<c:forEach var="data_key" items="${list_key}">
	    <c:if test="${!empty main_arr}">
	        <!-- main_arr가 비어있지 않다면 구분자 추가 (예: 공백, 쉼표 등) -->
	        <c:set var="main_arr" value="${main_arr} ${data_key.cate_key_name}" />
	    </c:if>
	    <c:if test="${empty main_arr}">
	        <!-- main_arr가 처음 시작하는 부분 -->
	        <c:set var="main_arr" value="${data_key.cate_key_name}" />
	    </c:if>
	</c:forEach>
	
	<!-- main_arr 출력 -->
	<p>${main_arr}</p>
	
	
	
	
	확인4
	<c:set var="main_arr" value=""/>
	
	<c:forEach var="data_key" items="${list_key}">
	    <c:if test="${!empty main_arr}">
	        <c:set var="main_arr" value="${main_arr}, ${data_key.cate_key_name}" />
	    </c:if>
	    <c:if test="${empty main_arr}">
	        <c:set var="main_arr" value="${data_key.cate_key_name}" />
	    </c:if>
	</c:forEach>
	
	<!-- main_arr 출력 -->
	<p>${main_arr}</p>
		
		
	확인5
	<!-- mainArr을 바로 출력 -->
	<p>${mainArr}</p>
	
	
    
</c:if>
		

		
	</form>
</div>
   
<%@include file="../common/footer.jsp"%>