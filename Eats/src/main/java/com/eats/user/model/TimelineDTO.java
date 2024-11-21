package com.eats.user.model;

import java.sql.Date;

/*CREATE TABLE EATS_USER(
    r.RESERVE_IDX,
    r.USER_IDX,
    r.STORE_IDX,
    r.RESERVE_DATE,
    r.RESERVE_TIME,
    r.RESERVE_COUNT,
    r.RESERVE_STATE,
    rev.REV_IDX,
    rev.REV_SCORE,
    rev.REV_CONTENT,
    rev.REV_WRITEDATE,
    rev.REV_STATE,
    rev.REV_IMG,
    rev.REV_MENU,
    rev.REV_TAG
	*/

public class TimelineDTO {
	private int reserve_idx;
	private int user_idx;
	private int store_idx;
	
	private Date reserve_date;
	private String reserve_time;
	private int reserve_count;
	private int reserve_state;
	private int rev_idx;
	private int rev_score;
	private String rev_content;
	private Date rev_writedate;
	private int rev_state;
	private String rev_img;
	private String rev_menu;
	private String rev_tag;
	
	
	
	private String user_id;
	private String user_name;
	private String user_nickname;
	private String store_name;
	private String store_addr;
	
	
	private int total_reviews;
	private int follower_count;
	private int following_count;
	
	private String profile_image;
	
	

	
	public TimelineDTO() {
		
	}





	public TimelineDTO(int reserve_idx, int user_idx, int store_idx, Date reserve_date, String reserve_time,
			int reserve_count, int reserve_state, int rev_idx, int rev_score, String rev_content, Date rev_writedate,
			int rev_state, String rev_img, String rev_menu, String rev_tag, String user_id, String user_name,
			String user_nickname, String store_name, String store_addr, int total_reviews, int follower_count,
			int following_count, String profile_image) {
		super();
		this.reserve_idx = reserve_idx;
		this.user_idx = user_idx;
		this.store_idx = store_idx;
		this.reserve_date = reserve_date;
		this.reserve_time = reserve_time;
		this.reserve_count = reserve_count;
		this.reserve_state = reserve_state;
		this.rev_idx = rev_idx;
		this.rev_score = rev_score;
		this.rev_content = rev_content;
		this.rev_writedate = rev_writedate;
		this.rev_state = rev_state;
		this.rev_img = rev_img;
		this.rev_menu = rev_menu;
		this.rev_tag = rev_tag;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
		this.store_name = store_name;
		this.store_addr = store_addr;
		this.total_reviews = total_reviews;
		this.follower_count = follower_count;
		this.following_count = following_count;
		this.profile_image = profile_image;
	}





	public String getProfile_image() {
		return profile_image;
	}





	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}





	public int getReserve_idx() {
		return reserve_idx;
	}





	public void setReserve_idx(int reserve_idx) {
		this.reserve_idx = reserve_idx;
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





	public Date getReserve_date() {
		return reserve_date;
	}





	public void setReserve_date(Date reserve_date) {
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





	public int getReserve_state() {
		return reserve_state;
	}





	public void setReserve_state(int reserve_state) {
		this.reserve_state = reserve_state;
	}





	public int getRev_idx() {
		return rev_idx;
	}





	public void setRev_idx(int rev_idx) {
		this.rev_idx = rev_idx;
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





	public String getUser_id() {
		return user_id;
	}





	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}





	public String getUser_name() {
		return user_name;
	}





	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}





	public String getUser_nickname() {
		return user_nickname;
	}





	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
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





	public int getTotal_reviews() {
		return total_reviews;
	}





	public void setTotal_reviews(int total_reviews) {
		this.total_reviews = total_reviews;
	}





	public int getFollower_count() {
		return follower_count;
	}





	public void setFollower_count(int follower_count) {
		this.follower_count = follower_count;
	}





	public int getFollowing_count() {
		return following_count;
	}





	public void setFollowing_count(int following_count) {
		this.following_count = following_count;
	}




	









	
	
	
	
	
	
	
	
	
	
}
