<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="user-header" id="userHeader">
	<div class="header-top">
		<div class="header-top-empty"></div>
		<div class="header-top-content">
			<ul>
				<c:if test="${empty user_idx }">
				<li>
					<span class="join-span" id="join_span">JOIN</span>
				</li>
				</c:if>
				<c:if test="${user_idx eq 1}">
				<li>
					<span class="admin-span" id="admin_span">ADMIN</span>
				</li>
				</c:if>
				<li>
					<span class="store-span" id="store_span">STORE</span>
				</li>
			</ul>
		</div>
	</div>
	<div class="header-main">
		<div class="empty"></div>
		<div class="logo-wrap">
			<a href="/"><img src="/svg/logo_icon_red.svg"></a>
		</div>
		<c:if test="${empty user_idx }">
		<div class="login-wrap">
			<a href="/user/login"><img src="/img/user/user_man.png"></a>
		</div>
		</c:if>
		<c:if test="${!empty user_idx }">
		<div class="link-wrap">
			<a href="#"><img src="/img/user/user_man.png"></a>
			<div class="dropdown-wrap">
				<ul class="user-menu-panel">
					<li class="menu-list" id="li_myplate">
						<img src="/img/user/myplate_icon.png"> 
						<span>My plate</span>
					</li>
					<li class="menu-list" id="li_mypage">
						<img src="/img/user/mypage_icon.png">
						<span>My Page</span>
					</li>
				</ul>
				<div class="user-info-wrap">
					<div>
						<strong>${user_nickname }님</strong><span>&nbsp;로그인 중</span>
					</div>
					<a href="/user/logout">Logout</a>
				</div>
			</div>
		</div>
		</c:if>	
	</div>
</header>