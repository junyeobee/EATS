<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_800">
	<form name="" action="" method="post">
	
		<input type="hidden" name="store_idx" value="<%= storeIdx %>">
		
		<c:if test="${not empty lists}">	
			<h2>매장 그리드 설정</h2>
			
			<script>
				function grid_setting(){
					var tr = $('#tr').val();
					var td = $('#td').val();
				    
				    var tr_grid = "";
				    var td_grid = "";
			
				    var grid = "<table class='gridTable'>";
				    
				    for(var i=1; i<=tr; i++){
			
				    	grid += "<tr>";
				    	
					    for(var j=1; j<=td; j++){
					    	grid += "<td onclick='grid_part("+i+", "+j+")'>";
					    	//grid += tr+"//"+td;
					    	
					    	grid += "	<input type='text' name='' id='' class='' value='' placeholder='테이블번호입력'>";
					    	grid += "	<select name='' id='' class=''>";
					    	grid += "		<option value=''>테이블타입</option>";
					    	grid += "	</select>";
					    	grid += "	<select name='' id='' class=''>";
					    	grid += "		<option value=''>테이블인원</option>";
					    	grid += "	</select>";
					    	grid += i+"//"+j;
					    	
					    	grid += "</td>";
					    }
					    
					    grid += "</tr>";
				    }
				    grid += "</table>";
				    $('.gridBox').html(grid);
				}
				
				function grid_part(tr, td){
					//var num = parseFloat(tr) / parseFloat(td);
					var num = tr +"/"+ td;
				    //alert(num);
				}
			</script>
			
			<div>
				<span>행</span>
				<input type="text" name="" id="tr" class="ws50 a_center" value="">
				<span> X 열</span>
				<input type="text" name="" id="td" class="ws50 a_center" value="">
				
				<input type="button" class="btn_black ml20" value="그리드 확인" onclick="grid_setting()">
			</div>
			
			<hr>
			
			<div class="gridBox">
			</div>
			
		</c:if>
	</form>
</div>
   
<%@include file="../common/footer.jsp"%>