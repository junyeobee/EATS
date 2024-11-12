package com.eats.store.model;

public class HYMenuCateDTO {

	private int m_cate_idx;
	private int store_idx;
	private String m_cate_name;
	private String m_cate_info;
	
	public HYMenuCateDTO() {
		
	}

	public HYMenuCateDTO(int m_cate_idx, int store_idx, String m_cate_name, String m_cate_info) {
		super();
		this.m_cate_idx = m_cate_idx;
		this.store_idx = store_idx;
		this.m_cate_name = m_cate_name;
		this.m_cate_info = m_cate_info;
	}

	public int getM_cate_idx() {
		return m_cate_idx;
	}

	public void setM_cate_idx(int m_cate_idx) {
		this.m_cate_idx = m_cate_idx;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public String getM_cate_name() {
		return m_cate_name;
	}

	public void setM_cate_name(String m_cate_name) {
		this.m_cate_name = m_cate_name;
	}

	public String getM_cate_info() {
		return m_cate_info;
	}

	public void setM_cate_info(String m_cate_info) {
		this.m_cate_info = m_cate_info;
	}
}
