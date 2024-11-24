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
        <form id="editProfileForm" action="/user/mypage/updateProfile" method="post">
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
                <small class="error-message" style="color: red; display: none;">전화번호 형식이 올바르지 않습니다. (예: 010-1234-5678)</small>
            </div>

            <!-- 프로필 이미지 경로 -->
            <div class="form-group">
                <label for="profile_image">프로필 이미지 경로</label>
                <input type="text" id="profile_image" name="profile_image" value="/img/user/profile/${userProfile.profile_image}" placeholder="이미지 파일 경로를 입력하세요">
                <button type="button" onclick="uploadFile()">이미지 업로드</button>
            </div>

            <!-- 저장하기 버튼 -->
            <div class="button-group">
                <button type="submit" class="btn_save">저장하기</button>
                <button type="button" class="btn_back" onclick="history.back()">이전으로</button>
            </div>
        </form>
    </div>

    <!-- 파일 업로드 및 유효성 검사 스크립트 -->
<script>
    // 폼 유효성 검사
    document.getElementById('editProfileForm').addEventListener('submit', function (event) {
        const telInput = document.getElementById('user_tel');
        const telRegex = /^(01[016789])-([0-9]{3,4})-([0-9]{4})$/; // 한국 전화번호 형식

        if (!telRegex.test(telInput.value)) {
            event.preventDefault(); // 폼 제출 중단
            const errorMessage = telInput.nextElementSibling;
            errorMessage.style.display = 'block'; // 에러 메시지 표시
            alert('전화번호 형식이 올바르지 않습니다. (예: 010-1234-5678)');
            telInput.focus();
        } else {
            const errorMessage = telInput.nextElementSibling;
            errorMessage.style.display = 'none'; // 에러 메시지 숨기기
        }
    });

    // 전화번호 입력 중 자동 하이픈 추가
    const telInput = document.getElementById('user_tel');
    telInput.addEventListener('input', function () {
        let value = this.value.replace(/[^0-9]/g, ''); // 숫자만 추출
        if (value.length > 3 && value.length <= 7) {
            this.value = value.slice(0, 3) + '-' + value.slice(3);
        } else if (value.length > 7) {
            this.value = value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7);
        }
    });


        // 파일 업로드 기능
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
                        const response = await fetch('/file/upload', { // 서버로 파일 전송
                            method: 'POST',
                            body: formData
                        });

                        if (response.ok) {
                            const data = await response.json();

                            // 디버깅: 서버에서 받은 데이터를 콘솔에 출력
                            console.log("서버 응답 데이터:", data);

                            if (data.filePath) {
                                document.getElementById('profile_image').value = data.filePath;
                                alert('이미지 업로드 성공!');
                            } else {
                                alert('파일 경로를 반환받지 못했습니다. 서버 응답 확인 필요.');
                            }
                        } else {
                            alert('이미지 업로드 실패! 서버 응답 오류.');
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
