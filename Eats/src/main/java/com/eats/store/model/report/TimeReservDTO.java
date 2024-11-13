package com.eats.store.model.report;

public class TimeReservDTO {
	private String res_time;
	private int reservecnt;
	private int totalcnt;
	
	public TimeReservDTO() {
		// TODO Auto-generated constructor stub
	}

	public TimeReservDTO(String res_time, int reservecnt, int totalcnt) {
		super();
		this.res_time = res_time;
		this.reservecnt = reservecnt;
		this.totalcnt = totalcnt;
	}

	public String getRes_time() {
		return res_time;
	}

	public void setRes_time(String res_time) {
		this.res_time = res_time;
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
