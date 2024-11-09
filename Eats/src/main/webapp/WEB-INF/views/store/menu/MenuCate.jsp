<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            padding: 20px;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .add-category-btn {
            display: flex;
            align-items: center;
            background: none;
            border: none;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .add-category-btn:before {
            content: '+';
            margin-right: 8px;
            font-size: 20px;
        }

        .content-wrapper {
            display: flex;
            gap: 20px;
        }

        .category-list {
            flex: 1;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 4px;
            min-height: 400px;
        }

        .category-item {
            padding: 10px 15px;
            margin-bottom: 8px;
            background-color: #fff;
            border-radius: 4px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
        }

        .category-item:hover {
            background-color: #e9ecef;
        }

        .delete-btn {
            display: none;
            background: none;
            border: none;
            color: #dc3545;
            cursor: pointer;
            font-size: 18px;
        }

        .category-item:hover .delete-btn {
            display: block;
        }

        .category-edit {
            flex: 1;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .input-group input {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 16px;
        }

        .button-group {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-cancel {
            background-color: #f8f9fa;
        }

        .btn-save {
            background-color: #212529;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>메뉴 카테고리 관리</h1>
        <button class="add-category-btn">새 카테고리</button>
        
        <div class="content-wrapper">
            <div class="category-list">
                <div class="category-item">
                    저녁메뉴
                    <button class="delete-btn">×</button>
                </div>
                <div class="category-item">
                    점심메뉴
                    <button class="delete-btn">×</button>
                </div>
                <!-- 새로운 카테고리 아이템들이 여기에 추가됩니다 -->
            </div>
            
            <div class="category-edit">
                <div class="input-group">
                    <label>카테고리 명</label>
                    <input type="text" placeholder="카테고리 이름을 지정해주세요.">
                </div>
                
                <div class="button-group">
                    <button class="btn btn-cancel">취소</button>
                    <button class="btn btn-save">저장</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>