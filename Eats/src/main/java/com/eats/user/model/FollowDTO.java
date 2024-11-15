package com.eats.user.model;

public class FollowDTO {

	
	private int follow_idx;
	private int user_idx;
	private int following_idx;
	
	
	public FollowDTO() {
	
		
	}
	
	
	public FollowDTO(int follow_idx, int user_idx, int following_idx) {
	
		this.follow_idx = follow_idx;
		this.user_idx = user_idx;
		this.following_idx = following_idx;
	}
	
	
	
	public int getFollow_idx() {
		return follow_idx;
	}
	public void setFollow_idx(int follow_idx) {
		this.follow_idx = follow_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getFollowing_idx() {
		return following_idx;
	}
	public void setFollowing_idx(int following_idx) {
		this.following_idx = following_idx;
	}
	
}
