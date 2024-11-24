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
	
	function timeCheck(click_id, tr_num) {
        var startHour = parseInt(document.querySelector("[name='work_shour']").value);
        var startMinute = parseInt(document.querySelector("[name='work_sminute']").value);
        var endHour = parseInt(document.querySelector("[name='work_ehour']").value);
        var endMinute = parseInt(document.querySelector("[name='work_eminute']").value);
        
        var restStartHour = parseInt(document.querySelector("[name='rest_shour']").value);
        var restStartMinute = parseInt(document.querySelector("[name='rest_sminute']").value);
        var restEndHour = parseInt(document.querySelector("[name='rest_ehour']").value);
        var restEndMinute = parseInt(document.querySelector("[name='rest_eminute']").value);

        // 시간 비교 함수: 시:분을 분으로 변환하여 비교
        function timeToMinutes(hour, minute) {
            return hour * 60 + minute;
        }

        var startTimeInMinutes = timeToMinutes(startHour, startMinute);
        var endTimeInMinutes = timeToMinutes(endHour, endMinute);
        var restStartTimeInMinutes = timeToMinutes(restStartHour, restStartMinute);
        var restEndTimeInMinutes = timeToMinutes(restEndHour, restEndMinute);

        // 시작 시간이 종료 시간보다 뒤에 올 수 없음
        if (startTimeInMinutes >= endTimeInMinutes) {
            alert("시작 시간이 종료 시간보다 뒤에 올 수 없습니다.");
            document.querySelector("[id='"+click_id+"']").focus();
            
            //클릭한 컨텐츠가 work_s를 포함하면
            if(click_id && click_id.includes('work_s')) {
               	document.querySelector("[id='"+click_id+"']").selectedIndex = 0;  // 첫 번째 옵션 선택 (index 0)
               	document.querySelector("[id='work_sminute_"+tr_num+"']").selectedIndex = 0;
            }
            
            if(click_id && click_id.includes('work_e')) {
               	document.querySelector("[id='"+click_id+"']").selectedIndex = 0;  // 첫 번째 옵션 선택 (index 0)
               	document.querySelector("[id='work_sminute_"+tr_num+"']").selectedIndex = 0;
            }
            
            return false;
        }
        
        // 브레이크 타임이 시작 시간과 종료 시간 사이에 있어야 함
        if (restStartTimeInMinutes < startTimeInMinutes || restEndTimeInMinutes > endTimeInMinutes) {
            alert("브레이크 타임은 시작 시간과 종료 시간 사이에 있어야 합니다.");
            //document.querySelector("[id='"+click_id+"']").focus();
            //document.querySelector("[name='rest_shour']").focus();  // 브레이크 시작 시간 선택 박스로 포커스 이동
           
            
            
        	var wshour = parseInt(document.querySelector("[id='work_shour_"+tr_num+"']").value);
       		var wehour = parseInt(document.querySelector("[id='work_ehour_"+tr_num+"']").value);
        
       		//var rshour = wshour+1;
       		//rshour = rshour < 10 ? '0' + rshour : String(rshour);
       		//var rshour = '00';
           	//document.querySelector("[id='rest_shour_"+tr_num+"']").value = rshour;
           	//document.querySelector("[id='rest_sminute_"+tr_num+"']").value = '00';
           	document.querySelector("[id='rest_shour_"+tr_num+"']").selectedIndex = 0;
           	document.querySelector("[id='rest_shour_"+tr_num+"']").selectedIndex = 0;

       		//var rehour = wehour-1;
       		//rehour = rehour < 10 ? '0' + rehour : String(rehour);
       		//var rehour = '00';
           	//document.querySelector("[id='rest_ehour_"+tr_num+"']").value = rehour; 
           	//document.querySelector("[id='rest_eminute"+tr_num+"']").value = '00';
           	document.querySelector("[id='rest_ehour_"+tr_num+"']").selectedIndex = 0;
           	document.querySelector("[id='rest_eminute"+tr_num+"']").selectedIndex = 0;
            return false;
        }

        return true; // 유효성 검사 성공
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
		
		
		<c:set var="shour2" value="1" />
		<c:set var="ehour2" value="24" />		
		<c:set var="sminute2" value="0" />
		<c:set var="eminute2" value="55" />
		
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
							
							<!-- 값 분리 시작 -->
				            <c:set var="startTimeParts" value="${fn:split(dto.stime_start, ':')}" />
				            <c:set var="startHour" value="${startTimeParts[0]}" />
				            <c:set var="startMinute" value="${startTimeParts[1]}" />
				
				            <c:set var="endTimeParts" value="${fn:split(dto.stime_end, ':')}" />
				            <c:set var="endHour" value="${endTimeParts[0]}" />
				            <c:set var="endMinute" value="${endTimeParts[1]}" />
				            
				            
				            <c:set var="RestOneSlice" value="${fn:split(dto.stime_break, '~')}" />
				            <c:set var="RestStart" value="${RestOneSlice[0]}" />
				            <c:set var="RestEnd" value="${RestOneSlice[1]}" />
				
				            <c:set var="RestStartTime" value="${fn:split(RestStart, ':')}" />
				            <c:set var="rest_shour" value="${RestStartTime[0]}" />
				            <c:set var="rest_sminute" value="${RestStartTime[1]}" />
				            
				            <c:set var="RestEndTime" value="${fn:split(RestEnd, ':')}" />
				            <c:set var="rest_ehour" value="${RestEndTime[0]}" />
				            <c:set var="rest_eminute" value="${RestEndTime[1]}" />
							<!-- 값 분리 마침 -->
				            
							<td>
				           		<c:set var="work_box_yn" value="display:none;" />
								<c:if test="${radio_check == 'checked'}">
									<c:set var="work_box_yn" value="display:block;" />
								</c:if>
								
								<div class="work_yn_box${t_list_num}" style="${work_box_yn }">
									<span>시작</span>
									<select name="work_shour" id="work_shour_${t_list_num}" class="" onchange="timeCheck('work_shour_${t_list_num}', ${t_list_num})">
										<c:forEach begin="${shour}" end="${ehour}" var="hour" varStatus="hour_add">
									        <option value="${String.format('%02d', hour_add.index)}" ${hour_add.index == startHour ? 'selected' : ''}>
									        	${String.format('%02d', hour_add.index)}
									        </option>
									    </c:forEach>
									    
									    
									</select>
									<span>:</span>
									<select name="work_sminute" id="work_sminute_${t_list_num}" class="" onchange="timeCheck('work_sminute_${t_list_num}', ${t_list_num})">
										<c:forEach begin="${sminute}" end="${eminute}"  step="5" var="minute" varStatus="minute_add">
									        <option value="${String.format('%02d', minute_add.index)}" ${minute_add.index == startMinute ? 'selected' : ''}>
									        	${String.format('%02d', minute_add.index)}
									        </option>
									    </c:forEach>
									    
									</select>
									<span>~</span>
									<span>종료</span>
									<select name="work_ehour" id="work_ehour_${t_list_num}" class="" onchange="timeCheck('work_ehour_${t_list_num}', ${t_list_num})">
																		
									    <c:forEach begin="${shour2}" end="${ehour2}" var="hour" varStatus="hour_add">
									        <option value="${String.format('%02d', hour_add.index)}" ${hour_add.index == endHour ? 'selected' : ''}>
									        	${String.format('%02d', hour_add.index)}
									        </option>
									    </c:forEach>
									</select>
									<span>:</span>
									<select name="work_eminute" id="work_eminute_${t_list_num}" class="" onchange="timeCheck('work_eminute_${t_list_num}', ${t_list_num})">
										<c:forEach begin="${sminute2}" end="${eminute2}"  step="5" var="minute" varStatus="minute_add">
									        <option value="${String.format('%02d', minute_add.index)}" ${minute_add.index == endMinute ? 'selected' : ''}>
									        	${String.format('%02d', minute_add.index)}
									        </option>
									    </c:forEach>
									    
									</select>
									
									<span class="ml20">브레이크타임</span>
									<!-- 
									<input type="text" name="rest_time" id="" class="ws200" value="${dto.stime_break }">
									-->
									
									<select name="rest_shour" id="rest_shour_${t_list_num}" class="" onchange="timeCheck('rest_shour_${t_list_num}', ${t_list_num})">
										<c:forEach begin="${shour}" end="${ehour}" var="hour" varStatus="hour_add">
									        <option value="${String.format('%02d', hour_add.index)}" ${hour_add.index == rest_shour ? 'selected' : ''}>
									        	${String.format('%02d', hour_add.index)}
									        </option>
									    </c:forEach>
									    
									</select>
									<span>:</span>
									<select name="rest_sminute" id="rest_sminute_${t_list_num}" class="" onchange="timeCheck('rest_sminute_${t_list_num}', ${t_list_num})">
										<c:forEach begin="${sminute}" end="${eminute}"  step="5" var="minute" varStatus="minute_add">
									        <option value="${String.format('%02d', minute_add.index)}" ${minute_add.index == rest_sminute ? 'selected' : ''}>
									        	${String.format('%02d', minute_add.index)}
									        </option>
									    </c:forEach>
									    
									</select>
									~
									<select name="rest_ehour" id="rest_ehour_${t_list_num}" class="" onchange="timeCheck('rest_ehour_${t_list_num}', ${t_list_num})">
										<c:forEach begin="${shour}" end="${ehour}" var="hour" varStatus="hour_add">
									        <option value="${String.format('%02d', hour_add.index)}" ${hour_add.index == rest_ehour ? 'selected' : ''}>
									        	${String.format('%02d', hour_add.index)}
									        </option>
									    </c:forEach>
									    
									    
									</select>
									<span>:</span>
									<select name="rest_eminute" id="rest_eminute_${t_list_num}" class="" onchange="timeCheck('rest_eminute_${t_list_num}', ${t_list_num})">
										<c:forEach begin="${sminute}" end="${eminute}"  step="5" var="minute" varStatus="minute_add">
									        <option value="${String.format('%02d', minute_add.index)}" ${minute_add.index == rest_eminute ? 'selected' : ''}>
									        	${String.format('%02d', minute_add.index)}
									        </option>
									    </c:forEach>
									    
									</select>
									
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
									<!-- 
									<input type="text" name="rest_time" id="" class="ws200" value="">
									 -->
									
									
									<select name="rest_shour" id="" class="">
										<c:forEach begin="${shour}" end="${ehour}" var="hour" varStatus="hour_add">
									        <option value="${String.format('%02d', hour_add.index)}" ${hour_add.index == restSHour ? 'selected' : ''}>
									        	${String.format('%02d', hour_add.index)}
									        </option>
									    </c:forEach>
									    
									    
									</select>
									<span>:</span>
									<select name="rest_sminute" id="" class="">
										<c:forEach begin="${sminute}" end="${eminute}"  step="5" var="minute" varStatus="minute_add">
									        <option value="${String.format('%02d', minute_add.index)}" ${minute_add.index == restSMinute ? 'selected' : ''}>
									        	${String.format('%02d', minute_add.index)}
									        </option>
									    </c:forEach>
									    
									</select>
									~
									<select name="rest_shour" id="" class="">
										<c:forEach begin="${shour}" end="${ehour}" var="hour" varStatus="hour_add">
									        <option value="${String.format('%02d', hour_add.index)}" ${hour_add.index == restEHour ? 'selected' : ''}>
									        	${String.format('%02d', hour_add.index)}
									        </option>
									    </c:forEach>
									    
									    
									</select>
									<span>:</span>
									<select name="rest_sminute" id="" class="">
										<c:forEach begin="${sminute}" end="${eminute}"  step="5" var="minute" varStatus="minute_add">
									        <option value="${String.format('%02d', minute_add.index)}" ${minute_add.index == restEMinute ? 'selected' : ''}>
									        	${String.format('%02d', minute_add.index)}
									        </option>
									    </c:forEach>
									    
									</select>
									
									
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
			<input type="radio" name="s_work" id="ws1" value="TRUE" ${work_type == 'TRUE' ? 'checked' : ''} ><label for="ws1">운영</label>
			<input type="radio" name="s_work" id="ws2" value="REST" ${work_type == 'REST' ? 'checked' : ''}><label for="ws2">휴업</label>
			<input type="radio" name="s_work" id="ws3" value="FALSE" ${work_type == 'FALSE' ? 'checked' : ''}><label for="ws3">폐업</label>
		</div>
		<input type="submit" class="btn_black mt10 ml200" value="설정">
	</form>
</div>
   
<%@include file="../common/footer.jsp"%>