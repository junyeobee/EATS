package com.eats.store.model;

public class StoreGridBaseDTO {
	
	private int sg_idx;
	private int store_idx;
	private int store_floor, sg_col, sg_row;
	
	public StoreGridBaseDTO() {
		// TODO Auto-generated constructor stub
	}

	public StoreGridBaseDTO(int sg_idx, int store_idx, int store_floor, int sg_col, int sg_row) {
		super();
		this.sg_idx = sg_idx;
		this.store_idx = store_idx;
		this.store_floor = store_floor;
		this.sg_col = sg_col;
		this.sg_row = sg_row;
	}

	public int getSg_idx() {
		return sg_idx;
	}

	public void setSg_idx(int sg_idx) {
		this.sg_idx = sg_idx;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public int getStore_floor() {
		return store_floor;
	}

	public void setStore_floor(int store_floor) {
		this.store_floor = store_floor;
	}

	public int getSg_col() {
		return sg_col;
	}

	public void setSg_col(int sg_col) {
		this.sg_col = sg_col;
	}

	public int getSg_row() {
		return sg_row;
	}

	public void setSg_row(int sg_row) {
		this.sg_row = sg_row;
	}
	
	
}
