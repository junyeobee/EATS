<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>정기구독 신청</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
    body {
        font-family: 'Noto-Sans', sans-serif;
        
    }
    #yellow {
        background-color: #FFD700;
        width: auto;
        height: 440px;
        text-align: center;
        padding: 50px;
    }
    #kakaoDiv {
        text-align: center;
        display: grid;
        align-content: space-between;
        justify-content: center;
        margin: 0 auto;
        width: fit-content;
        padding: 30px;
        margin-top: 100px;
        border: 3px solid #191919;
        border-radius: 5px;
        background-color: white;
        cursor: pointer;
    }
    #cancel {
        position: absolute;
        bottom: 1px;
        width: 516px;
        height: 35px;
        color: white;
        font-size: 15px;
        font-weight: bold;
        background-color: #191919;
        border: none;
        border-radius: 5px;
        left: 0;
        border: 1px solid #121212;
    }
    p {
        margin-bottom: 0;
    }
</style>
<body>
    <h2>정기구독 신청</h2>
    <hr>
    <div id = "yellow">
        <div id = "kakaoDiv">
            <input type="hidden" name="userId" value="test_user">
            <img src = "../../img/store/storeLanding/kakaopay.png" alt="kakaopay" width="200" height="200" id = "payButton">
            <p>카카오 페이로 결제하기</p>
        </div>
    </div>
    <button id = "cancel">취소하기</button>
    <script>
$(document).ready(function() {
    $("#kakaoDiv").click(function(e) {
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
		window.self.close();

	
    });
});
</script>
</body>
</html>