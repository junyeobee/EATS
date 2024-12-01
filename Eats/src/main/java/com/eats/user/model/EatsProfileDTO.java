package com.eats.user.model;

public class EatsProfileDTO {

	private int user_idx;
	private String user_nickname;
	private String user_intro;
	private String user_location;
	private String user_tel;
	private int user_point;

	public EatsProfileDTO() {
		
	}

	public EatsProfileDTO(int user_idx, String user_nickname, String user_intro, String user_location, String user_tel,
			int user_point) {
		super();
		this.user_idx = user_idx;
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
