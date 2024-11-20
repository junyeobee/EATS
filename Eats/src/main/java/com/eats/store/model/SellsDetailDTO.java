package com.eats.store.model;

public class SellsDetailDTO {
    private int menuIdx;
    private int orderNum;
    
    public SellsDetailDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getMenuIdx() {
		return menuIdx;
	}

	public void setMenuIdx(int menuIdx) {
		this.menuIdx = menuIdx;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public SellsDetailDTO(int menuIdx, int orderNum) {
		this.menuIdx = menuIdx;
		this.orderNum = orderNum;
	}
    
    
}
