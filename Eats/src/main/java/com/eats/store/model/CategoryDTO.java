package com.eats.store.model;

public class CategoryDTO {

	private int cate_idx;
	private int store_idx;
	private int cate_key_idx;
	private int cate_value_idx;
	
	private String cate_key_name;
	private String cate_value_name;
	
	public CategoryDTO() {
		
	}

	public CategoryDTO(int cate_idx, int store_idx, int cate_key_idx, int cate_value_idx) {
		super();
		this.cate_idx = cate_idx;
		this.store_idx = store_idx;
		this.cate_key_idx = cate_key_idx;
		this.cate_value_idx = cate_value_idx;
	}

	public CategoryDTO(int cate_idx, int store_idx, int cate_key_idx, int cate_value_idx, String cate_key_name,
			String cate_value_name) {
		super();
		this.cate_idx = cate_idx;
		this.store_idx = store_idx;
		this.cate_key_idx = cate_key_idx;
		this.cate_value_idx = cate_value_idx;
		this.cate_key_name = cate_key_name;
		this.cate_value_name = cate_value_name;
	}

	public int getCate_idx() {
		return cate_idx;
	}

	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public int getCate_key_idx() {
		return cate_key_idx;
	}

	public void setCate_key_idx(int cate_key_idx) {
		this.cate_key_idx = cate_key_idx;
	}

	public int getCate_value_idx() {
		return cate_value_idx;
	}

	public void setCate_value_idx(int cate_value_idx) {
		this.cate_value_idx = cate_value_idx;
	}

	public String getCate_key_name() {
		return cate_key_name;
	}

	public void setCate_key_name(String cate_key_name) {
		this.cate_key_name = cate_key_name;
	}

	public String getCate_value_name() {
		return cate_value_name;
	}

	public void setCate_value_name(String cate_value_name) {
		this.cate_value_name = cate_value_name;
	}
}
