<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Pretendard', sans-serif;
        }

        .nav-sidebar {
            position: fixed;
            left: 0;
            top: 80px;
            bottom: 0;
            width: 240px;
            background-color: #ffffff;
            padding: 20px 0;
            border-right: 1px solid #e2e8f0;
        }


        .nav-section {
            margin-bottom: 16px;
        }

        .nav-section-title {
            padding: 0 24px;
            font-size: 12px;
            font-weight: 500;
            color: #475569;
            margin-bottom: 8px;
            text-transform: uppercase;
        }

        .nav-item {
            padding: 0;
            color: #475569;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
        }

        .nav-item > span {
            display: flex;
            align-items: center;
            padding: 12px 24px;
            gap: 12px;
        }
        
        /* 단일 메뉴 아이템용 스타일 추가 */
        .nav-item.single-item > span {
            width: 100%;
            box-sizing: border-box;
            cursor: pointer;
        }
        
        .nav-item.single-item > span > a {
            color: #475569;
            text-decoration: none;
            flex-grow: 1;
        }

        .nav-item > span > a {
            color : #475569;
            text-decoration: none;
        }

        .nav-item > span:hover {
            background-color: #EFF6FF;
        }

        .nav-sub-items {
            display: none;
            margin: 0;
            padding: 0;
            list-style: none;
            background-color: #F8FAFC;
        }

        .nav-item.expanded .nav-sub-items {
            display: block;
        }

        .nav-sub-items .nav-item a {
            display: block;
            padding: 10px 24px 10px 48px;
            color: inherit;
            text-decoration: none;
        }

        .nav-sub-items .nav-item:hover a {
            background-color: #EFF6FF;
        }

        .nav-sub-items .nav-item.active a {
            background-color: #DBEAFE;
            color: #2563EB;
        }
    </style>
</head>
<body>
    <nav class="nav-sidebar">       
        <div class="nav-section">
            <div class="nav-section-title">관리</div>
            <div class="nav-item" data-menu="reservation">
                <span>
                    <i class="icon-calendar"></i>
                    예약관리
                </span>
                <ul class="nav-sub-items">
                    <li class="nav-item">
                        <a href="/reservation/list">예약 현황</a>
                    </li>
                    <li class="nav-item">
                        <a href="/reservation/settings">예약 설정</a>
                    </li>
                </ul>
            </div>
            <div class="nav-item" data-menu="member">
                <span>
                    <i class="icon-people"></i>
                    회원관리
                </span>
                <ul class="nav-sub-items">
                    <li class="nav-item">
                        <a href="/member/list">회원 목록</a>
                    </li>
                    <li class="nav-item">
                        <a href="/member/register">회원 등록</a>
                    </li>
                </ul>
            </div>
            <div class="nav-item single-item">
                <span onclick="window.location.href='/reportLoad'">
                    <i class="icon-people"></i>
                    <a href="/reportLoad">보고서</a>
                </span>
            </div>
        </div>
    </nav>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const currentPath = window.location.pathname;
            
            // 모든 메인 메뉴 아이템
            const mainItems = document.querySelectorAll('.nav-item[data-menu]');
            
            mainItems.forEach(mainItem => {
                const menuSpan = mainItem.querySelector('span');
                // 메인 메뉴 클릭 이벤트
                menuSpan.addEventListener('click', (event) => {
                    event.stopPropagation();
                    const isExpanded = mainItem.classList.contains('expanded');
                    
                    // 다른 모든 메뉴 접기 및 배경색 제거
                    mainItems.forEach(item => {
                        item.classList.remove('expanded');
                        item.style.backgroundColor = '';
                    });
                    
                    // 현재 메뉴 토글
                    if (!isExpanded) {
                        mainItem.classList.add('expanded');
                        mainItem.style.backgroundColor = '#90D7FF';
                    }
                });
            });

            // 서브 메뉴 아이템과 단일 메뉴 아이템
            const allMenuItems = document.querySelectorAll('.nav-sub-items .nav-item, .nav-item > span > a');
            allMenuItems.forEach(item => {
                const link = item.tagName === 'A' ? item : item.querySelector('a');
                
                // 현재 페이지 메뉴 활성화
                if (link.getAttribute('href') === currentPath) {
                    if (item.tagName === 'A') {
                        // 단일 메뉴 아이템인 경우
                        item.closest('.nav-item').classList.add('active');
                    } else {
                        // 서브메뉴 아이템인 경우
                        item.classList.add('active');
                        const parentMenu = item.closest('.nav-item[data-menu]');
                        if (parentMenu) {
                            parentMenu.classList.add('expanded');
                        }
                    }
                }
            });
        });
    </script>
</body>
</html>