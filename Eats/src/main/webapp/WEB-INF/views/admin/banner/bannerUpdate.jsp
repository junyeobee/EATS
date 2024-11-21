<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 30px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .file-upload {
            margin: 10px 0;
        }

        .file-notice {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
        }

        .radio-group {
            display: flex;
            gap: 20px;
        }

        .radio-group label {
            display: flex;
            align-items: center;
            font-weight: normal;
        }

        .date-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .date-input {
            width: 140px;
        }

        .button-group {
            margin-top: 30px;
            display: flex;
            gap: 10px;
            justify-content: flex-end;
        }

        .btn {
            padding: 8px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-cancel {
            background: #f1f1f1;
            color: #333;
        }

        .btn-submit {
            background: #F3553C;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>배너 수정</h1>
        <form name="banenerInsertForm" action="bannerInsertOk" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>배너명</label>
                <input type="text" name="banner_name" id="banner_name" class="form-control" required>
               
            </div>

            <div class="form-group">
                <label>파일업로드</label>
                <div class="file-upload">
                    <input type="file" name="banner_img" id="banner_img" accept="image/jpeg,image/jpg,image/png" required>
                </div>
                <div class="file-notice">
                    • 정사각형 이미지 사용 (1440px X 1440px / 1080px X 1080px 권장)<br>
                    • JPG, JPEG, PNG 형식 파일 등록
                </div>
            </div>

            <div class="form-group">
                <label>링크 URL</label>
                <input type="url" name="banner_url" id="banner_url" class="form-control">
            </div>
            
            
            <div class="form-group">
                <label>배너 순서</label>
                <select name="banner_order"> 
                
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  
                  </select>
            </div>

    

            <div class="form-group">
                <label>반영 기간</label>
                <div class="date-group">
                    <input type="date" name="banner_sdate" id="banner_sdate" class="form-control date-input">
                    <span>~</span>
                    <input type="date" name="banner_edate" id="banner_edate" class="form-control date-input">
                </div>
            </div>

            <div class="form-group">
                <label>반영 여부</label>
                <div class="radio-group">
                    <label>
                        <input type="radio" name="banner_stat" value="1" checked> YES
                    </label>
                    <label>
                        <input type="radio" name="banner_stat" value="2"> NO
                    </label>
                </div>
            </div>

         

            <div class="button-group">
                <button type="button" class="btn btn-cancel" onclick="location.href='/bannerList'">취소</button>
                <button type="submit" class="btn btn-submit">수정</button>
            </div>
        </form>
    </div>
</body>
</html>