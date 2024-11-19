package com.eats.store.model.reserve;

public class ReserveListDTO {
	private int reserve_idx;
	private String reserve_date;
	private String reserve_time;
	private int reserve_count;
	private int reserve_table_idx;
	private String request;
	private int reserve_state;
	private String reserve_applydate;
	private String user_name;
	private String user_tel;
	private String user_nickname;
	
	public ReserveListDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReserveListDTO(int reserve_idx, String reserve_date, String reserve_time, int reserve_count,
			int reserve_table_idx, String request, int reserve_state, String reserve_applydate, String user_name,
			String user_tel, String user_nickname) {
		this.reserve_idx = reserve_idx;
		this.reserve_date = reserve_date;
		this.reserve_time = reserve_time;
		this.reserve_count = reserve_count;
		this.reserve_table_idx = reserve_table_idx;
		this.request = request;
		this.reserve_state = reserve_state;
		this.reserve_applydate = reserve_applydate;
		this.user_name = user_name;
		this.user_tel = user_tel;
		this.user_nickname = user_nickname;
	}

	public int getReserve_idx() {
		return reserve_idx;
	}

	public void setReserve_idx(int reserve_idx) {
		this.reserve_idx = reserve_idx;
	}

	public String getReserve_date() {
		return reserve_date;
	}

	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}

	public String getReserve_time() {
		return reserve_time;
	}

	public void setReserve_time(String reserve_time) {
		this.reserve_time = reserve_time;
	}

	public int getReserve_count() {
		return reserve_count;
	}

	public void setReserve_count(int reserve_count) {
		this.reserve_count = reserve_count;
	}

	public int getReserve_table_idx() {
		return reserve_table_idx;
	}

	public void setReserve_table_idx(int reserve_table_idx) {
		this.reserve_table_idx = reserve_table_idx;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public int getReserve_state() {
		return reserve_state;
	}

	public void setReserve_state(int reserve_state) {
		this.reserve_state = reserve_state;
	}

	public String getReserve_applydate() {
		return reserve_applydate;
	}

	public void setReserve_applydate(String reserve_applydate) {
		this.reserve_applydate = reserve_applydate;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	
	
}
