package com.eats.admin.model;

public class SearchDTO {
	private int search_idx;
	private String search_word;
	private int search_cnt;

	public SearchDTO() {
		// TODO Auto-generated constructor stub
	}

	public SearchDTO(int search_idx, String search_word, int search_cnt) {
		super();
		this.search_idx = search_idx;
		this.search_word = search_word;
		this.search_cnt = search_cnt;
	}

	public int getSearch_idx() {
		return search_idx;
	}

	public void setSearch_idx(int search_idx) {
		this.search_idx = search_idx;
	}

	public String getSearch_word() {
		return search_word;
	}

	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}

	public int getSearch_cnt() {
		return search_cnt;
	}

	public void setSearch_cnt(int search_cnt) {
		this.search_cnt = search_cnt;
	}
	
}
