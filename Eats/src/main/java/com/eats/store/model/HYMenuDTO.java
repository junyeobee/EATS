package com.eats.store.model;

public class HYMenuDTO {

	private int menu_idx;
	private int m_cate_idx;
	private String menu_name;
	private int menu_price;
	private String menu_info;
	private String menu_img;
	
	public HYMenuDTO() {
		
	}

	public HYMenuDTO(int menu_idx, int m_cate_idx, String menu_name, int menu_price, String menu_info,
			String menu_img) {
		super();
		this.menu_idx = menu_idx;
		this.m_cate_idx = m_cate_idx;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_info = menu_info;
		this.menu_img = menu_img;
	}

	public int getMenu_idx() {
		return menu_idx;
	}

	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
	}

	public int getM_cate_idx() {
		return m_cate_idx;
	}

	public void setM_cate_idx(int m_cate_idx) {
		this.m_cate_idx = m_cate_idx;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_info() {
		return menu_info;
	}

	public void setMenu_info(String menu_info) {
		this.menu_info = menu_info;
	}

	public String getMenu_img() {
		return menu_img;
	}

	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}
}
