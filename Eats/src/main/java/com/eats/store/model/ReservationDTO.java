package com.eats.store.model;

import java.sql.*;

public class ReservationDTO {
	public int reserve_idx;
	public int user_idx;
	public int store_idx;
	public Date reserve_date;
	public String reserve_time;
	public int reserve_count;
	public int reserve_table_idx;
	public String requeset;
	public int reserve_state;
	public Date reserve_applydate;
	
	public ReservationDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReservationDTO(int reserve_idx, int user_idx, int store_idx, Date reserve_date, String reserve_time,
			int reserve_count, int reserve_table_idx, String requeset, int reserve_state, Date reserve_applydate) {
		super();
		this.reserve_idx = reserve_idx;
		this.user_idx = user_idx;
		this.store_idx = store_idx;
		this.reserve_date = reserve_date;
		this.reserve_time = reserve_time;
		this.reserve_count = reserve_count;
		this.reserve_table_idx = reserve_table_idx;
		this.requeset = requeset;
		this.reserve_state = reserve_state;
		this.reserve_applydate = reserve_applydate;
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

	public String getRequeset() {
		return requeset;
	}

	public void setRequeset(String requeset) {
		this.requeset = requeset;
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
	
}
