package com.eats.store.model;

import java.util.*;


public class GudokDTO {
	private int gudok_Idx;
	private int store_Idx;
	private Date gudok_start;
	private Date gudok_nextpay;
	private Date gudok_end;
	private int gudok_type;
	private String gudok_method;
	private String gudok_info;
	private int gudok_stat;
	private String gudok_tid;
	
	public GudokDTO() {
		// TODO Auto-generated constructor stub
	}

	public GudokDTO(int gudok_Idx, int store_Idx, Date gudok_start, Date gudok_nextpay, Date gudok_end, int gudok_type,
			String gudok_method, String gudok_info, int gudok_stat, String gudok_tid) {
		super();
		this.gudok_Idx = gudok_Idx;
		this.store_Idx = store_Idx;
		this.gudok_start = gudok_start;
		this.gudok_nextpay = gudok_nextpay;
		this.gudok_end = gudok_end;
		this.gudok_type = gudok_type;
		this.gudok_method = gudok_method;
		this.gudok_info = gudok_info;
		this.gudok_stat = gudok_stat;
		this.gudok_tid = gudok_tid;
	}

	public int getGudok_Idx() {
		return gudok_Idx;
	}

	public void setGudok_Idx(int gudok_Idx) {
		this.gudok_Idx = gudok_Idx;
	}

	public int getStore_Idx() {
		return store_Idx;
	}

	public void setStore_Idx(int store_Idx) {
		this.store_Idx = store_Idx;
	}

	public Date getGudok_start() {
		return gudok_start;
	}

	public void setGudok_start(Date gudok_start) {
		this.gudok_start = gudok_start;
	}

	public Date getGudok_nextpay() {
		return gudok_nextpay;
	}

	public void setGudok_nextpay(Date gudok_nextpay) {
		this.gudok_nextpay = gudok_nextpay;
	}

	public Date getGudok_end() {
		return gudok_end;
	}

	public void setGudok_end(Date gudok_end) {
		this.gudok_end = gudok_end;
	}

	public int getGudok_type() {
		return gudok_type;
	}

	public void setGudok_type(int gudok_type) {
		this.gudok_type = gudok_type;
	}

	public String getGudok_method() {
		return gudok_method;
	}

	public void setGudok_method(String gudok_method) {
		this.gudok_method = gudok_method;
	}

	public String getGudok_info() {
		return gudok_info;
	}

	public void setGudok_info(String gudok_info) {
		this.gudok_info = gudok_info;
	}

	public int getGudok_stat() {
		return gudok_stat;
	}

	public void setGudok_stat(int gudok_stat) {
		this.gudok_stat = gudok_stat;
	}

	public String getGudok_tid() {
		return gudok_tid;
	}

	public void setGudok_tid(String gudok_tid) {
		this.gudok_tid = gudok_tid;
	}
	
	
}
