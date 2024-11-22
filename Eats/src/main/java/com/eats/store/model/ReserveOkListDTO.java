package com.eats.store.model;

import java.sql.Date;

public class ReserveOkListDTO {

	private String user_name;
	private int reserve_idx;
	private int user_idx;
	private int store_idx;
	private Date reserve_date;
	private String reserve_time;
	private int reserve_count;
	private int reserve_table_idx;
	private String request;
	private int reserve_state;
	private Date reserve_applydate;
	private int table_num;
	private int sts_type_idx;
	private String cate_value_name;
	private String user_tel;
	
	public ReserveOkListDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ReserveOkListDTO(String user_name, int reserve_idx, int user_idx, int store_idx, Date reserve_date,
			String reserve_time, int reserve_count, int reserve_table_idx, String request, int reserve_state,
			Date reserve_applydate, int table_num, int sts_type_idx, String cate_value_name, String user_tel) {
		super();
		this.user_name = user_name;
		this.reserve_idx = reserve_idx;
		this.user_idx = user_idx;
		this.store_idx = store_idx;
		this.reserve_date = reserve_date;
		this.reserve_time = reserve_time;
		this.reserve_count = reserve_count;
		this.reserve_table_idx = reserve_table_idx;
		this.request = request;
		this.reserve_state = reserve_state;
		this.reserve_applydate = reserve_applydate;
		this.table_num = table_num;
		this.sts_type_idx = sts_type_idx;
		this.cate_value_name = cate_value_name;
		this.user_tel = user_tel;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getReserve_idx() {
		return reserve_idx;
	}

	public void setReserve_idx(int reserve_idx) {
		this.reserve_idx = reserve_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public Date getReserve_date() {
		return reserve_date;
	}

	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}

	public String getReserve_time() {
		return reserve_time;
	}

	public void setReserve_time(String reserve_time) {
		this.reserve_time = reserve_time;
	}

	public int getReserve_count() {
		return reserve_count;
	}

	public void setReserve_count(int reserve_count) {
		this.reserve_count = reserve_count;
	}

	public int getReserve_table_idx() {
		return reserve_table_idx;
	}

	public void setReserve_table_idx(int reserve_table_idx) {
		this.reserve_table_idx = reserve_table_idx;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public int getReserve_state() {
		return reserve_state;
	}

	public void setReserve_state(int reserve_state) {
		this.reserve_state = reserve_state;
	}

	public Date getReserve_applydate() {
		return reserve_applydate;
	}

	public void setReserve_applydate(Date reserve_applydate) {
		this.reserve_applydate = reserve_applydate;
	}

	public int getTable_num() {
		return table_num;
	}

	public void setTable_num(int table_num) {
		this.table_num = table_num;
	}

	public int getSts_type_idx() {
		return sts_type_idx;
	}

	public void setSts_type_idx(int sts_type_idx) {
		this.sts_type_idx = sts_type_idx;
	}

	public String getCate_value_name() {
		return cate_value_name;
	}

	public void setCate_value_name(String cate_value_name) {
		this.cate_value_name = cate_value_name;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	
}
