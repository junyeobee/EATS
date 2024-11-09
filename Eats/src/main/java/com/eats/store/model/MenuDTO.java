package com.eats.store.model;

/*CREATE TABLE CATE_KEY_test(
		CATE_KEY_IDX NUMBER(10) PRIMARY KEY
		, CATE_KEY_NAME VARCHAR2(30) NOT NULL
		, CATE_KEY_LEVEL NUMBER(1) NOT NULL
	);
	
CREATE TABLE MENU_TEST(
	MENU_IDX NUMBER(15) PRIMARY KEY
	, M_CATE_IDX NUMBER(10) NOT NULL
	, MENU_NAME VARCHAR2(50) NOT NULL
	, MENU_PRICE NUMBER(10) NOT NULL
	, MENU_INFO VARCHAR2(1000) NULL
	, STORE_IMG VARCHAR2(100) NOT NULL
);
	*/




public class MenuDTO {

	private int cate_key_idx;
	private String cate_key_name;
	private int cate_key_level;
	private int menu_idx;
	private int m_cate_idx;
	private String menu_name;
	private int menu_price;
	private String menu_info;
	private String menu_img;
	private int menu_preorder;
	
	
	public MenuDTO() {
		
	}


	

	








	public MenuDTO(int cate_key_idx, String cate_key_name, int cate_key_level, int menu_idx, int m_cate_idx,
			String menu_name, int menu_price, String menu_info, String menu_img, int menu_preorder) {
		super();
		this.cate_key_idx = cate_key_idx;
		this.cate_key_name = cate_key_name;
		this.cate_key_level = cate_key_level;
		this.menu_idx = menu_idx;
		this.m_cate_idx = m_cate_idx;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_info = menu_info;
		this.menu_img = menu_img;
		this.menu_preorder = menu_preorder;
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













	public int getMenu_preorder() {
		return menu_preorder;
	}













	public void setMenu_preorder(int menu_preorder) {
		this.menu_preorder = menu_preorder;
	}

	
	






}
