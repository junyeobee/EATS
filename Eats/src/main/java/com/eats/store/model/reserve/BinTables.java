package com.eats.store.model.reserve;

public class BinTables {
	private int sts_idx;
	private int sts_num;
	private int table_num;
	private String date;
	private String time; 
	
	public BinTables() {
		// TODO Auto-generated constructor stub
	}

	public BinTables(int sts_idx, int sts_num, int table_num, String date, String time) {
		this.sts_idx = sts_idx;
		this.sts_num = sts_num;
		this.table_num = table_num;
		this.date = date;
		this.time = time;
	}

	public int getSts_idx() {
		return sts_idx;
	}

	public void setSts_idx(int sts_idx) {
		this.sts_idx = sts_idx;
	}

	public int getSts_num() {
		return sts_num;
	}

	public void setSts_num(int sts_num) {
		this.sts_num = sts_num;
	}

	public int getTable_num() {
		return table_num;
	}

	public void setTable_num(int table_num) {
		this.table_num = table_num;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
}
