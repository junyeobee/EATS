package com.eats.store.model;

import java.util.List;

public class StoreGridAllDTO {
	
	private int sg_idx;
	private int store_idx;
	private int store_floor, sg_row, sg_col;
    
    private String sts_idx;
	private String sts_location, sts_name;
	private int sts_type_idx, sts_num;
	
    private List<StoreGridDetailDTO> gridData;
    
    public StoreGridAllDTO() {
		// TODO Auto-generated constructor stub
	}


    public StoreGridAllDTO(int sg_idx, int store_idx, int store_floor, int sg_col, int sg_row, String sts_idx,
			String sts_location, String sts_name, int sts_type_idx, int sts_num) {
		super();
		this.sg_idx = sg_idx;
		this.store_idx = store_idx;
		this.store_floor = store_floor;
		this.sg_col = sg_col;
		this.sg_row = sg_row;
		this.sts_idx = sts_idx;
		this.sts_location = sts_location;
		this.sts_name = sts_name;
		this.sts_type_idx = sts_type_idx;
		this.sts_num = sts_num;
	}
    

    public StoreGridAllDTO(int sg_idx, int store_idx, int store_floor, int sg_col, int sg_row, String sts_idx,
			String sts_location, String sts_name, int sts_type_idx, int sts_num, List<StoreGridDetailDTO> gridData) {
		super();
		this.sg_idx = sg_idx;
		this.store_idx = store_idx;
		this.store_floor = store_floor;
		this.sg_col = sg_col;
		this.sg_row = sg_row;
		this.sts_idx = sts_idx;
		this.sts_location = sts_location;
		this.sts_name = sts_name;
		this.sts_type_idx = sts_type_idx;
		this.sts_num = sts_num;
		this.gridData = gridData;
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



	public String getSts_idx() {
		return sts_idx;
	}



	public void setSts_idx(String sts_idx) {
		this.sts_idx = sts_idx;
	}



	public String getSts_location() {
		return sts_location;
	}



	public void setSts_location(String sts_location) {
		this.sts_location = sts_location;
	}



	public String getSts_name() {
		return sts_name;
	}



	public void setSts_name(String sts_name) {
		this.sts_name = sts_name;
	}



	public int getSts_type_idx() {
		return sts_type_idx;
	}



	public void setSts_type_idx(int sts_type_idx) {
		this.sts_type_idx = sts_type_idx;
	}



	public int getSts_num() {
		return sts_num;
	}



	public void setSts_num(int sts_num) {
		this.sts_num = sts_num;
	}



	public List<StoreGridDetailDTO> getGridData() {
        return gridData;
    }

    public void setGridData(List<StoreGridDetailDTO> gridData) {
        this.gridData = gridData;
    }
}
