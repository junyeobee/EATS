<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>구독 신청</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h2>구독 신청</h2>
    <form id="subscribeForm">
        <input type="hidden" name="storeIdx" value="${storeIdx}">
        <select name="gudokType">
            <option value="1">월간 구독</option>
            <option value="2">연간 구독</option>
        </select>
        <button type="button" onclick="requestPay()">구독하기</button>
    </form>

    <script>
        function requestPay() {
            const data = {
                storeIdx: $("input[name='storeIdx']").val(),
                gudokType: $("select[name='gudokType']").val()
            };

            $.ajax({
                url: "/kakao/subscribe",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function(response) {
                    window.location.href = response;
                }
            });
        }
    </script>
</body>
</html>