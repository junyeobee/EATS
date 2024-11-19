package com.eats.admin.model;

public class RevDelDTO {
	
	private int rev_idx;
	private String req_date;
	private int del_state;
	private String check_date;
	private String del_reason;
	
	public RevDelDTO() {
		// TODO Auto-generated constructor stub
	}

	public RevDelDTO(int rev_idx, String req_date, int del_state, String check_date, String del_reason) {
		super();
		this.rev_idx = rev_idx;
		this.req_date = req_date;
		this.del_state = del_state;
		this.check_date = check_date;
		this.del_reason = del_reason;
	}

	public int getRev_idx() {
		return rev_idx;
	}

	public void setRev_idx(int rev_idx) {
		this.rev_idx = rev_idx;
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

	public String getCheck_date() {
		return check_date;
	}

	public void setCheck_date(String check_date) {
		this.check_date = check_date;
	}

	public String getDel_reason() {
		return del_reason;
	}

	public void setDel_reason(String del_reason) {
		this.del_reason = del_reason;
	}
	
	

}
