<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>정기구독 신청</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h2>정기구독 신청</h2>
    
    <form id="subscribeForm" onsubmit="return false;">
        <input type="hidden" name="userId" value="test_user">
        <button type="button" id="payButton">구독하기</button>
    </form>
    <button id = "cancel"></button>
    <script>
$(document).ready(function() {
    $("#payButton").click(function(e) {
        e.preventDefault();  // 이벤트 기본 동작 중지
        e.stopPropagation();  // 이벤트 전파 중지
        
        var requestData = {
            userId: $('input[name="userId"]').val()
        };
        
        console.log("Sending request:", {
            url: '/store/storeReport/ready',
            method: 'POST',
            data: requestData
        });
        
        $.ajax({
            url: '/store/storeReport/ready',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(requestData),
            beforeSend: function() {
                console.log("Starting request...");
            },
            success: function(response) {
                console.log("Success response:", response);
                if(response && response.next_redirect_pc_url) {
                    // 리다이렉트 전에 로그
                    console.log("Redirecting to:", response.next_redirect_pc_url);
                    window.location.href = response.next_redirect_pc_url;
                } else {
                    console.error("Invalid response:", response);
                    alert('결제 페이지 URL을 받아오지 못했습니다.');
                }
            },
            error: function(xhr, status, error) {
                // 자세한 에러 정보 출력
                console.error("Error details:", {
                    status: xhr.status,
                    statusText: xhr.statusText,
                    responseText: xhr.responseText
                });
                
                // 에러 처리 중 페이지 이동 방지
                e.preventDefault();
                alert('결제 준비 중 오류가 발생했습니다.\n' + error);
            },
            complete: function() {
                console.log("Request completed");
            }
        });
        
        // 폼 제출 방지
        return false;
    });
    $("#cancel").click(function(e){
		$.ajax({
			url: '/store/storeReport/cancel',
            method: 'POST',
		});

	
    });
});
</script>
</body>
</html>