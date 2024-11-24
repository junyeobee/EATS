package com.eats.store.model.reserve;

import java.sql.Date;

public class AlarmDTO {
	private int user_idx;
	private String user_name;
	private String user_email;
	private Date alarm_date;
	private String alarm_time;
	private int alarm_count;
	
	public AlarmDTO() {
		// TODO Auto-generated constructor stub
	}

	public AlarmDTO(int user_idx, String user_name, String user_email, Date alarm_date, String alarm_time,
			int alarm_count) {
		this.user_idx = user_idx;
		this.user_name = user_name;
		this.user_email = user_email;
		this.alarm_date = alarm_date;
		this.alarm_time = alarm_time;
		this.alarm_count = alarm_count;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
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

	public Date getAlarm_date() {
		return alarm_date;
	}

	public void setAlarm_date(Date alarm_date) {
		this.alarm_date = alarm_date;
	}

	public String getAlarm_time() {
		return alarm_time;
	}

	public void setAlarm_time(String alarm_time) {
		this.alarm_time = alarm_time;
	}

	public int getAlarm_count() {
		return alarm_count;
	}

	public void setAlarm_count(int alarm_count) {
		this.alarm_count = alarm_count;
	}
	
}
