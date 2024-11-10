package com.eats.store.model;


/*CREATE TABLE MENU_TEST(
	MENU_IDX NUMBER(15) PRIMARY KEY
	, M_CATE_IDX NUMBER(10) NOT NULL
	, MENU_NAME VARCHAR2(50) NOT NULL
	, MENU_PRICE NUMBER(10) NOT NULL
	, MENU_INFO VARCHAR2(1000) NULL
	, STORE_IMG VARCHAR2(100) NOT NULL
);
	*/

/*메뉴카테고리
CREATE TABLE MENU_CATE_TEST(
	M_CATE_IDX NUMBER(10) PRIMARY KEY
	, STORE_IDX NUMBER(10) NOT NULL
	, M_CATE_NAME VARCHAR2(50) NOT NULL
);
*/

public class MenuDTO {

	private int menu_idx;
	private String menu_name;
	private int menu_price;
	private String menu_info;
	private String menu_img;
	private int menu_preorder;
	private int m_cate_idx;
	private int store_idx;
	private String m_cate_name;

	public MenuDTO() {

	}

	public MenuDTO(int menu_idx, String menu_name, int menu_price, String menu_info, String menu_img, int menu_preorder,
			int m_cate_idx, int store_idx, String m_cate_name) {
		super();
		this.menu_idx = menu_idx;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_info = menu_info;
		this.menu_img = menu_img;
		this.menu_preorder = menu_preorder;
		this.m_cate_idx = m_cate_idx;
		this.store_idx = store_idx;
		this.m_cate_name = m_cate_name;
	}

	public int getMenu_idx() {
		return menu_idx;
	}

	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
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

	

	

}
