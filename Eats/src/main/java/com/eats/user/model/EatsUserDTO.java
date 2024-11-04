package com.eats.user.model;

import java.sql.Date;

public class EatsUserDTO {

	private int user_idx;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_email;
	private java.sql.Date user_birth;
	private int user_gender;
	private String join_method;
	
	//기본생성자
	public EatsUserDTO() {
		
	}

	//모든 인자를 가진 인자생성자
	public EatsUserDTO(int user_idx, String user_id, String user_pwd, String user_name, String user_email, Date user_birth,
			int user_gender, String join_method) {
		super();
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_birth = user_birth;
		this.user_gender = user_gender;
		this.join_method = join_method;
	}

	//getter & setter
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

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
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

	public java.sql.Date getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(java.sql.Date user_birth) {
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
}
