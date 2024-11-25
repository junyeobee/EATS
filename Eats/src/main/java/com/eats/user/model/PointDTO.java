package com.eats.user.model;

public class PointDTO {
	
	private int point_idx;
	private int user_idx;
	private int point_total;
	private int point_get;
	private int point_use;
	
	public PointDTO() {
		
	}

	public PointDTO(int point_idx, int user_idx, int point_total, int point_get, int point_use) {
		super();
		this.point_idx = point_idx;
		this.user_idx = user_idx;
		this.point_total = point_total;
		this.point_get = point_get;
		this.point_use = point_use;
	}

	public int getPoint_idx() {
		return point_idx;
	}

	public void setPoint_idx(int point_idx) {
		this.point_idx = point_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getPoint_total() {
		return point_total;
	}

	public void setPoint_total(int point_total) {
		this.point_total = point_total;
	}

	public int getPoint_get() {
		return point_get;
	}

	public void setPoint_get(int point_get) {
		this.point_get = point_get;
	}

	public int getPoint_use() {
		return point_use;
	}

	public void setPoint_use(int point_use) {
		this.point_use = point_use;
	}
}
