package com.eats.store.model.main;

public class SellMethodDTO {
	private String menuname;
	private int totalcount;
	
	public SellMethodDTO() {
		// TODO Auto-generated constructor stub
	}

	public SellMethodDTO(String menuname, int totalcount) {
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
