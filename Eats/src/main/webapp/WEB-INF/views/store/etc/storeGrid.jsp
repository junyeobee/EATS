<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header2.jsp"%>

<script>
	var gridData = [];  // gridData는 글로벌 변수로 설정하여 전체에서 접근할 수 있게 함.
	
	function grid_view() {
	    // 테이블 타입 select box 시작
	    var v_idx = $('#v_idx').val();
	    var v_name = $('#v_name').val();
	
	    const vidx_arr = v_idx.split(',');
	    const vname_arr = v_name.split(',');
	
	    //var table_type = "<option value=''>테이블타입</option>";
	    var table_type = "";
	    for(var i = 0; i < vidx_arr.length; i++) {
	        table_type += "<option value='" + vidx_arr[i] + "'>" + vname_arr[i] + "</option>";
	    }
	
	    // 테이블 정원 select box 시작
	    //var table_seat = "<option value=''>인원</option>"; 
	    var table_seat = "";
	    for(var i = 1; i <= 10; i++) {
	        table_seat += "<option value='" + i + "'>" + i + "</option>";
	    }
	
	    var tr = $('#id_tr').val();
	    var td = $('#id_td').val();
	    
	    var grid = "";
	    grid += "<table class='gridTable'>";
	    
	    var table_name = 0;
	
	    for (var i = 1; i <= tr; i++) {
	        grid += "<tr>";
	
	        for (var j = 1; j <= td; j++) {
	            grid += "<td onclick='grid_part("+i+", "+j+")'>";
	            
	            table_name = table_name + 1;
	            
	            grid += "<input type='number' name='sts["+i+","+j+"][tname]' class='mt10 mb10 a_center' value='"+table_name+"' placeholder='테이블번호(숫자만입력가능)' readonly>";
	            grid += "<br>";
	            grid += "<select name='sts["+i+","+j+"][type]' class='ws100'>";
	            grid += table_type;
	            grid += "</select>";
	            grid += "<select name='sts["+i+","+j+"][cnt]' class='ws60'>";
	            grid += table_seat;
	            grid += "</select>";
	            grid += "<input type='hidden' name='sts["+i+","+j+"][location]' value='"+i+","+j+"' />";
	            grid += "</td>";
	        }
	
	        grid += "</tr>";
	    }
	
	    grid += "</table>";
	    $('.gridBox').html(grid);
	    
	    $(".view_line").css("display", "block");
	    $(".view_btn").css("display", "block");
	}
	
	function grid_part(tr, td) {
	    var num = tr + "/" + td;
	}
	
	function grid_setting(date_check) {
		
		if(date_check > 0){
			confirm("기존 데이터는 삭제됩니다. 그리드를 수정하시겠습니까?") && grid_setting_delete();
			
		}else {
			grid_setting_action();
		}
	}
			
	function grid_setting_delete() {
		//alert("삭제처리먼저하고 저장");
		
		var store_idx = $("#store_idx").val();
		var sg_idx = $("#sg_idx").val();
		
		var dataToSend = {
		    store_idx: store_idx,
		    sg_idx: sg_idx
		};
		
	    $.ajax({
	        type: 'POST',
	        url: '/store/storeGridDelete',
	        contentType: 'application/json', 
	        data: JSON.stringify(dataToSend), 
	        success: function(response) {

	            if (response.success) {
	            	grid_setting_action();
	            } else {
	               alert("수정중 오류1: " + response.message);
	            }
	        },
	        error: function(error) {
	        	alert("수정중 오류2");
	        }
	    });
	}
	
	function grid_setting_action() {

	    gridData = [];  // 데이터를 초기화
	    
	    $('input[name^="sts["]').each(function(index) {
	    	
	        var tname = $(this).closest('td').find('input[name*="tname"]').val();
	        var type = $(this).closest('td').find('select[name*="type"]').val();
	        var cnt = $(this).closest('td').find('select[name*="cnt"]').val();
	        var location = $(this).closest('td').find('input[name*="location"]').val();
	        var row = location.split(',')[0];
	        var col = location.split(',')[1];
	        
	        var table = {
	            row: row,
	            col: col,
	            table_num: tname,
	            sts_type_idx: type,
	            sts_num: cnt,
	            sts_location: location
	        };
	        
	        var isDuplicate = gridData.some(function(item) {
	            return item.sts_location === table.sts_location; //중복체크
	        });

	        if (!isDuplicate) {
	            gridData.push(table);  // 중복이 없으면 배열에 추가
	        }
	    });

		console.log(gridData);	
		
		var store_idx = $("#store_idx").val(); 
		var tr = $("#id_tr").val(); 
		var td = $("#id_td").val(); 
		
		

		var dataToSend = {
		    store_idx: store_idx,
		    sg_row: tr,
		    sg_col: td,
		    gridData: gridData
		};

	    $.ajax({
	        type: 'POST',
	        url: '/store/storeGridSave',
	        contentType: 'application/json', 
	        data: JSON.stringify(dataToSend),
	        success: function(response) {

	            if (response.success) {
	            	alert("저장되었습니다.");
	                //alert("저장완료: " + response.message);
	                location.href="/store/storeGrid";
	            } else {
	            	alert("저장되지 않았습니다. 관리자에게 문의하세요.")
	                //alert("저장실패: " + response.message);
	            }
	        },
	        error: function(error) {
            	alert("저장되지 않았습니다. 관리자에게 문의하세요.")
	            //console.log("Error saving data:", error);
	        }
	    });
	}

