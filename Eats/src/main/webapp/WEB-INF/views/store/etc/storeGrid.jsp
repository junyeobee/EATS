<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header2.jsp"%>
			
			<script>

			/*
		    var gridData = [];		
				function grid_view(){
					
				    //테이블 타입 select box 시작
				    var v_idx = $('#v_idx').val();
				    var v_name = $('#v_name').val();
				    
					const vidx_arr = v_idx.split(',');
					const vname_arr = v_name.split(',');

				    //document.writeln(vidx_arr.length);
				    //console.log(vidx_arr.length);
				    
				    var table_type = "<option value=''>테이블타입</option>";				    
				    for(var i=0; i<vidx_arr.length; i++){
				    	
				    	table_type += "<option value='"+vidx_arr[i]+"'>"+vname_arr[i]+"</option>";
					    //console.log(vidx_arr[i]);
					    //console.log(vname_arr[i]);
				    }
				    //테이블 타입 select box 종료
				    
				    //테이블 정원 select box 시작
				    var table_seat = "<option value=''>인원</option>";	
				    for(var i=1; i<=10; i++){
				    	
				    	table_seat += "<option value='"+i+"'>"+i+"</option>";
					    //console.log(vidx_arr[i]);
					    //console.log(vname_arr[i]);
				    }
				    //테이블 정원 select box 종료
				    
				    
					var tr = $('#tr').val();
					var td = $('#td').val();
				    
				    var tr_grid = "";
				    var td_grid = "";
				    	
				    var grid = "<table class='gridTable'>";
				    				    
				    for(var i=1; i<=tr; i++) {
			
				    	grid += "<tr>";
				    	
					    for(var j=1; j<=td; j++){
					    	grid += "<td onclick='grid_part("+i+", "+j+")'>";
					    	//grid += tr+"//"+td;
					    	
					    	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
					    	grid += "	<input type='text' name='sts_name[][]' id='' class='mt10 mb10 a_center' value='' placeholder='테이블번호입력'>";
					    	grid += "	<br>";
					    	grid += "	<select name='sts_type_idx[][]' id='' class='ws100'>";
					    	//grid += "		<option value=''>테이블타입</option>";
					    	grid += 		table_type;
					    	grid += "	</select>";
					    	grid += "	<select name='sts_num[][]' id='' class='ws60'>";
					    	//grid += "		<option >테이블인원</option>";
					    	grid +=			table_seat;
					    	grid += "	</select>";
					    	grid += "	<input type='text' name='sts_location[][]' id='' value='"+i+","+j+"'";
					    	////////////////////////////////////////////////////////////////////////////////////////////////////////////
					    	
					    	
					    	grid += "	<input type='text' name='sts["+i+","+j+"][name]' id='' class='mt10 mb10 a_center' value='' placeholder='테이블번호입력'>";
					    	grid += "	<br>";
					    	grid += "	<select name='sts["+i+","+j+"][type]' id='' class='ws100'>";
					    	//grid += "		<option value=''>테이블타입</option>";
					    	grid += 		table_type;
					    	grid += "	</select>";
					    	grid += "	<select name='sts["+i+","+j+"][cnt]' id='' class='ws60'>";
					    	//grid += "		<option >테이블인원</option>";
					    	grid +=			table_seat;
					    	grid += "	</select>";
					    	grid += "	<input type='text' name='sts["+i+","+j+"][location]' id='' value='"+i+","+j+"'";
					    	
					    	grid += "</td>";

				            var table = {
				                row: i,
				                col: j,
				                name: $("input[name='sts["+i+","+j+"][name]']").val(),
				                type: $("select[name='sts["+i+","+j+"][type]']").val(),
				                seat: $("select[name='sts["+i+","+j+"][cnt]']").val(),
				                location: $("input[name='sts["+i+","+j+"][location]']").val()
				            };
				            gridData.push(table);
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
				
				function grid_setting(){


				    // Send the grid data as a JSON object to the server
				    $.ajax({
				        type: 'POST',
				        url: '/store/storeGridSave',
				        contentType: 'application/json',
				        data: JSON.stringify(gridData),  // Convert the data to JSON string
				        success: function(response) {
				            console.log("Data saved successfully:", response);
				        },
				        error: function(error) {
				            console.log("Error saving data:", error);
				        }
				    });
				}
				*/
			</script>
		
		
		
			<script>
			var gridData = [];  // gridData는 글로벌 변수로 설정하여 전체에서 접근할 수 있게 함.

			function grid_view() {
			    // 테이블 타입 select box 시작
			    var v_idx = $('#v_idx').val();
			    var v_name = $('#v_name').val();

			    const vidx_arr = v_idx.split(',');
			    const vname_arr = v_name.split(',');

			    var table_type = "<option value=''>테이블타입</option>"; 
			    for(var i = 0; i < vidx_arr.length; i++) {
			        table_type += "<option value='" + vidx_arr[i] + "'>" + vname_arr[i] + "</option>";
			    }

			    // 테이블 정원 select box 시작
			    var table_seat = "<option value=''>인원</option>"; 
			    for(var i = 1; i <= 10; i++) {
			        table_seat += "<option value='" + i + "'>" + i + "</option>";
			    }

			    var tr = $('#id_tr').val();
			    var td = $('#id_td').val();

			    var grid = "<input type='text' name='grid_detail_iadfasdfdx'>";
			    grid += "<table class='gridTable'>";

			    for (var i = 1; i <= tr; i++) {
			        grid += "<tr>";

			        for (var j = 1; j <= td; j++) {
			            grid += "<td onclick='grid_part("+i+", "+j+")'>";
			            
			            grid += "<input type='text' name='sts["+i+","+j+"][tname]' class='mt10 mb10 a_center' value='' placeholder='테이블번호입력'>";
			            grid += "<br>";
			            grid += "<select name='sts["+i+","+j+"][type]' class='ws100'>";
			            grid += table_type;
			            grid += "</select>";
			            grid += "<select name='sts["+i+","+j+"][cnt]' class='ws60'>";
			            grid += table_seat;
			            grid += "</select>";
			            grid += "<input type='text' name='sts["+i+","+j+"][location]' value='"+i+","+j+"' />";
			            grid += "</td>";
			        }

			        grid += "</tr>";
			    }

			    grid += "</table>";
			    $('.gridBox').html(grid);

			    // 테이블 그리기 후에 gridData를 업데이트
			    //updateGridData(1);  // 여기서만 한 번만 호출
			}

			function grid_part(tr, td) {
			    var num = tr + "/" + td;
			}

			// gridData 업데이트 함수
			/*
			function updateGridData(num) {
			    gridData = [];  // 이전 데이터를 초기화

			    // 각 테이블 셀에 대한 값을 gridData에 추가
			    $('input[name^="sts["]').each(function() {
			        var tname = $(this).closest('td').find('input[name*="tname"]').val();
			        var type = $(this).closest('td').find('select[name*="type"]').val();
			        var cnt = $(this).closest('td').find('select[name*="cnt"]').val();
			        var location = $(this).closest('td').find('input[name*="location"]').val();
			        var row = location.split(',')[0];
			        var col = location.split(',')[1];

			        var table = {
			            row: row,
			            col: col,
			            tname: tname,
			            type: type,
			            seat: cnt,
			            location: location
			        };

			        gridData.push(table);  // gridData 배열에 테이블 정보 추가
			    });

			    if(num > 1){

				    // 데이터가 정상적으로 업데이트되었는지 확인
				    console.log(gridData);	
			    }
			}
			*/

			function grid_setting(date_check) {
				
				alert(date_check);
				if(date_check > 0){
					
					//confirm("기존 데이터는 삭제됩니다. 그리드를 수정하시겠습니까?") ? grid_setting_actiondddd() : cancelItem();
					confirm("기존 데이터는 삭제됩니다. 그리드를 수정하시겠습니까?") && grid_setting_actiondddd();
					//grid_setting_action();
				}
			}
			
			
			function grid_setting_actiondddd() {
				alert("수정하기");
			}
			function cancelItem() {
				alert("수정안하기");
			}

			function grid_setting_action() {

			    gridData = [];  // 이전 데이터를 초기화
			    
			    // 각 테이블 셀에 대한 값을 gridData에 추가
			    //$('input[name^="sts["]').each(function() { //index써주지않으면 2번호출, 
			    	//이 코드는 input[name^="sts["] 요소를 모두 찾아서 각 요소에 대해 each()를 실행합니다. 이때 DOM 요소가 여러 번 렌더링되었거나 중복된 요소가 있으면, 그만큼 each()가 두 번 이상 실행됩니다.
			    		
			    $('input[name^="sts["]').each(function(index) {
			    	//이 경우 index를 사용하여 각 요소가 몇 번째인지 추적할 수 있고, 중복된 요소가 있더라도, 순차적으로 실행되도록 하기 때문에 문제가 해결될 수 있습니다.
			    	
			        var tname = $(this).closest('td').find('input[name*="tname"]').val();
			        var type = $(this).closest('td').find('select[name*="type"]').val();
			        var cnt = $(this).closest('td').find('select[name*="cnt"]').val();
			        var location = $(this).closest('td').find('input[name*="location"]').val();
			        var row = location.split(',')[0];
			        var col = location.split(',')[1];
			        
			        var table = {
			            row: row,
			            col: col,
			            sts_name: tname,
			            sts_type_idx: type,
			            sts_num: cnt,
			            sts_location: location
			        };
			        
			     // 중복 확인 (예: 동일한 위치에 데이터가 이미 존재하는지 체크)
			        var isDuplicate = gridData.some(function(item) {
			            return item.sts_location === table.sts_location;  // location을 기준으로 중복 체크
			        });

			        if (!isDuplicate) {
			            gridData.push(table);  // 중복이 없으면 배열에 추가
			        }

			        //gridData.push(table);  // gridData 배열에 테이블 정보 추가
			    });

				// 데이터가 정상적으로 업데이트되었는지 확인
				console.log(gridData);	
				
				var store_idx = $("#store_idx").val();  // store_idx 값
				var tr = $("#id_tr").val();          // 선택한 행 번호
				var td = $("#id_td").val();          // 선택한 열 번호

				alert(store_idx);
				alert(tr);
				alert(td);

				// gridData에 store_idx, row, col 값을 추가
				var dataToSend = {
				    store_idx: store_idx,
				    sg_row: tr,
				    sg_col: td,
				    gridData: gridData // 기존 gridData 포함
				};

			    // Send the grid data as a JSON object to the server
			    $.ajax({
			        type: 'POST',
			        url: '/store/storeGridSave',
			        contentType: 'application/json', 
			        data: JSON.stringify(dataToSend),  // Convert the data to JSON string
			        success: function(response) {

			            if (response.success) {
			                alert("저장완료: " + response.message);
			            } else {
			                alert("저장실패: " + response.message);
			            }
			        	//alert("저장완료");
			            //console.log("Data saved successfully:", response);
			        },
			        error: function(error) {
			        	alert("저장실패");
			            //console.log("Error saving data:", error);
			        }
			    });
			    //console.log(JSON.stringify(gridData));
			}

