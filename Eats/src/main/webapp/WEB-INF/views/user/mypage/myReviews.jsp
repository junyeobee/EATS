<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 리뷰</title>
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
        .review-item {
            background-color: #fff5e4;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }
        .review-item img {
            width: 50px;
            height: 50px;
            border-radius: 5px;
            margin-right: 15px;
        }
        .review-info {
            flex-grow: 1;
        }
        .store-name {
            font-size: 18px;
            font-weight: bold;
        }
        .review-date {
            font-size: 14px;
            color: #555;
            margin: 5px 0;
        }
        .review-content {
            font-size: 14px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">나의 리뷰</div>
        
        <c:forEach var="review" items="${reviewList}">
            <div class="review-item">
                <img src="${review.storeImg}" alt="매장 이미지">
                <div class="review-info">
                    <div class="store-name">${review.storeName}</div>
                    <div class="review-date">${review.reviewDate}</div>
                    <div class="review-content">${review.reviewContent}</div>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
