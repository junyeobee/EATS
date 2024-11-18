package com.eats.store.model.main;

public class MonthCntDTO {
	private int month;
	private int reservecnt;
	private int totalcnt;
	
	public MonthCntDTO() {
		// TODO Auto-generated constructor stub
	}

	public MonthCntDTO(int month, int reservecnt, int totalcnt) {
		super();
		this.month = month;
		this.reservecnt = reservecnt;
		this.totalcnt = totalcnt;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getReservecnt() {
		return reservecnt;
	}

	public void setReservecnt(int reservecnt) {
		this.reservecnt = reservecnt;
	}

	public int getTotalcnt() {
		return totalcnt;
	}

	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}
}
