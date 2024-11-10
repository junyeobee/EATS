package com.eats.store.model;

public class StoreReportDTO {
	private String rev_content;
	private int rev_score;
	private String rev_menu;
	
	public StoreReportDTO() {
		// TODO Auto-generated constructor stub
	}

	public StoreReportDTO(String rev_content, int rev_score, String rev_menu) {
		super();
		this.rev_score = rev_score;
		this.rev_content = rev_content;
		this.rev_menu = rev_menu;
	}

	public String getRev_content() {
		return rev_content;
	}

	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}

	public int getRev_score() {
		return rev_score;
	}

	public void setRev_score(int rev_score) {
		this.rev_score = rev_score;
	}

	public String getRev_menu() {
		return rev_menu;
	}

	public void setRev_menu(String rev_menu) {
		this.rev_menu = rev_menu;
	}
	
}
