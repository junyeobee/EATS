<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../common/header.jsp"%>

<div class="mainCon_1000">
	<form name="" action="" method="post">
	
		<input type="hidden" name="store_idx" value="<%= storeIdx %>">
		<h2>영업시간 수정</h2>
		<div class="btnBox_top">
			<input type="submit" class="btn_black" value="수정">
		</div>
		

		<c:set var="day_start" value="1" />
		<c:set var="day_end" value="7" />

		<c:set var="for_num" value="0" />
		
		<div class="tableWrite_3 mb60">
			<table>
				<c:forEach begin="${day_start}" end="${day_end}" var="day_num" varStatus="day_add">
				
				
				    <c:if test="${day_add.index == 1}">
					<tr>
						<th>
				    		<c:if test="${day_add.index == 1}">일</c:if>
				    		<c:if test="${day_add.index == 2}">월</c:if>
				    		<c:if test="${day_add.index == 3}">화</c:if>
				    		<c:if test="${day_add.index == 4}">수</c:if>
				    		<c:if test="${day_add.index == 5}">목</c:if>
				    		<c:if test="${day_add.index == 6}">금</c:if>
				    		<c:if test="${day_add.index == 7}">토</c:if>
						</th>
						<td class="ws120">
							<input type="radio" name="" id="" value=""><label for="">휴무</label>
							<input type="radio" name="" id="" value=""><label for="">영업</label>
						</td>
						<td>
							<span>시작</span>
							<select name="" id="" class="">
								<option value="">시</option>
							</select>
							<span>:</span>
							<select name="" id="" class="">
								<option value="">분</option>
							</select>
							<span>~</span>
							<span>종료</span>
							<select name="" id="" class="">
								<option value="">시</option>
							</select>
							<span>:</span>
							<select name="" id="" class="">
								<option value="">분</option>
							</select>
							
							<span class="ml20">브레이크타임</span>
							<input type="text" name="" id="" class="ws300" value="">
						</td>
					</tr>
				</c:forEach>
				
				
				
				<!-- 
				<tr>
					<th>월</th>
					<td class="ws120">
						<input type="radio" name="" id="" value=""><label for="">휴무</label>
						<input type="radio" name="" id="" value=""><label for="">영업</label>
					</td>
					<td>
						<span>시작</span>
						<select name="" id="" class="">
							<option value="">시</option>
						</select>
						<span>:</span>
						<select name="" id="" class="">
							<option value="">분</option>
						</select>
						<span>~</span>
						<span>종료</span>
						<select name="" id="" class="">
							<option value="">시</option>
						</select>
						<span>:</span>
						<select name="" id="" class="">
							<option value="">분</option>
						</select>
						
						<span class="ml20">브레이크타임</span>
						<input type="text" name="" id="" class="ws300" value="">
					</td>
				</tr>
				<tr>
					<th>화</th>
					<td class="ws120">
						<input type="radio" name="" id="" value=""><label for="">휴무</label>
						<input type="radio" name="" id="" value=""><label for="">영업</label>
					</td>
					<td>
						<span>시작</span>
						<select name="" id="" class="">
							<option value="">시</option>
						</select>
						<span>:</span>
						<select name="" id="" class="">
							<option value="">분</option>
						</select>
						<span>~</span>
						<span>종료</span>
						<select name="" id="" class="">
							<option value="">시</option>
						</select>
						<span>:</span>
						<select name="" id="" class="">
							<option value="">분</option>
						</select>
						
						<span class="ml20">브레이크타임</span>
						<input type="text" name="" id="" class="ws300" value="">
					</td>
				</tr>
				<tr>
					<th>수</th>
					<td class="ws120">
						<input type="radio" name="" id="" value=""><label for="">휴무</label>
						<input type="radio" name="" id="" value=""><label for="">영업</label>
					</td>
					<td>
						<span>시작</span>
						<select name="" id="" class="">
							<option value="">시</option>
						</select>
						<span>:</span>
						<select name="" id="" class="">
							<option value="">분</option>
						</select>
						<span>~</span>
						<span>종료</span>
						<select name="" id="" class="">
							<option value="">시</option>
						</select>
						<span>:</span>
						<select name="" id="" class="">
							<option value="">분</option>
						</select>
						
						<span class="ml20">브레이크타임</span>
						<input type="text" name="" id="" class="ws300" value="">
					</td>
				</tr>
				<tr>
					<th>목</th>
					<td class="ws120">
						<input type="radio" name="" id="" value=""><label for="">휴무</label>
						<input type="radio" name="" id="" value=""><label for="">영업</label>
					</td>
					<td>
						<span>시작</span>
						<select name="" id="" class="">
							<option value="">시</option>
						</select>
						<span>:</span>
						<select name="" id="" class="">
							<option value="">분</option>
						</select>
						<span>~</span>
						<span>종료</span>
						<select name="" id="" class="">
							<option value="">시</option>
						</select>
						<span>:</span>
						<select name="" id="" class="">
							<option value="">분</option>
						</select>
						
						<span class="ml20">브레이크타임</span>
						<input type="text" name="" id="" class="ws300" value="">
					</td>
				</tr>
				<tr>
					<th>금</th>
					<td class="ws120">
						<input type="radio" name="" id="" value=""><label for="">휴무</label>
						<input type="radio" name="" id="" value=""><label for="">영업</label>
					</td>
					<td>
						<span>시작</span>
						<select name="" id="" class="">
							<option value="">시</option>
						</select>
						<span>:</span>
						<select name="" id="" class="">
							<option value="">분</option>
						</select>
						<span>~</span>
						<span>종료</span>
						<select name="" id="" class="">
							<option value="">시</option>
						</select>
						<span>:</span>
						<select name="" id="" class="">
							<option value="">분</option>
						</select>
						
						<span class="ml20">브레이크타임</span>
						<input type="text" name="" id="" class="ws300" value="">
					</td>
				</tr>
				<tr>
					<th>토</th>
					<td class="ws120">
						<input type="radio" name="" id="" value=""><label for="">휴무</label>
						<input type="radio" name="" id="" value=""><label for="">영업</label>
					</td>
					<td>
						<span>시작</span>
						<select name="" id="" class="">
							<option value="">시</option>
						</select>
						<span>:</span>
						<select name="" id="" class="">
							<option value="">분</option>
						</select>
						<span>~</span>
						<span>종료</span>
						<select name="" id="" class="">
							<option value="">시</option>
						</select>
						<span>:</span>
						<select name="" id="" class="">
							<option value="">분</option>
						</select>
						
						<span class="ml20">브레이크타임</span>
						<input type="text" name="" id="" class="ws300" value="">
					</td>
				</tr>
				 -->
			</table>
		</div>
	</form>
	
	<hr class="view_line">
	
	<form name="" action="" method="post">
	
		<input type="hidden" name="store_idx" value="<%= storeIdx %>">
		<h2>운영설정</h2>
		<div>
			<input type="radio" name="" id="" value=""><label for="">운영</label>
			<input type="radio" name="" id="" value=""><label for="">휴업</label>
			<input type="radio" name="" id="" value=""><label for="">폐업</label>
		</div>
		<input type="submit" class="btn_black mt10 ml200" value="수정">
	</form>
</div>
   
<%@include file="../common/footer.jsp"%>