<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 수정</title>
    <link rel="stylesheet" href="/css/user/editProfileCss.css">
</head>
<body>
    <div class="container">
        <h1>내 정보 수정</h1>
        <form action="/user/mypage/updateProfile" method="post">
            <!-- 사용자 고유 ID -->
            <input type="hidden" name="user_idx" value="${userProfile.user_idx}">

            <!-- 닉네임 -->
            <div class="form-group">
                <label for="user_nickname">닉네임</label>
                <input type="text" id="user_nickname" name="user_nickname" value="${userProfile.user_nickname}" required>
            </div>

            <!-- 소개 -->
            <div class="form-group">
                <label for="user_intro">소개</label>
                <textarea id="user_intro" name="user_intro">${userProfile.user_intro}</textarea>
            </div>

            <!-- 위치 -->
            <div class="form-group">
                <label for="user_location">위치</label>
                <input type="text" id="user_location" name="user_location" value="${userProfile.user_location}">
            </div>

            <!-- 전화번호 -->
            <div class="form-group">
                <label for="user_tel">전화번호</label>
                <input type="text" id="user_tel" name="user_tel" value="${userProfile.user_tel}" required>
            </div>

            <!-- 프로필 이미지 경로 -->
            <div class="form-group">
                <label for="profile_image">프로필 이미지 경로</label>
                <input type="text" id="profile_image" name="profile_image" value="${userProfile.profile_image}" placeholder="이미지 파일 경로를 입력하세요">
                <button type="button" onclick="uploadFile()">이미지 업로드</button>
            </div>

            <!-- 저장하기 버튼 -->
            <div class="button-group">
                <button type="submit" class="btn_save">저장하기</button>
                <button type="button" class="btn_back" onclick="history.back()">이전으로</button>
            </div>
        </form>
    </div>

    <!-- 파일 업로드 스크립트 -->
    <script>
    function uploadFile() {
        const input = document.createElement('input');
        input.type = 'file';
        input.accept = 'image/*';

        input.onchange = async function () {
            const file = input.files[0];
            if (file) {
                const formData = new FormData();
                formData.append("file", file);

                try {
                    const response = await fetch('/file/upload', {
                        method: 'POST',
                        body: formData
                    });

                    if (response.ok) {
                        const data = await response.json();
                        document.getElementById('profile_image').value = data.filePath;
                        alert('이미지 업로드 성공!');
                    } else {
                        alert('이미지 업로드 실패!');
                    }
                } catch (error) {
                    console.error('파일 업로드 에러:', error);
                    alert('이미지 업로드 중 오류가 발생했습니다.');
                }
            }
        };

        input.click(); // 파일 선택 창 열기
    }


    </script>
</body>
</html>
