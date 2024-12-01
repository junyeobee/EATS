package com.eats.admin.model;

public class ReviewDeleteDTO {
	
	private int rev_idx;
	private String rev_content, rev_writedate, req_date;
	private int del_state, rev_state;
	private String del_reason, check_date;
	private int store_idx, user_idx;
	private String store_id, user_id;
	
	
	
	    
	
	public ReviewDeleteDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDeleteDTO(int rev_idx, String rev_content, String rev_writedate, String req_date, int del_state, int rev_state,
			String del_reason, String check_date, int store_idx, int user_idx, String store_id, String user_id) {
		super();
		this.rev_idx = rev_idx;
		this.rev_content = rev_content;
		this.rev_writedate = rev_writedate;
		this.req_date = req_date;
		this.del_state = del_state;
		this.rev_state = rev_state;
		this.del_reason = del_reason;
		this.check_date = check_date;
		this.store_idx = store_idx;
		this.user_idx = user_idx;
		this.store_id = store_id;
		this.user_id = user_id;
	}

	public int getRev_idx() {
		return rev_idx;
	}

	public void setRev_idx(int rev_idx) {
		this.rev_idx = rev_idx;
	}

	public String getRev_content() {
		return rev_content;
	}

	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}

	public String getRev_writedate() {
		return rev_writedate;
	}

	public void setRev_writedate(String rev_writedate) {
		this.rev_writedate = rev_writedate;
	}

	public String getReq_date() {
		return req_date;
	}

	public void setReq_date(String req_date) {
		this.req_date = req_date;
	}

	public int getDel_state() {
		return del_state;
	}

	public void setDel_state(int del_state) {
		this.del_state = del_state;
	}
	
	public int getRev_state() {
		return rev_state;
	}
	
	public void setRev_state(int rev_state) {
		this.rev_state = rev_state;
	}

	public String getDel_reason() {
		return del_reason;
	}

	public void setDel_reason(String del_reason) {
		this.del_reason = del_reason;
	}

	public String getCheck_date() {
		return check_date;
	}

	public void setCheck_date(String check_date) {
		this.check_date = check_date;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	
	public String getStore_id() {
		return store_id;
	}
	
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	
	public String getUser_id() {
		return user_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
