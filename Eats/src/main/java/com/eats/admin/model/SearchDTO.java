package com.eats.admin.model;

public class SearchDTO {
	private int search_idx;
	private String search_word;
	private int search_date;
	private int search_count;

	public SearchDTO() {
		// TODO Auto-generated constructor stub
	}

	public SearchDTO(int search_idx, String search_word, int search_date, int search_count) {
		super();
		this.search_idx = search_idx;
		this.search_word = search_word;
		this.search_date = search_date;
		this.search_count = search_count;
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

	public int getSearch_date() {
		return search_date;
	}

	public void setSearch_date(int search_date) {
		this.search_date = search_date;
	}

	public int getSearch_count() {
		return search_count;
	}

	public void setSearch_count(int search_count) {
		this.search_count = search_count;
	}
	
}
