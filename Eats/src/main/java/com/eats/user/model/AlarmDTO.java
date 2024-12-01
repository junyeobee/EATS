package com.eats.user.model;

public class AlarmDTO {

	private int s_alarm_idx;
	private int user_idx;
	private int store_idx;
	private String s_alarm_date;
	private String s_alarm_time;
	private int s_alarm_count;
	
	//추가내용
	private String store_name;
	private String store_img;
	
	public AlarmDTO() {
		
	}

	public AlarmDTO(int s_alarm_idx, int user_idx, int store_idx, String s_alarm_date, String s_alarm_time,
			int s_alarm_count) {
		super();
		this.s_alarm_idx = s_alarm_idx;
		this.user_idx = user_idx;
		this.store_idx = store_idx;
		this.s_alarm_date = s_alarm_date;
		this.s_alarm_time = s_alarm_time;
		this.s_alarm_count = s_alarm_count;
	}

	//추가내용 들어간 생성자
	public AlarmDTO(int s_alarm_idx, int user_idx, int store_idx, String s_alarm_date, String s_alarm_time,
			int s_alarm_count, String store_name, String store_img) {
		super();
		this.s_alarm_idx = s_alarm_idx;
		this.user_idx = user_idx;
		this.store_idx = store_idx;
		this.s_alarm_date = s_alarm_date;
		this.s_alarm_time = s_alarm_time;
		this.s_alarm_count = s_alarm_count;
		this.store_name = store_name;
		this.store_img = store_img;
	}

	public int getS_alarm_idx() {
		return s_alarm_idx;
	}

	public void setS_alarm_idx(int s_alarm_idx) {
		this.s_alarm_idx = s_alarm_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public String getS_alarm_date() {
		return s_alarm_date;
	}

	public void setS_alarm_date(String s_alarm_date) {
		this.s_alarm_date = s_alarm_date;
	}

	public String getS_alarm_time() {
		return s_alarm_time;
	}

	public void setS_alarm_time(String s_alarm_time) {
		this.s_alarm_time = s_alarm_time;
	}

	public int getS_alarm_count() {
		return s_alarm_count;
	}

	public void setS_alarm_count(int s_alarm_count) {
		this.s_alarm_count = s_alarm_count;
	}

	//////////////////////////////////////
	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_img() {
		return store_img;
	}

	public void setStore_img(String store_img) {
		this.store_img = store_img;
	}
}