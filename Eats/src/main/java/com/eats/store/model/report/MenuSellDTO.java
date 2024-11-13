package com.eats.store.model.report;

public class MenuSellDTO {
	private String menuname;
	private int totalcnt;
	
	public MenuSellDTO() {
		// TODO Auto-generated constructor stub
	}

	public MenuSellDTO(String menuname, int totalcnt) {
		super();
		this.menuname = menuname;
		this.totalcnt = totalcnt;
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public int getTotalcnt() {
		return totalcnt;
	}

	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}
	
}
