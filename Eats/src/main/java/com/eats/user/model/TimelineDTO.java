package com.eats.user.model;

/*CREATE TABLE EATS_USER(
	    USER_IDX NUMBER(10) PRIMARY KEY,
	    USER_ID VARCHAR2(50) UNIQUE,  --카카오로 로그인한 회원은 일반 아이디 null
	    USER_PWD VARCHAR2(50),  -- 일반 회원만 비밀번호 필요
	    USER_NAME VARCHAR2(50) NOT NULL, 
	    USER_EMAIL VARCHAR2(100) NOT NULL UNIQUE,
	    USER_BIRTH VARCHAR2(10) NOT NULL, 
	    USER_GENDER NUMBER(1) NOT NULL, -- 0:기타 1:남 2:여
	    JOIN_METHOD VARCHAR2(10) NOT NULL,  -- 'NORMAL', 'KAKAO'
	    KAKAO_ID VARCHAR2(100)  -- 소셜 로그인 ID
	);
	CREATE SEQUENCE USER_IDX_SEQ
		START WITH 1
		INCREMENT BY 1;

	유저 프로필
	CREATE TABLE USER_PROFILE(
		USER_IDX NUMBER(10) PRIMARY KEY
		, USER_NICKNAME VARCHAR2(50) NOT NULL
		, USER_INTRO VARCHAR2(500) NULL
		, USER_LOCATION VARCHAR2(50) NULL
		, USER_TEL VARCHAR2(50) NOT NULL
		, USER_POINT NUMBER(10) DEFAULT 0
	);*/

public class TimelineDTO {

	private int user_idx;
	private String user_id;
	private String user_name;
	private String user_nickname;
	
	public TimelineDTO() {
		
	}
	
	
	public TimelineDTO(int user_idx, String user_id, String user_name, String user_nickname) {
		
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
	}
	
	
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	
	
	
	
	
	
}
