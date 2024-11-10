package com.eats.store.model;

public class HYStoreNewsDTO {

	private int s_news_idx;
	private int store_idx;
	private String s_news_title;
	private String s_news_img;
	private String s_news_content;
	
	public HYStoreNewsDTO() {
		
	}

	public HYStoreNewsDTO(int s_news_idx, int store_idx, String s_news_title, String s_news_img,
			String s_news_content) {
		super();
		this.s_news_idx = s_news_idx;
		this.store_idx = store_idx;
		this.s_news_title = s_news_title;
		this.s_news_img = s_news_img;
		this.s_news_content = s_news_content;
	}

	public int getS_news_idx() {
		return s_news_idx;
	}

	public void setS_news_idx(int s_news_idx) {
		this.s_news_idx = s_news_idx;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public String getS_news_title() {
		return s_news_title;
	}

	public void setS_news_title(String s_news_title) {
		this.s_news_title = s_news_title;
	}

	public String getS_news_img() {
		return s_news_img;
	}

	public void setS_news_img(String s_news_img) {
		this.s_news_img = s_news_img;
	}

	public String getS_news_content() {
		return s_news_content;
	}

	public void setS_news_content(String s_news_content) {
		this.s_news_content = s_news_content;
	}
}