</script>
		
		
		
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
			<div class="mainCon_1400">
				<input type="hidden" name="store_idx" id="store_idx" value="${store_idx}">
				<input type="hidden" name="sg_idx" id="sg_idx" value="${baseData.sg_idx}">
				
				<c:set var="v_idx" value="" /> <!-- v_idx 초기화 -->
				<c:set var="v_name" value="" /> <!-- v_idx 초기화 -->
				
				<c:forEach var="dto" items="${lists}">
				
					<!-- for 돌면서 2번째부터면 v_idx 붙여서 -->
					<c:if test="${not empty v_idx}">
						<c:set var="v_idx" value="${v_idx},${dto.cate_idx}" />
						<c:set var="v_name" value="${v_name},${dto.cate_value_name}" />
					</c:if>
				
					<!-- for 돌면서 처음이면 v_idx 없이 -->
					<c:if test="${empty v_idx}">
						<c:set var="v_idx" value="${dto.cate_idx}" />
						<c:set var="v_name" value="${dto.cate_value_name}" />
					</c:if>
				</c:forEach>
				
				<input type="hidden" name="" id="v_idx" value="${v_idx }" class="">
				<input type="hidden" name="" id="v_name" value="${v_name }" class="">
				
				<c:forEach var="viewDetail" items="${gridDetail}">
					<c:set var="sts_location" value="${viewDetail.sts_location}" />
					<c:set var="sts_idx" value="${viewDetail.sts_idx}" />
					<c:set var="sg_idx" value="${viewDetail.sg_idx}" />
					<c:set var="sts_location" value="${viewDetail.sts_location}" />
					<c:set var="table_num" value="${viewDetail.table_num}" />
					<c:set var="sts_type_idx" value="${viewDetail.sts_type_idx}" />
					<c:set var="sts_num" value="${viewDetail.sts_num}" />					
				</c:forEach>
				
				<h2>매장 그리드 설정</h2>
				<div>
					<span>행</span>				
					<c:if test="${baseData.sg_row == 0}">
						<input type="text" name="" id="id_tr" class="ws50 a_center" value="">
						<c:set var="view_yn" value="style='display:none;'" />
					</c:if>
					<c:if test="${baseData.sg_row != 0}">
						<input type="text" name="" id="id_tr" class="ws50 a_center" value="${baseData.sg_row}">
						<c:set var="view_yn" value="style='display:block;'" />
					</c:if>
					
					<span> X 열</span>
					<c:if test="${baseData.sg_col == 0}">
						<input type="text" name="" id="id_td" class="ws50 a_center" value="">
					</c:if>		
					<c:if test="${baseData.sg_col != 0}">
						<input type="text" name="" id="id_td" class="ws50 a_center" value="${baseData.sg_col}">
					</c:if>
					<input type="button" class="btn_black ml20" value="그리드 확인" onclick="grid_view()">
				</div>
				
				<hr class="view_line" ${view_yn}>
			
				<div class="gridBox">
					<!-- 그리드상세테이블의 제일 첫번째 행 기본키값 -->
					<input type="hidden" name="grid_detail_idx" value="${gridDetail[0].sts_idx}">
				
					<c:set var="tr_start" value="1" />
					<c:set var="tr_end" value="${baseData.sg_row}" />
					
					<c:set var="td_start" value="1" />
					<c:set var="td_end" value="${baseData.sg_col}" />
					
					
					<c:set var="for_num" value="0" />
					<c:set var="table_name" value="1" />
					
					<table class="gridTable">
						<c:forEach begin="${tr_start}" end="${tr_end}" var="tr" varStatus="tr_sta">
								
							<tr>
								<c:forEach begin="${td_start}" end="${td_end}" var="td" varStatus="td_sta">
									
									<!-- ${gridDetail[0].sts_location}를 위에서 선언해주지 않아도 페이지 로드시 갖고 넘어옴, 매칭만 해주면 됨 -->
								    <c:set var="combinedIndex" value="${tr_sta.index},${td_sta.index}" />
								    
								    <c:if test="${gridDetail[for_num].sts_location == combinedIndex}">
									    <td>
									    	<div>
												<input type="hidden" value="${gridDetail[for_num].sts_idx}">
											
									            
									            <c:if test="${gridDetail[for_num].table_num == 0}">
												    <!-- table_num이 0일 경우, 빈값으로 설정 -->
												    <c:set var="tableNum" value="" />
												</c:if>
												<c:if test="${gridDetail[for_num].table_num != 0}">
												    <!-- table_num이 0이 아닐 경우, 원래 값을 설정 -->
												    <c:set var="tableNum" value="${gridDetail[for_num].table_num}" />
												</c:if>
												
												<!-- input 필드에 tableNum을 value로 설정 -->
												<!-- 
												<input type="number" name="sts[${tr},${td}][tname]" class="mt10 mb10 a_center ws95p" value="${tableNum}" placeholder="테이블번호(숫자만입력가능)">
												 -->
												<input type="number" name="sts[${tr},${td}][tname]" class="mt10 mb10 a_center ws95p" value="${table_name}" readonly>
												<br>
									            
												<!-- 테이블 타입 select 박스 생성 -->
												<select id="table_type" name="sts[${tr},${td}][type]" class='ws100'>
													<!-- 
													<option value="">테이블타입</option>
													 -->
													<c:forEach var="dto" items="${lists}">														
														<option value="${dto.cate_idx}"
															<c:if test="${dto.cate_idx == gridDetail[for_num].sts_type_idx}">
													            selected
													        </c:if>
												        >
												        	${dto.cate_value_name}
												        </option>
													</c:forEach>
												</select>
												
												<!-- 테이블 정원 select 박스 생성 -->
												<select id="table_seat" name="sts[${tr},${td}][cnt]" class='ws60'>
												    <!-- <option value=''>인원</option> -->
												    <c:forEach var="i" begin="1" end="10">
												        <option value="${i}"
															<c:if test="${i == gridDetail[for_num].sts_num}">
													            selected
													        </c:if>
												        >
												        	${i}
												        </option>
												    </c:forEach>
												</select>
												
									            <input type='hidden' name="sts[${tr},${td}][location]" value='${gridDetail[for_num].sts_location}' />
									            <input type='hidden' name="sts[${tr},${td}][location]" value='${tr },${td }' />
										    </div>
										</td>
									    
									</c:if>
                					<c:set var="for_num" value="${for_num + 1}" />
                					<c:set var="table_name" value="${table_name + 1}" />
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</div>
					
				<input type="submit" class="btn_black ml20 view_btn" ${view_yn} value="그리드 설정" onclick="grid_setting(${for_num})" >
			</div>
   
<%@include file="../common/footer.jsp"%>