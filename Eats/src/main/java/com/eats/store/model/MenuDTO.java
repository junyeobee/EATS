package com.eats.store.model;



/*
메뉴카테고리
CREATE TABLE MENU_CATE_TEST(
	M_CATE_IDX NUMBER(10) PRIMARY KEY
	, STORE_IDX NUMBER(10) NOT NULL
	, M_CATE_NAME VARCHAR2(50) NOT NULL
);

메뉴
CREATE TABLE MENU_TEST (
    MENU_IDX NUMBER(15) PRIMARY KEY,
    M_CATE_IDX NUMBER(10) NOT NULL,
    MENU_NAME VARCHAR2(50) NOT NULL,
    MENU_PRICE NUMBER(10) NOT NULL,
    MENU_INFO VARCHAR2(1000) NULL,
    MENU_PREORDER NUMBER(2) NOT NULL,
    MENU_IMAGE_IDX NUMBER(15), -- 이미지 테이블과의 관계를 나타내는 외래 키
    FOREIGN KEY (MENU_IMAGE_IDX) REFERENCES MENU_IMAGE(MENU_IMAGE_IDX) -- 외래 키 제약 조건
);

*/

public class MenuDTO {

	
	//메뉴
    private int menu_idx; // 기본 키
    private String menu_name; // 메뉴 이름
    private int menu_price; // 가격
    private String menu_info; // 상세 설명
    private Integer menu_img_idx; // 이미지 인덱스 (Integer로 변경)
    private int menu_preorder; // 선주문 여부
    private int m_cate_idx; // 카테고리 인덱스
    private int store_idx; // 상점 인덱스
    private String m_cate_name; // 카테고리 이름

	
	public MenuDTO() {

	}


	public MenuDTO(int menu_idx, String menu_name, int menu_price, String menu_info, Integer menu_img_idx,
			int menu_preorder, int m_cate_idx, int store_idx, String m_cate_name) {
		super();
		this.menu_idx = menu_idx;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_info = menu_info;
		this.menu_img_idx = menu_img_idx;
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


	public Integer getMenu_img_idx() {
		return menu_img_idx;
	}


	public void setMenu_img_idx(Integer menu_img_idx) {
		this.menu_img_idx = menu_img_idx;
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
