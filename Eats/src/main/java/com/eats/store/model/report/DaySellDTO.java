package com.eats.store.model.report;

public class DaySellDTO {
	private String dayname;
	private int daytotalcnt;
	
	public DaySellDTO() {
		// TODO Auto-generated constructor stub
	}

	public DaySellDTO(String dayname, int daytotalcnt) {
		super();
		this.dayname = dayname;
		this.daytotalcnt = daytotalcnt;
	}

	public String getDayname() {
		return dayname;
	}

	public void setDayname(String dayname) {
		this.dayname = dayname;
	}

	public int getDaytotalcnt() {
		return daytotalcnt;
	}

	public void setDaytotalcnt(int daytotalcnt) {
		this.daytotalcnt = daytotalcnt;
	}
	
	
}
