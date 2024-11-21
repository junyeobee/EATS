package com.eats.admin.model;

public class AdminUserDTO {
	private int user_idx;
	private String user_id, user_name, user_email, user_birth;
	private int user_gender;
	private String join_method, kakao_id;
	
	private String user_nickname, user_intro, user_location, user_tel;
	private int user_point;
	
	public AdminUserDTO() {
		// TODO Auto-generated constructor stub
	}

	public AdminUserDTO(int user_idx, String user_id, String user_name, String user_email, String user_birth,
			int user_gender, String join_method, String kakao_id, String user_nickname, String user_intro,
			String user_location, String user_tel, int user_point) {
		super();
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_birth = user_birth;
		this.user_gender = user_gender;
		this.join_method = join_method;
		this.kakao_id = kakao_id;
		this.user_nickname = user_nickname;
		this.user_intro = user_intro;
		this.user_location = user_location;
		this.user_tel = user_tel;
		this.user_point = user_point;
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

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public int getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(int user_gender) {
		this.user_gender = user_gender;
	}

	public String getJoin_method() {
		return join_method;
	}

	public void setJoin_method(String join_method) {
		this.join_method = join_method;
	}

	public String getKakao_id() {
		return kakao_id;
	}

	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_intro() {
		return user_intro;
	}

	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}

	public String getUser_location() {
		return user_location;
	}

	public void setUser_location(String user_location) {
		this.user_location = user_location;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	
	
	
	
	
}
