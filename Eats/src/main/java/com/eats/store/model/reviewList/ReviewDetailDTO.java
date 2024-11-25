package com.eats.store.model.reviewList;

public class ReviewDetailDTO {
	private String user_name;
	private String reserve_date;
	private String reserve_time;
	private int reserve_count;
	private int sts_num;
	private int rev_score;
	private String rev_content;
	private String rev_tag;
	private String rev_menu;
	
	public ReviewDetailDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDetailDTO(String user_name, String reserve_date, String reserve_time, int reserve_count, int sts_num,
			int rev_score, String rev_content, String rev_tag, String rev_menu) {
		super();
		this.user_name = user_name;
		this.reserve_date = reserve_date;
		this.reserve_time = reserve_time;
		this.reserve_count = reserve_count;
		this.sts_num = sts_num;
		this.rev_score = rev_score;
		this.rev_content = rev_content;
		this.rev_tag = rev_tag;
		this.rev_menu = rev_menu;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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

	public int getSts_num() {
		return sts_num;
	}

	public void setSts_num(int sts_num) {
		this.sts_num = sts_num;
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

	public String getRev_tag() {
		return rev_tag;
	}

	public void setRev_tag(String rev_tag) {
		this.rev_tag = rev_tag;
	}

	public String getRev_menu() {
		return rev_menu;
	}

	public void setRev_menu(String rev_menu) {
		this.rev_menu = rev_menu;
	}
	
}
