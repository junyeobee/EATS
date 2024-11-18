<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		//window.alert('${msg}');
		//location.href='${goPage}';
		
		window.onload = function() {
            // 서버에서 전달받은 메시지를 alert로 표시
            alert("${msg}");

            // 경고 후 업로드 페이지로 리다이렉트
            window.location.href = "${goPage}";
        }
	</script>
</body>
</html>