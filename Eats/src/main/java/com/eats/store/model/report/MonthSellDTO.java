package com.eats.store.model.report;

public class MonthSellDTO {
	private String monthName;
	private int totalcnt;
	
	public MonthSellDTO() {
		// TODO Auto-generated constructor stub
	}

	public MonthSellDTO(String monthName, int totalcnt) {
		super();
		this.monthName = monthName;
		this.totalcnt = totalcnt;
	}

	public String getMonthName() {
		return monthName;
	}

	public void setMonthName(String monthName) {
		this.monthName = monthName;
	}

	public int getTotalcnt() {
		return totalcnt;
	}

	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}
	
	
	
	
}
