package com.eats.store.model.main;

public class SellTop3MenuDTO {
	private String menuname;
	private int totalcount;
	
	public SellTop3MenuDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public SellTop3MenuDTO(String menuname, int totalcount) {
		super();
		this.menuname = menuname;
		this.totalcount = totalcount;
	}
	
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
}
