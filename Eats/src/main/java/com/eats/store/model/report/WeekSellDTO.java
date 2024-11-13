package com.eats.store.model.report;

public class WeekSellDTO {
	private int weeknum;
	private int totalcnt;
	
	public WeekSellDTO() {
		// TODO Auto-generated constructor stub
	}

	public WeekSellDTO(int weeknum, int totalcnt) {
		super();
		this.weeknum = weeknum;
		this.totalcnt = totalcnt;
	}

	public int getWeeknum() {
		return weeknum;
	}

	public void setWeeknum(int weeknum) {
		this.weeknum = weeknum;
	}

	public int getTotalcnt() {
		return totalcnt;
	}

	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}
	
}
