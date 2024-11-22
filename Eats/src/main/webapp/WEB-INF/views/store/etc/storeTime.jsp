<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../common/header.jsp"%>

<script>
	function radio_check(num, r_value, up){
		
		
		//수정모드시 radio 클릭시 input 처리 해주는 부분 id명 변경
		var up_text = "";
		if(up){
			up_text = up;
		}
		//alert(num);
	    console.log("uptext:"+up_text);
	    console.log("num:"+num);

	    // 선택된 radio 버튼의 값 가져오기
	    var selectedValue = document.querySelector('input[name="work_yn_' +up_text+ num + '"]:checked').value;
	    
	    if(num > -1){
	    	$("#radio_"+up_text+num).val(selectedValue);
	    	
	    	if(r_value == 'Y'){

		    	$(".work_yn_box"+num).css("display", "block");
	    	}else {

		    	$(".work_yn_box"+num).css("display", "none");
	    	}
	    }
	    
	    // 콘솔에 출력
	    console.log('Selected value for work_yn[' + num + ']: ' + selectedValue);
	}
</script>

<div class="mainCon_1000">
	
		<h2>
			영업시간 설정
		</h2>

		<c:set var="day_start" value="0" />
		<c:set var="day_end" value="6" />
		
		<c:set var="shour" value="0" />
		<c:set var="ehour" value="23" />
		
		<c:set var="sminute" value="0" />
		<c:set var="eminute" value="55" />
		
		<!-- 
		<c:if test="${not empty t_list}">	
			<h2>영업시간</h2>
			<div class="tableWrite_2 mb60">
				<table>
					저장시킬때 일월화수목금토로 저장시키고 불러올때 기본키로 정렬시켜서 불러옴
					<c:if test="${!empty t_list }">
						<c:forEach var="dto" items="${t_list }">
							<tr>
								<th>${dto.stime_day }</th>
								<td >
									${dto.stime_start } : ${dto.stime_end}
									( ${dto.stime_break} )
								</td>
							</tr>
						</c:forEach>
					</c:if>
					
					
				</table>
			</div>
		</c:if>
		 -->
	 
	 <!-- 수정모드 -->
	<c:if test="${not empty t_list}">
				
		<c:set var="work_val_0" value="N" />
		<c:set var="work_val_1" value="N" />
		<c:set var="work_val_2" value="N" />
		<c:set var="work_val_3" value="N" />
		<c:set var="work_val_4" value="N" />
		<c:set var="work_val_5" value="N" />
		<c:set var="work_val_6" value="N" />
		
		<c:set var="work_check_0" value="" />
		<c:set var="work_check_1" value="" />
		<c:set var="work_check_2" value="" />
		<c:set var="work_check_3" value="" />
		<c:set var="work_check_4" value="" />
		<c:set var="work_check_5" value="" />
		<c:set var="work_check_6" value="" />
		
		<c:set var="work_nocheck_0" value="checked" />
		<c:set var="work_nocheck_1" value="checked" />
		<c:set var="work_nocheck_2" value="checked" />
		<c:set var="work_nocheck_3" value="checked" />
		<c:set var="work_nocheck_4" value="checked" />
		<c:set var="work_nocheck_5" value="checked" />
		<c:set var="work_nocheck_6" value="checked" />
		
		<c:forEach var="dto" items="${t_list }">
		
			<c:if test="${dto.stime_day == '일' }">
			
	    		<c:if test="${dto.stime_start != null && dto.stime_end != null}">
					<c:set var="work_val_0" value="Y" />
	    		</c:if>
	    		
				<c:set var="work_check_0" value="checked" />
				<c:set var="work_nocheck_0" value="" />
			</c:if>
			<c:if test="${dto.stime_day == '월' }">
	    		<c:if test="${dto.stime_start != null && dto.stime_end != null}">
					<c:set var="work_val_1" value="Y" />
	    		</c:if>
				<c:set var="work_check_1" value="checked" />
				<c:set var="work_nocheck_1" value="" />
			</c:if>
			<c:if test="${dto.stime_day == '화' }">
	    		<c:if test="${dto.stime_start != null && dto.stime_end != null}">
					<c:set var="work_val_2" value="Y" />
	    		</c:if>
				<c:set var="work_check_2" value="checked" />
				<c:set var="work_nocheck_2" value="" />
			</c:if>
			<c:if test="${dto.stime_day == '수' }">
	    		<c:if test="${dto.stime_start != null && dto.stime_end != null}">
					<c:set var="work_val_3" value="Y" />
	    		</c:if>
				<c:set var="work_check_3" value="checked" />
				<c:set var="work_nocheck_3" value="" />
			</c:if>
			<c:if test="${dto.stime_day == '목' }">
	    		<c:if test="${dto.stime_start != null && dto.stime_end != null}">
					<c:set var="work_val_4" value="Y" />
	    		</c:if>
				<c:set var="work_check_4" value="checked" />
				<c:set var="work_nocheck_4" value="" />
			</c:if>
			<c:if test="${dto.stime_day == '금' }">
	    		<c:if test="${dto.stime_start != null && dto.stime_end != null}">
					<c:set var="work_val_5" value="Y" />
	    		</c:if>
				<c:set var="work_check_5" value="checked" />
				<c:set var="work_nocheck_5" value="" />
			</c:if>
			<c:if test="${dto.stime_day == '토' }">
	    		<c:if test="${dto.stime_start != null && dto.stime_end != null}">
					<c:set var="work_val_6" value="Y" />
	    		</c:if>
				<c:set var="work_check_6" value="checked" />
				<c:set var="work_nocheck_6" value="" />
			</c:if>
		</c:forEach>

		<!-- 
		<div class="tableWrite_2 mb60">
			<table>
				<c:forEach var="dto" items="${t_list }">
					<tr>
						<th>${dto.stime_day }</th>
						<td >
							${dto.stime_start } ${dto.stime_end}
							( ${dto.stime_break} )
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		 -->
	
		<form name="storeTimeForm" action="storeTimeUpdate" method="post">
			<div class="btnBox_top">
				<input type="submit" class="btn_black" value="설정">
			</div>
			<input type="hidden" name="store_idx" id="store_idx" value="${store_idx}">
				
			<input type="hidden" name="radio_val" id="radio_up0" class="ws100" value="${work_val_0 }">			
			<input type="hidden" name="radio_val" id="radio_up1" class="ws100" value="${work_val_1 }">
			<input type="hidden" name="radio_val" id="radio_up2" class="ws100" value="${work_val_2 }">
			<input type="hidden" name="radio_val" id="radio_up3" class="ws100" value="${work_val_3 }">
			<input type="hidden" name="radio_val" id="radio_up4" class="ws100" value="${work_val_4 }">
			<input type="hidden" name="radio_val" id="radio_up5" class="ws100" value="${work_val_5 }">
			<input type="hidden" name="radio_val" id="radio_up6" class="ws100" value="${work_val_6 }">
			
			<div class="tableWrite_3 mb60">
				<table>
					<!-- 
					c:forEach begin="${day_start}" end="${day_end}" var="day_num" varStatus="day_add"
					 -->
					<c:set var="t_list_num" value="0" />
					
					<c:forEach var="dto" items="${t_list }">
						<tr>
							<th>
							
								<input type="hidden" name="stime_idx" value="${dto.stime_idx }">
								
					            <!-- 요일 이름 출력 -->
					            <input type="hidden" name="stime_day" id="" value="${dto.stime_day }">
								${dto.stime_day }
								<!-- 
					    		<c:if test="${day_add.index == 0}">
					    			일
					    			<input type="text" name="stime_day" id="" value="일">
					    		</c:if>
					    		<c:if test="${day_add.index == 1}">
					    			월
					    			<input type="text" name="stime_day" id="" value="월">
					    		</c:if>
					    		<c:if test="${day_add.index == 2}">
					    			화
					    			<input type="text" name="stime_day" id="" value="화">
					    		</c:if>
					    		<c:if test="${day_add.index == 3}">
					    			수
					    			<input type="text" name="stime_day" id="" value="수">
					    		</c:if>
					    		<c:if test="${day_add.index == 4}">
					    			목
					    			<input type="text" name="stime_day" id="" value="목">
					    		</c:if>
					    		<c:if test="${day_add.index == 5}">
					    			금
					    			<input type="text" name="stime_day" id="" value="금">
					    		</c:if>
					    		<c:if test="${day_add.index == 6}">
					    			토
					    			<input type="text" name="stime_day" id="" value="토">
					    		</c:if>
					    		 -->
							</th>
							
				    		<c:if test="${dto.stime_start == null && dto.stime_end == null}">
								<c:set var="radio_nocheck" value="checked" />
								<c:set var="radio_check" value="" />
				    		</c:if>
				    		<c:if test="${dto.stime_start != null && dto.stime_end != null}">
								<c:set var="radio_nocheck" value="" />
								<c:set var="radio_check" value="checked" />
				    		</c:if>
									
							<td class="ws120">
								<input type="radio" name="work_yn_up${t_list_num}" id="work_n_${t_list_num}" value="N" onclick="radio_check(${t_list_num}, 'N', 'up')" ${radio_nocheck }><label for="work_n_${t_list_num}">휴무</label>
								<input type="radio" name="work_yn_up${t_list_num}" id="work_y_${t_list_num}" value="Y" onclick="radio_check(${t_list_num}, 'Y', 'up')" ${radio_check }><label for="work_y_${t_list_num}">영업</label>
							</td>
											
				            <!-- stime_start 값 분리 -->
				            <c:set var="startTimeParts" value="${fn:split(dto.stime_start, ':')}" />
				            <c:set var="startHour" value="${startTimeParts[0]}" />
				            <c:set var="startMinute" value="${startTimeParts[1]}" />
				
				            <!-- stime_end 값 분리 -->
				            <c:set var="endTimeParts" value="${fn:split(dto.stime_end, ':')}" />
				            <c:set var="endHour" value="${endTimeParts[0]}" />
				            <c:set var="endMinute" value="${endTimeParts[1]}" />
				            
							<td>
				           		<c:set var="work_box_yn" value="display:none;" />
								<c:if test="${radio_check == 'checked'}">
									<c:set var="work_box_yn" value="display:block;" />
								</c:if>
								
								<div class="work_yn_box${t_list_num}" style="${work_box_yn }">
									<span>시작</span>
									<select name="work_shour" id="" class="">
																		
										<!-- 
									    <option value="" ${empty startHour || startHour == "" ? 'selected' : ''}>시</option>
									     -->
									    
										<c:forEach begin="${shour}" end="${ehour}" var="hour" varStatus="hour_add">
									        <option value="${hour_add.index}" ${hour_add.index == startHour ? 'selected' : ''}>${hour_add.index}</option>
									    </c:forEach>
									    
									    
									</select>
									<span>:</span>
									<select name="work_sminute" id="" class="">
									
										<!-- 
									    <option value="" ${empty startMinute ? 'selected' : ''}>분</option>
									     -->
									    
										<c:forEach begin="${sminute}" end="${eminute}"  step="5" var="minute" varStatus="minute_add">
									        <option value="${minute_add.index}" ${minute_add.index == startMinute ? 'selected' : ''}>${minute_add.index}</option>
									    </c:forEach>
									    
									</select>
									<span>~</span>
									<span>종료</span>
									<select name="work_ehour" id="" class="">
																		
									    <!-- work_ehour 값이 비어 있으면 '시'가 선택되도록 -->
									    <!-- 
									    <option value="" ${empty endHour ? 'selected' : ''}>시</option>
									     -->
									    <!-- shour부터 ehour까지 범위에서 시간 선택 -->
									    <c:forEach begin="${shour}" end="${ehour}" var="hour" varStatus="hour_add">
									        <!-- 각 hour_add.index가 work_ehour와 일치하면 selected 설정 -->
									        <option value="${hour_add.index}" ${hour_add.index == endHour ? 'selected' : ''}>${hour_add.index}</option>
									    </c:forEach>
									    
									    
    									<!-- 
										<option value="">시</option>
										
										<c:forEach begin="${shour}" end="${ehour}" var="hour" varStatus="hour_add">
										
								    		<c:if test="${hour_add.index == endHour}">
									            <c:set var="selected" value="selected" />
					    					</c:if>
								    		<c:if test="${hour_add.index != endHour}">
									            <c:set var="selected" value="" />
					    					</c:if>
					    					
						    				<option value="${hour_add.index}" ${selected }>${hour_add.index}</option>
										</c:forEach>
										 -->
									</select>
									<span>:</span>
									<select name="work_eminute" id="" class="">
									
										<!-- 
									    <option value="" ${empty endMinute ? 'selected' : ''}>분</option>
									     -->
									    
										<c:forEach begin="${sminute}" end="${eminute}"  step="5" var="minute" varStatus="minute_add">
									        <option value="${minute_add.index}" ${minute_add.index == endMinute ? 'selected' : ''}>${minute_add.index}</option>
									    </c:forEach>
									    
									    <!-- 
										<option value="">분</option>
										
										<c:forEach begin="${sminute}" end="${eminute}"  step="5" var="minute" varStatus="minute_add">
										
								    		<c:if test="${minute_add.index == endMinute}">
									            <c:set var="selected" value="selected" />
					    					</c:if>
								    		<c:if test="${minute_add.index != endMinute}">
									            <c:set var="selected" value="" />
					    					</c:if>
					    					
						    				<option value="${minute_add.index}" ${selected }>${minute_add.index}</option>
										</c:forEach>
										 -->
									</select>
									
									<span class="ml20">브레이크타임</span>
									<input type="text" name="rest_time" id="" class="ws200" value="${dto.stime_break }">
									
									<!-- 
									<input type="submit" class="btn_black" value="수정">
									 -->
								</div>
							</td>
						</tr>
					
						<c:set var="t_list_num" value="${t_list_num+1 }" />
						
					</c:forEach>
				</table>
			</div>
			
			
			
		</form>
	</c:if>
	 
	<!-- 등록모드 -->
	<c:if test="${empty t_list}">
	
		<form name="storeTimeForm" action="storeTimeSave" method="post">
			<div class="btnBox_top">
				<input type="submit" class="btn_black" value="설정">
			</div>
				
			일<input type="text" name="radio_val" id="radio_0" class="ws100" value="Y"><br>
			월<input type="text" name="radio_val" id="radio_1" class="ws100" value="Y"><br>
			화<input type="text" name="radio_val" id="radio_2" class="ws100" value="Y"><br>
			수<input type="text" name="radio_val" id="radio_3" class="ws100" value="Y"><br>
			목<input type="text" name="radio_val" id="radio_4" class="ws100" value="Y"><br>
			금<input type="text" name="radio_val" id="radio_5" class="ws100" value="Y"><br>
			토<input type="text" name="radio_val" id="radio_6" class="ws100" value="Y"><br>
		
			<div class="tableWrite_3 mb60">
				<table>
					<c:forEach begin="${day_start}" end="${day_end}" var="day_num" varStatus="day_add">
						<tr>
							<th>
								<input type="hidden" name="store_idx" id="store_idx" value="${store_idx}">
								
					    		<c:if test="${day_add.index == 0}">
					    			일
					    			<input type="text" name="stime_day" id="" value="일">
					    		</c:if>
					    		<c:if test="${day_add.index == 1}">
					    			월
					    			<input type="text" name="stime_day" id="" value="월">
					    		</c:if>
					    		<c:if test="${day_add.index == 2}">
					    			화
					    			<input type="text" name="stime_day" id="" value="화">
					    		</c:if>
					    		<c:if test="${day_add.index == 3}">
					    			수
					    			<input type="text" name="stime_day" id="" value="수">
					    		</c:if>
					    		<c:if test="${day_add.index == 4}">
					    			목
					    			<input type="text" name="stime_day" id="" value="목">
					    		</c:if>
					    		<c:if test="${day_add.index == 5}">
					    			금
					    			<input type="text" name="stime_day" id="" value="금">
					    		</c:if>
					    		<c:if test="${day_add.index == 6}">
					    			토
					    			<input type="text" name="stime_day" id="" value="토">
					    		</c:if>
							</th>
							<td class="ws120">
								<input type="radio" name="work_yn_${day_add.index}" id="work_n_${day_add.index}" value="N" onclick="radio_check(${day_add.index}, 'N')"><label for="work_n_${day_add.index}">휴무</label>
								<input type="radio" name="work_yn_${day_add.index}" id="work_y_${day_add.index}" value="Y" onclick="radio_check(${day_add.index}, 'Y')" checked><label for="work_y_${day_add.index}">영업</label>
							</td>
							<td>
								<div class="work_yn_box${day_add.index}">
									<span>시작</span>
									<select name="work_shour" id="" class="">
										<option value="">시</option>
										
										<c:forEach begin="${shour}" end="${ehour}" var="hour" varStatus="hour_add">
						    				<option value="${hour_add.index}">${hour_add.index}</option>
										</c:forEach>
										
									</select>
									<span>:</span>
									<select name="work_sminute" id="" class="">
										<option value="">분</option>
										
										<c:forEach begin="${sminute}" end="${eminute}"  step="5" var="minute" varStatus="minute_add">
						    				<option value="${minute_add.index}">${minute_add.index}</option>
										</c:forEach>
									</select>
									<span>~</span>
									<span>종료</span>
									<select name="work_ehour" id="" class="">
										<option value="">시</option>
										
										<c:forEach begin="${shour}" end="${ehour}" var="hour" varStatus="hour_add">
						    				<option value="${hour_add.index}">${hour_add.index}</option>
										</c:forEach>
										
									</select>
									<span>:</span>
									<select name="work_eminute" id="" class="">
										<option value="">분</option>
										
										<c:forEach begin="${sminute}" end="${eminute}"  step="5" var="minute" varStatus="minute_add">
						    				<option value="${minute_add.index}">${minute_add.index}</option>
										</c:forEach>
									</select>
									
									<span class="ml20">브레이크타임</span>
									<input type="text" name="rest_time" id="" class="ws200" value="">
									
									<!-- 
									<input type="submit" class="btn_black" value="수정">
									 -->
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</form>
	</c:if>
	
	<!-- 
	<form name="storeTimeForm" action="dddd" method="post">
		
		<div class="tableWrite_3 mb60">
			<table>
				<c:forEach begin="${day_start}" end="${day_end}" var="day_num" varStatus="day_add">
				
					<tr>
						<th>
				    		<c:if test="${day_add.index == 0}">
				    			일
				    			<input type="text" name="stime_day" id="" value="일">
				    		</c:if>
				    		<c:if test="${day_add.index == 1}">
				    			월
				    			<input type="text" name="stime_day" id="" value="월">
				    		</c:if>
				    		<c:if test="${day_add.index == 2}">
				    			화
				    			<input type="text" name="stime_day" id="" value="화">
				    		</c:if>
				    		<c:if test="${day_add.index == 3}">
				    			수
				    			<input type="text" name="stime_day" id="" value="수">
				    		</c:if>
				    		<c:if test="${day_add.index == 4}">
				    			목
				    			<input type="text" name="stime_day" id="" value="목">
				    		</c:if>
				    		<c:if test="${day_add.index == 5}">
				    			금
				    			<input type="text" name="stime_day" id="" value="금">
				    		</c:if>
				    		<c:if test="${day_add.index == 6}">
				    			토
				    			<input type="text" name="stime_day" id="" value="토">
				    		</c:if>
						</th>
						<td class="ws120">
							<input type="radio" name="work_yn" id="work_n_${day_add.index}" value="N"><label for="work_n_${day_add.index}">휴무</label>
							<input type="radio" name="work_yn" id="work_y_${day_add.index}" value="Y"><label for="work_y_${day_add.index}">영업</label>
						</td>
						<td>
							<span>시작</span>
							<select name="work_shour" id="" class="">
								<option value="">시</option>
								
								<c:forEach begin="${shour}" end="${ehour}" var="hour" varStatus="hour_add">
				    				<option value="${hour_add.index}">${hour_add.index}</option>
								</c:forEach>
								
							</select>
							<span>:</span>
							<select name="work_sminute" id="" class="">
								<option value="">분</option>
								
								<c:forEach begin="${sminute}" end="${eminute}"  step="5" var="minute" varStatus="minute_add">
				    				<option value="${minute_add.index}">${minute_add.index}</option>
								</c:forEach>
							</select>
							<span>~</span>
							<span>종료</span>
							<select name="work_ehour" id="" class="">
								<option value="">시</option>
								
								<c:forEach begin="${shour}" end="${ehour}" var="hour" varStatus="hour_add">
				    				<option value="${hour_add.index}">${hour_add.index}</option>
								</c:forEach>
								
							</select>
							<span>:</span>
							<select name="work_eminute" id="" class="">
								<option value="">분</option>
								
								<c:forEach begin="${sminute}" end="${eminute}"  step="5" var="minute" varStatus="minute_add">
				    				<option value="${minute_add.index}">${minute_add.index}</option>
								</c:forEach>
							</select>
							
							<span class="ml20">브레이크타임</span>
							<input type="text" name="rest_time" id="" class="ws300" value="">
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
	 -->
	 
	<hr class="view_line">
	
	<form name="storeWorkForm" action="storeWorkSet" method="post">
		<input type="hidden" name="store_idx" id="store_idx" value="${store_idx}">
		<h2>운영설정</h2>
		<div>
			<!-- 
			${work_type }
			 -->
			<input type="radio" name="s_work" id="ws1" value="Y" ${work_type == 'Y' ? 'checked' : ''} ><label for="ws1">운영</label>
			<input type="radio" name="s_work" id="ws2" value="R" ${work_type == 'R' ? 'checked' : ''}><label for="ws2">휴업</label>
			<input type="radio" name="s_work" id="ws3" value="N" ${work_type == 'N' ? 'checked' : ''}><label for="ws3">폐업</label>
		</div>
		<input type="submit" class="btn_black mt10 ml200" value="설정">
	</form>
</div>
   
<%@include file="../common/footer.jsp"%>