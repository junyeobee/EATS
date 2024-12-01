<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/store/storeContCss.css">

<meta charset="UTF-8">
<title>eats</title>

<script>
	function smallTagAdd(thisCon, click_id){
		

        // 선택된 option의 value
        var this_small_cate_key = thisCon.value;

		
		//중복태그 들어가지 않도록 시작
	    var container = document.getElementById('cateBox');
	    var exists = false;
	    var inputs = container.querySelectorAll('input[name="small_cate_key"]');

	    inputs.forEach(function(input) {
	        if (input.value === this_small_cate_key) {
	            exists = true; // 동일한 값이 있으면 exists를 true로 설정
	        }
	    });
	    
		if (exists) {
	        alert("동일한 값을 가진 태그가 이미 존재합니다.");
           	document.querySelector("[id='"+click_id+"']").selectedIndex = 0;
	        document.querySelector("[id='"+click_id+"']").focus();
	        return false;
	    }
		//중복태그 들어가지 않도록 마침
	    
        // 선택된 option의 value
        var this_small_cate_key = thisCon.value;

        // 선택된 option의 텍스트
        var this_small_cate_value = thisCon.options[thisCon.selectedIndex].text;
        var this_big_cate_key = thisCon.options[thisCon.selectedIndex].getAttribute("value2");

        // 결과를 콘솔에 출력 (확인용)
        //console.log("Selected Value: " + this_value);
        //console.log("Selected Text: " + this_text);

        //alert(this_big_cate_key+"//"+this_small_cate_key+"//"+this_small_cate_value);
        
        // 추가할 span 요소
        var newSpan = "";
        newSpan += "<span class='mr10 small_tag_span_99_"+this_big_cate_key+"_"+this_small_cate_key+"'>";
        newSpan += "	<span>"+this_small_cate_value +"</span>";
        newSpan += "	<input type='hidden' name='store_cate_idx' id='' class='ws80' value=''>";
        newSpan += "	<input type='hidden' name='big_cate_key' id='' class='ws80' value='"+this_big_cate_key+"'>";
        newSpan += "	<input type='hidden' name='small_cate_key' id='' class='ws80' value='"+this_small_cate_key+"'>";
        newSpan += "    <span class='ml10 cspi' onclick=\"small_cate_del('" + this_small_cate_value + "', '99_" + this_big_cate_key +"_"+this_small_cate_key+ "')\">X</span>";
        newSpan += "</span>";

        // .dddd 클래스가 있는 요소에 newSpan을 추가
        $('.cbb_'+this_big_cate_key).append(newSpan);
	}
	
	function small_cate_del(small_cate_name, cate_key_value) {
	    //alert("'" + small_cate_name + "'////" +cate_key_value +" 태그가 삭제됩니다.");
	    alert("'" + small_cate_name + "' 태그가 삭제됩니다.");
	    
	    // 해당 클래스의 span 요소 삭제
	    $(".small_tag_span_" + cate_key_value).remove();

	    // cate_key_value가 비어있지 않고 99_(db에 있는 값 아니고 화면에서 추가한 경우 99_ 앞에 붙여서 처리해놓음)값이 없는경우
	    //if (cate_key_value != "" && !cate_key_value.includes("99_")) {
	    if (cate_key_value !== "" && !cate_key_value.toString().includes("99_")) {
	        // AJAX 요청 보내기
	        $.ajax({
	            url: "/store/storeTagDel",  // 서버에서 처리할 URL
	            type: "GET",         // GET 방식으로 요청 (URL 파라미터 전송)
	            data: {              // 서버로 전송할 데이터
	                store_cate_key: cate_key_value
	            },
	            success: function(response) {
	                // 서버 응답 성공 시 처리
	                console.log("태그 삭제 완료:", response);
	                // 필요시 추가적인 로직을 여기에 추가할 수 있습니다.
	                alert("삭제완료 되었습니다.");
	            },
	            error: function(xhr, status, error) {
	                // 에러 발생 시 처리
	                console.error("에러 발생:", error);
	                //alert("에러발생");
	            }
	        });
	    }
	}

	function tag_count(){

		const input_cnt = document.getElementsByName('small_cate_key').length;

		// input 요소의 개수 확인
		console.log(input_cnt);  // 3
		
		if(input_cnt <= 1){
			alert("태그를 2개 이상 선택해주세요.");
			return false;
		}
	}
	
	function cate_two(){
		
		alert("찾아오시는 길 작업 안하면 해당부분 tag_count로 변경필요");
		return false;
		tag_count();
	}
	
</script>
</head>
<body>
	<%@ include file="../store_Header.jsp"%>
	<%@ include file="../nav.jsp"%>
	 <div class="container" style="margin-top:150px; margin-left:300px; ">
		<div class="mainCont">