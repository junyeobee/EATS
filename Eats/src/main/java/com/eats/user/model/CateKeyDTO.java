package com.eats.user.model;

public class CateKeyDTO {

	private int cate_key_idx;
	private String cate_key_name;
	private int cate_key_level;
	
	public CateKeyDTO() {
		// TODO Auto-generated constructor stub
	}

	public CateKeyDTO(int cate_key_idx, String cate_key_name, int cate_key_level) {
		super();
		this.cate_key_idx = cate_key_idx;
		this.cate_key_name = cate_key_name;
		this.cate_key_level = cate_key_level;
	}

	public int getCate_key_idx() {
		return cate_key_idx;
	}

	public void setCate_key_idx(int cate_key_idx) {
		this.cate_key_idx = cate_key_idx;
	}

	public String getCate_key_name() {
		return cate_key_name;
	}

	public void setCate_key_name(String cate_key_name) {
		this.cate_key_name = cate_key_name;
	}

	public int getCate_key_level() {
		return cate_key_level;
	}

	public void setCate_key_level(int cate_key_level) {
		this.cate_key_level = cate_key_level;
	}
	
	
}
