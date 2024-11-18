<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    .header {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        height: 80px;
        z-index: 1000;
        background-color: #daf0ff;
        padding: 0 32px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        border-bottom: 1px solid #f8fafc;
    }

    .nav-logo {
        display: flex;
        align-items: center;
        gap: 16px;
        padding: 0 24px;
    }
    .nav-logo img{
		width: 56px;
		height: 48px;
		cursor: pointer;
    }

    .header-user {
        display: flex;
        align-items: center;
        gap: 16px;
    }

    .user-profile {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 6px 12px;
        border-radius: 8px;
        background-color: #f8fafc;
    }
</style>
<script>
	document.addEventListener('DOMContentLoaded', function(){
		let homebtn = document.getElementById('homeLogo');
		homebtn.addEventListener('click', function() {
			location.href = '/storeMain';
		});
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <header class="header">
        <div class="nav-logo">
            <img src="../img/store/storeLogo.png" alt="Logo" height="32" id = "homeLogo">
        </div>
        <div class="header-user">
            <div class="notifications">
                <i class="icon-bell"></i>
            </div>
            <div class="user-profile">
                <img src="" alt="profile" width="32" height="32">
                <span>파브리키친-용산점</span>
            </div>
        </div>
    </header>
</body>
</html>