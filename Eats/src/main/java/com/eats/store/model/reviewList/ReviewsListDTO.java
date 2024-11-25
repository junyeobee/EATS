package com.eats.store.model.reviewList;

public class ReviewsListDTO {
	private int rev_idx;
	private String rev_writedate;
	private String user_nickname;
	private int rev_score;
	private String rev_content;
	
	public ReviewsListDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewsListDTO(int rev_idx, String rev_writedate, String user_nickname, int rev_score, String rev_content) {
		super();
		this.rev_idx = rev_idx;
		this.rev_writedate = rev_writedate;
		this.user_nickname = user_nickname;
		this.rev_score = rev_score;
		this.rev_content = rev_content;
	}

	public int getRev_idx() {
		return rev_idx;
	}

	public void setRev_idx(int rev_idx) {
		this.rev_idx = rev_idx;
	}

	public String getRev_writedate() {
		return rev_writedate;
	}

	public void setRev_writedate(String rev_writedate) {
		this.rev_writedate = rev_writedate;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
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
	
	
}
