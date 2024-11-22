<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header_cate.jsp"%>

<div class="mainCon_400">
	<form name="tagForm" id="tagForm" action="storeTagSave" method="post" onsubmit="return tag_count()">
	
		<input type="hidden" name="store_idx" id="store_idx" value="${store_idx}">
		<input type="hidden" name="cate_level" value=1>
			
		<h2>태그관리</h2>
		<div class="btnBox_top">
			<input type="submit" class="btn_black" value="저장">
		</div>

		<c:if test="${empty cateBigTitle }">
			등록된 카테고리가 존재하지 않습니다. 관리자에게 문의하세요.
		</c:if>
		
		<c:if test="${!empty cateBigTitle}">
		
            <div class="cateBox">
			    <!-- 대메뉴 출력 -->
		        <c:forEach var="cateBigTitle" items="${cateBigTitle}">
		            <!-- 대메뉴의 cate_key_idx를 추출 -->
		            <c:set var="cate_big_idx" value="${cateBigTitle.cate_key_idx}" />
		            <c:set var="cate_big_name" value="${cateBigTitle.cate_key_name}" /> <!-- 대메뉴 이름 (예: Electronics) -->
		
		            <div class="cateBox">
		                <div class="cb_top">
		                    <!-- 대메뉴 출력 -->
		                    <span>&lt; ${cate_big_name} &gt;</span>
		
		                    <!-- 소메뉴를 위한 select 박스 -->
		                    <select name="subcate_${cate_big_idx}" id="subcate_${cate_big_idx}" class="ml20" onchange="smallTagAdd(this)">
		                        <option value="">태그선택</option>
		                        <!-- list_option에서 각 대메뉴에 해당하는 소메뉴 목록을 가져옴 -->
		                        <c:forEach var="small_tag" items="${cateSmallData[cate_big_idx]}">
		                            <option value="${small_tag.cate_value_idx}" value2="${cateBigTitle.cate_key_idx}">
		                                ${small_tag.cate_value_name}
		                            </option>
		                        </c:forEach>
		                    </select>
		                </div>
		                
		                <div class="cb_bottom mt10 cbb_${cate_big_idx}">
							
							
							<c:if test="${!empty cate_data }">
								<c:forEach var="cate_data" items="${cate_data}">
								
									<c:if test="${cate_big_idx == cate_data.cate_key_idx }">
									
										<span class='mr10 small_tag_span_${cate_data.cate_idx}'>
											<span>${cate_data.cate_value_name}</span>
											<input type='hidden' name='store_cate_idx' id='' class='ws80' value='${cate_data.cate_idx}'>
											<input type='hidden' name='big_cate_key' id='' class='ws80' value='${cate_data.cate_key_idx}'>
											<input type='hidden' name='small_cate_key' id='' class='ws80' value='${cate_data.cate_value_idx}'>
											<span class='ml10 cspi' onclick="small_cate_del('${cate_data.cate_value_name}', ${cate_data.cate_idx})">X</span>
										</span>
									</c:if>
									
								</c:forEach>
							</c:if>
		                </div>
		            </div>
		        </c:forEach>    
			</div>
			
			
		</c:if>
		

	</form>
</div>
   
<%@include file="../common/footer.jsp"%>