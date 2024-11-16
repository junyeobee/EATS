package com.eats.store.model.main;

public class TodayReviewDTO {
	private int revscore;
	private String revcontent;
	
	public TodayReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public TodayReviewDTO(int revscore, String revcontent) {
		super();
		this.revscore = revscore;
		this.revcontent = revcontent;
	}

	public int getRevscore() {
		return revscore;
	}

	public void setRevscore(int revscore) {
		this.revscore = revscore;
	}

	public String getRevcontent() {
		return revcontent;
	}

	public void setRevcontent(String revcontent) {
		this.revcontent = revcontent;
	}
	
	
}
