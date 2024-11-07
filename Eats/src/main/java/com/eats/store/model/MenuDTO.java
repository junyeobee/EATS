package com.eats.store.model;

/*메뉴
CREATE TABLE MENU(
	MENU_IDX NUMBER(15) PRIMARY KEY
	, M_CATE_IDX NUMBER(10) NOT NULL
	, MENU_NAME VARCHAR2(50) NOT NULL
	, MENU_PRICE NUMBER(10) NOT NULL
	, MENU_INFO VARCHAR2(1000) NULL
	, FOREIGN KEY(M_CATE_IDX) REFERENCES MENU_CATE(M_CATE_IDX)
);*/

public class MenuDTO {

	private int menuIdx;      
    private int mcateIdx;    
    private String menuName;    
    private int menuPrice;   
    private String menuInfo;
    
    
	public MenuDTO() {
		
	}
	
	
	public MenuDTO(int menuIdx, int mcateIdx, String menuName, int menuPrice, String menuInfo) {
		super();
		this.menuIdx = menuIdx;
		this.mcateIdx = mcateIdx;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuInfo = menuInfo;
	}
	
	
	public int getMenuIdx() {
		return menuIdx;
	}
	public void setMenuIdx(int menuIdx) {
		this.menuIdx = menuIdx;
	}
	public int getMcateIdx() {
		return mcateIdx;
	}
	public void setMcateIdx(int mcateIdx) {
		this.mcateIdx = mcateIdx;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getMenuInfo() {
		return menuInfo;
	}
	public void setMenuInfo(String menuInfo) {
		this.menuInfo = menuInfo;
	}   
    
    
    
	
}
