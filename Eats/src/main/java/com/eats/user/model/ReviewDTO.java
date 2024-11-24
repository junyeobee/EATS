package com.eats.user.model;

import java.sql.Date;
import java.util.List;

public class ReviewDTO {

	private int rev_idx;
	private int reserve_idx;
	private int rev_score;
	private String rev_content;
	private Date rev_writedate;
	private int rev_state;
	private String rev_img;
	private String rev_menu;
	private String rev_tag;
	
	//information for review pick
	private Date reserve_date;
	private int user_idx;
	private String user_nickname;
	private int store_idx;
	private String store_name;
	private String store_addr;
	private String profile_image;
	
	private List<Integer> revMenuList;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int rev_idx, int reserve_idx, int rev_score, String rev_content, Date rev_writedate, int rev_state,
			String rev_img, String rev_menu, String rev_tag) {
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

	//리뷰리스트
	public ReviewDTO(int rev_idx, int reserve_idx, int rev_score, String rev_content, Date rev_writedate, int rev_state,
			String rev_img, String rev_menu, String rev_tag, String user_nickname, String profile_image) {
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
		this.user_nickname = user_nickname;
		this.profile_image = profile_image;
	}

	public ReviewDTO(int rev_idx, int reserve_idx, int rev_score, String rev_content, Date rev_writedate, int rev_state,
			String rev_img, String rev_menu, String rev_tag, Date reserve_date, int user_idx, String user_nickname,
			int store_idx, String store_name, String store_addr, String profile_image) {
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
		this.reserve_date = reserve_date;
		this.user_idx = user_idx;
		this.user_nickname = user_nickname;
		this.store_idx = store_idx;
		this.store_name = store_name;
		this.store_addr = store_addr;
		this.profile_image = profile_image;
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

	public Date getReserve_date() {
		return reserve_date;
	}

	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
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

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_addr() {
		return store_addr;
	}

	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}


	
}
