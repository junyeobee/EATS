package com.eats.store.model;

public class StoreTimeDTO {

	private int stime_idx;
	private int store_idx;
	private String stime_day;
	private String stime_start;
	private String stime_end;
	private String stime_break;
	
	public StoreTimeDTO() {
		
	}

	public StoreTimeDTO(int stime_idx, int store_idx, String stime_day, String stime_start, String stime_end,
			String stime_break) {
		super();
		this.stime_idx = stime_idx;
		this.store_idx = store_idx;
		this.stime_day = stime_day;
		this.stime_start = stime_start;
		this.stime_end = stime_end;
		this.stime_break = stime_break;
	}

	public int getStime_idx() {
		return stime_idx;
	}

	public void setStime_idx(int stime_idx) {
		this.stime_idx = stime_idx;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public String getStime_day() {
		return stime_day;
	}

	public void setStime_day(String stime_day) {
		this.stime_day = stime_day;
	}

	public String getStime_start() {
		return stime_start;
	}

	public void setStime_start(String stime_start) {
		this.stime_start = stime_start;
	}

	public String getStime_end() {
		return stime_end;
	}

	public void setStime_end(String stime_end) {
		this.stime_end = stime_end;
	}

	public String getStime_break() {
		return stime_break;
	}

	public void setStime_break(String stime_break) {
		this.stime_break = stime_break;
	}
}
