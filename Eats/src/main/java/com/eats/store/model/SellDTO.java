package com.eats.store.model;

import java.sql.*;

public class SellDTO {
	public int sell_idx;
	public int store_idx;
	public Date sell_date;
	public int sell_stat;
	public int total_cnt;
	public String sell_method;
	
	public SellDTO() {
		// TODO Auto-generated constructor stub
	}

	public SellDTO(int sell_idx, int store_idx, Date sell_date, int sell_stat, int total_cnt, String sell_method) {
		super();
		this.sell_idx = sell_idx;
		this.store_idx = store_idx;
		this.sell_date = sell_date;
		this.sell_stat = sell_stat;
		this.total_cnt = total_cnt;
		this.sell_method = sell_method;
	}

	public int getSell_idx() {
		return sell_idx;
	}

	public void setSell_idx(int sell_idx) {
		this.sell_idx = sell_idx;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public Date getSell_date() {
		return sell_date;
	}

	public void setSell_date(Date sell_date) {
		this.sell_date = sell_date;
	}

	public int getSell_stat() {
		return sell_stat;
	}

	public void setSell_stat(int sell_stat) {
		this.sell_stat = sell_stat;
	}

	public int getTotal_cnt() {
		return total_cnt;
	}

	public void setTotal_cnt(int total_cnt) {
		this.total_cnt = total_cnt;
	}

	public String getSell_method() {
		return sell_method;
	}

	public void setSell_method(String sell_method) {
		this.sell_method = sell_method;
	}
	
}
