<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
           
        }
        
        .container {
            text-align: center;
            width: 100%;
            max-width: 400px;
            padding: 20px;
        }
        
        .title {
            font-size: 23px;
            margin-bottom: 40px;
        }
        
        .input-field {
            font-size: 26px;
            width: 100%;
            padding: 10px;
            margin-bottom: 40px;
            border: none;
            border-bottom: 1px solid #ddd;
            outline: none;
        }
        
        .button-container {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        
        .btn {
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 150px;
        }
        
        .btn-gray {
            background-color: #e9ecef;
            color: #000;
            text-decoration: none;
        }
        
        .btn-blue {
            background-color: #349FFB;
            color: white;
            text-decoration: none;
        }
</style>
</head>
<body>

	<%-- <div class="store-findid">

		<div class="rectangle-6"></div>
		<div class="frame-156">
			<div class="div">로그인 하기</div>
		</div>
		<div class="frame-157">
			<div class="div2">
				<a href="/storeFindPwdPage">비밀번호 찾기</a>
			</div>
		</div>

		<div class="div3">회원님의 아이디를 확인해주세요.</div>
		<div class="div4">

			<c:choose>
				<c:when test="${empty findId}">
					<p>아이디를 찾을 수 없습니다.</p>
					<p>${message}</p>
				</c:when>

				<c:otherwise>
  					${findId}
  				</c:otherwise>
			</c:choose>
		</div> --%>
  <div class="container">
        <h1 class="title">회원님의 아이디를 확인해주세요.</h1>
        	<c:choose>
				<c:when test="${empty findId}">
					<p>아이디를 찾을 수 없습니다.</p>
					<p>${message}</p>
				</c:when>

				<c:otherwise>
  					 <input type="text" class="input-field" value="${findId}" readonly>
  				</c:otherwise>
			</c:choose>
       
        <div class="button-container">
            <a href="/storeFindPwdPage" class="btn btn-gray">비밀번호 찾기</a>
            <a href="/storeLogin" class="btn btn-blue">로그인 하기</a>
          
        </div>
    </div>



	</div>

</body>
</html>