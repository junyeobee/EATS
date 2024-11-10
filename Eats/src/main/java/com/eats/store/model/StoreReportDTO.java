package com.eats.store.model;

import java.sql.*;

public class StoreReportDTO {
	private int rev_idx;
	private int reserve_idx;
	private int rev_score;
	private String rev_content;
	private Date rev_writedate;
	private int rev_state;
	private String rev_img;
	private String rev_menu;
	private String rev_tag;
	
	public StoreReportDTO() {
		// TODO Auto-generated constructor stub
	}

	public StoreReportDTO(int rev_idx, int reserve_idx, int rev_score, String rev_content, Date rev_writedate,
			int rev_state, String rev_img, String rev_menu, String rev_tag) {
		super();
		this.rev_idx = rev_idx;
		this.reserve_idx = reserve_idx;
		this.rev_score = rev_score;
		this.rev_content = rev_content;
		this.rev_writedate = rev_writedate;
		this.rev_state = rev_state;
		this.rev_img = rev_img;
		this.rev_menu = rev_menu;
		this.rev_tag = rev_tag;
	}

	public int getRev_idx() {
		return rev_idx;
	}

	public void setRev_idx(int rev_idx) {
		this.rev_idx = rev_idx;
	}

	public int getReserve_idx() {
		return reserve_idx;
	}

	public void setReserve_idx(int reserve_idx) {
		this.reserve_idx = reserve_idx;
	}

	public int getRev_score() {
		return rev_score;
	}

	public void setRev_score(int rev_score) {
		this.rev_score = rev_score;
	}

	public String getRev_content() {
		return rev_content;
	}

	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}

	public Date getRev_writedate() {
		return rev_writedate;
	}

	public void setRev_writedate(Date rev_writedate) {
		this.rev_writedate = rev_writedate;
	}

	public int getRev_state() {
		return rev_state;
	}

	public void setRev_state(int rev_state) {
		this.rev_state = rev_state;
	}

	public String getRev_img() {
		return rev_img;
	}

	public void setRev_img(String rev_img) {
		this.rev_img = rev_img;
	}

	public String getRev_menu() {
		return rev_menu;
	}

	public void setRev_menu(String rev_menu) {
		this.rev_menu = rev_menu;
	}

	public String getRev_tag() {
		return rev_tag;
	}

	public void setRev_tag(String rev_tag) {
		this.rev_tag = rev_tag;
	}
	
}
