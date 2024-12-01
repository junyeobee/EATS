<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/store/storeContCss.css">

<meta charset="UTF-8">
<title>eats</title>

</head>
<body>
	<%@ include file="../store_Header.jsp"%>
	<%@ include file="../nav.jsp"%>
	 <div class="container" style="margin-top:150px; margin-left:100px; ">
		<div class="mainCont">

<div class="mainCon_info">
	<form name="infoUpdateReq" action="storeInfoUpdateReqSave" method="post">
	
		<input type="hidden" name="store_idx" value="${store_idx }">
		<c:if test="${not empty data}">	
			
			<input type="hidden" name="su_state" id="" class="ws400" value="대기" placeholder="">
			<input type="hidden" name="su_reason" id="" class="ws400" value="" placeholder="">
			<h2>정보수정신청</h2>
			<div class="btnBox_top">
				<input type="submit" class="btn_black" value="수정요청">
			</div>
			
			<div class="two_contents">
			
				<div class="tableWrite_4 mb60 mr40">
					<table>
						<tr>
							<th>현재 매장명</th>
							<td>${data.store_name}</td>
						</tr>
						<tr>
							<th>현재 전화번호</th>
							<td>${data.store_tel}</td>
						</tr>
						<tr>
							<th>현재 대표자명</th>
							<td>${data.store_ceo}</td>
						</tr>
						<tr>
							<th>현재 주소</th>
							<td>
								<br>
								${data.store_addr} 
								<br><br>
								${data.store_daddr}
							</td>
						</tr>
					</table>
				</div>
				
				<div class="tableWrite_4 mb60">
					<table>
						<tr>
							<th>수정할 매장명</th>
							<td>
								<input type="text" name="su_name" id="" value="">
							</td>
						</tr>
						<tr>
							<th>수정할 전화번호</th>
							<td>
								<input type="text" name="su_tel" id="" value="">
							</td>
						</tr>
						<tr>
							<th>수정할 대표자명</th>
							<td>
								<input type="text" name="su_ceo" id="" value="">
							</td>
						</tr>
						<tr>
							<th>
								<br>
								수정할 주소
								<br><br>
								<input type="button" class="btn_black" onclick="getPostCode()" value="주소 찾기">
							</th>
							<td>
								<br>
								<input type=text name="su_addr" id="su_addr" class="ws300" value="" placeholder="기본주소">
								<br><br>
								<input type=text name="su_daddr" id="su_daddr" class="ws300" value="" placeholder="상세주소">
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			
		</c:if>
	</form>
</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

var width = 500; //팝업의 너비
var height = 600; //팝업의 높이

function getPostCode() {    	
	new daum.Postcode({
		oncomplete : function(data) {
			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname != '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== ''
						&& data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("su_addr").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("su_daddr").focus();
		}
	}).open({
		left: -((window.screen.width/2) + (width / 2)),
	    top:0,
	    popupTitle: '장소 검색'
	});	
}
</script>
   		</div>
	</div>
</body>
</html>