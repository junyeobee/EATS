package com.eats.user.model;

public class AreaDTO {

	private int area_idx;
	private String area_name;
	private int parent_idx;
	private int area_lev;
	
	public AreaDTO() {
		// TODO Auto-generated constructor stub
	}

	public AreaDTO(int area_idx, String area_name, int parent_idx, int area_lev) {
		super();
		this.area_idx = area_idx;
		this.area_name = area_name;
		this.parent_idx = parent_idx;
		this.area_lev = area_lev;
	}

	public int getArea_idx() {
		return area_idx;
	}

	public void setArea_idx(int area_idx) {
		this.area_idx = area_idx;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public int getParent_idx() {
		return parent_idx;
	}

	public void setParent_idx(int parent_idx) {
		this.parent_idx = parent_idx;
	}

	public int getArea_lev() {
		return area_lev;
	}

	public void setArea_lev(int area_lev) {
		this.area_lev = area_lev;
	}
	
}
