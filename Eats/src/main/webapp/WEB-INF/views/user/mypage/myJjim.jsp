<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 찜한 매장</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f4ec;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 600px;
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }
        .jjim-item {
            background-color: #fff5e4;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .jjim-item img {
            width: 50px;
            height: 50px;
            border-radius: 5px;
            margin-right: 15px;
        }
        .store-info {
            flex-grow: 1;
        }
        .store-name {
            font-size: 18px;
            font-weight: bold;
        }
        .store-detail {
            font-size: 14px;
            color: #555;
        }
        .status {
            font-size: 12px;
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">나의 저장 목록</div>
        
        <c:forEach var="jjim" items="${jjimList}">
            <div class="jjim-item">
                <img src="${jjim.storeImg}" alt="매장 이미지">
                <div class="store-info">
                    <div class="store-name">${jjim.storeName}</div>
                    <div class="store-detail">별점: ${jjim.storeRating}</div>
                    <div class="status">${jjim.visitStatus}</div>
                </div>
                <a href="${jjim.detailLink}" class="view-detail">전체보기</a>
            </div>
        </c:forEach>
    </div>
</body>
</html>
