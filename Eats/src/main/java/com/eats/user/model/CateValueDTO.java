package com.eats.user.model;

public class CateValueDTO {
	private int cate_value_idx;
	private int cate_key_idx;
	private String cate_value_name;
	
	public CateValueDTO() {
		// TODO Auto-generated constructor stub
	}

	public CateValueDTO(int cate_value_idx, int cate_key_idx, String cate_value_name) {
		super();
		this.cate_value_idx = cate_value_idx;
		this.cate_key_idx = cate_key_idx;
		this.cate_value_name = cate_value_name;
	}

	public int getCate_value_idx() {
		return cate_value_idx;
	}

	public void setCate_value_idx(int cate_value_idx) {
		this.cate_value_idx = cate_value_idx;
	}

	public int getCate_key_idx() {
		return cate_key_idx;
	}

	public void setCate_key_idx(int cate_key_idx) {
		this.cate_key_idx = cate_key_idx;
	}

	public String getCate_value_name() {
		return cate_value_name;
	}

	public void setCate_value_name(String cate_value_name) {
		this.cate_value_name = cate_value_name;
	}
	
	
}