</script>
		
		
		
</head>
<body>
	<div class="header">
	</div>
	<div class="contents">
		<div class="leftMenu">
		</div>
		<div class="mainCont">	
			<div class="mainCon_1400">
				<!-- 
				<form name="storeGridSave" action="storeGridSave" method="post">
				-->
				
				<!-- 
					<input type="text" name="store_idx" id="store_idx" value="<%= storeIdx %>">
					 -->
					<input type="text" name="store_idx" id="store_idx" value="6">
					
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
						
						cate_value_idx >>>> ${dto.cate_value_idx}<br>
						cate_value_name >>>> ${dto.cate_value_name}<br>
					</c:forEach>
					
					<!-- 구분자가 추가된 최종 결과 -->
					v_idx >>>> ${v_idx}
					<input type="text" name="" id="v_idx" value="${v_idx }" class="">
					<input type="text" name="" id="v_name" value="${v_name }" class="">
					
					
					<c:forEach var="viewDetail" items="${gridDetail}">
					
					
						<c:set var="sts_location" value="${viewDetail.sts_location}" />
						
						
						<c:set var="sts_idx" value="${viewDetail.sts_idx}" />
						<c:set var="sg_idx" value="${viewDetail.sg_idx}" />
						<c:set var="sts_location" value="${viewDetail.sts_location}" />
						<c:set var="sts_name" value="${viewDetail.sts_name}" />
						<c:set var="sts_type_idx" value="${viewDetail.sts_type_idx}" />
						<c:set var="sts_num" value="${viewDetail.sts_num}" />
						
						<p>
							sts_idx: ${sts_idx}, sg_idx: ${sg_idx}, sts_location: ${sts_location}, 
							sts_name: ${sts_name}, sts_type_idx: ${sts_type_idx}, sts_num: ${sts_num}
						</p>
						
						
					</c:forEach>
					
					
					
					<h2>매장 그리드 설정</h2>
					
						<div>
							<span>행</span>				
							<c:if test="${baseData.sg_row == 0}">
								<input type="text" name="" id="id_tr" class="ws50 a_center" value="">
							</c:if>
							<c:if test="${baseData.sg_row != 0}">
								<input type="text" name="" id="id_tr" class="ws50 a_center" value="${baseData.sg_row}">
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
					
					
					
						<hr>
						
						<div class="gridBox">
							<c:if test="${gridDetail[0].sts_idx != 0 || gridDetail[0].sts_idx != null}">
						

								<!-- 그리드상세테이블의 제일 첫번째 행 기본키값 -->
								<input type="text" name="grid_detail_idx" value="${gridDetail[0].sts_idx}">
							
								<c:set var="tr_start" value="1" />
								<c:set var="tr_end" value="${baseData.sg_row}" />
								
								<c:set var="td_start" value="1" />
								<c:set var="td_end" value="${baseData.sg_col}" />
								
								
								
								<c:set var="for_num" value="0" />
								
								<table class="gridTable">
									<c:forEach begin="${tr_start}" end="${tr_end}" var="tr" varStatus="tr_sta">
									
										<tr>
										<c:forEach begin="${td_start}" end="${td_end}" var="td" varStatus="td_sta">
										
										
											<!-- ${gridDetail[0].sts_location}를 위에서 선언해주지 않아도 페이지 로드시 갖고 넘어옴, 매칭만 해주면 됨 -->
										    ${gridDetail[for_num].sts_location}
										    <p>Row: ${tr_sta.index}, Column: ${td_sta.index}</p>
										    
										    
										    <c:set var="combinedIndex" value="${tr_sta.index},${td_sta.index}" />
										    
										    <c:if test="${gridDetail[for_num].sts_location == combinedIndex}">
										    
										    
											    <td>
											    	<div>
											    	
											    	${gridDetail[for_num].sts_location}
												같음~~~~~~~~~~~~~
												
													<input type="text" value="${gridDetail[for_num].sts_idx}">
												
												
										            <input type="text" name="sts[${tr},${td}][tname]" class='mt10 mb10 a_center' value="${gridDetail[for_num].sts_name}" placeholder='테이블번호입력'>
										            <br>
										            
													<!-- 테이블 타입 select 박스 생성 -->
													<select id="table_type" name="sts[${tr},${td}][type]" class='ws100'>
														<option value="">테이블타입</option>
													    
													    
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
													    <option value=''>인원</option>
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
													
										            <input type='text' name="sts[${tr},${td}][location]" value='${gridDetail[for_num].sts_location}' />
										            <input type='text' name="sts[${tr},${td}][location]" value='${tr },${td }' />
											    	${tr }, ${td }
											    	</div>
											    </td>
										    
											</c:if>
											
										    <c:if test="${gridDetail[for_num].sts_location != combinedIndex}">
										    
										    
											    <td>
													다름~~~~~~~~~~~~~~~~~~~~~~
											    </td>
										    
											</c:if>
											
											
	                						<c:set var="for_num" value="${for_num + 1}" />
										</c:forEach>
										</tr>
									</c:forEach>
								</table>
							</c:if>
						</div>
						
						
							

						
					
					
					<input type="submit" class="btn_black ml20" value="그리드 설정" onclick="grid_setting(${for_num})">
						
				<!-- 
				</form>
				 -->
			</div>
   
<%@include file="../common/footer.jsp"%>