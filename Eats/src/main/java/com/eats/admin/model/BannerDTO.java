package com.eats.admin.model;

import java.sql.Date;

/*CREATE TABLE BANNER(
		BANNER_IDX NUMBER(10) PRIMARY KEY
		, BANNER_IMG VARCHAR2(1000) NOT NULL
		, BANNER_ORDER NUMBER(2) NOT NULL
		, BANNER_NAME VARCHAR2(100) NOT NULL
		, BANNER_URL VARCHAR2(1000) NOT NULL
		, BANNER_STAT NUMBER(1) NOT NULL
		, BANNER_SDATE DATE NOT NULL
		, BANNER_EDATE DATE NOT NULL
	);*/

public class BannerDTO {

	private int banner_idx;
	private String banner_img;
	private int banner_order;
	private String banner_name;
	private String banner_url;
	private int banner_stat;
	private Date banner_sdate;
	private Date banner_edate;
	
	
	public BannerDTO() {
		
	}


	public BannerDTO(int banner_idx, String banner_img, int banner_order, String banner_name, String banner_url,
			int banner_stat, Date banner_sdate, Date banner_edate) {
	
		this.banner_idx = banner_idx;
		this.banner_img = banner_img;
		this.banner_order = banner_order;
		this.banner_name = banner_name;
		this.banner_url = banner_url;
		this.banner_stat = banner_stat;
		this.banner_sdate = banner_sdate;
		this.banner_edate = banner_edate;
	}


	public int getBanner_idx() {
		return banner_idx;
	}


	public void setBanner_idx(int banner_idx) {
		this.banner_idx = banner_idx;
	}


	public String getBanner_img() {
		return banner_img;
	}


	public void setBanner_img(String banner_img) {
		this.banner_img = banner_img;
	}


	public int getBanner_order() {
		return banner_order;
	}


	public void setBanner_order(int banner_order) {
		this.banner_order = banner_order;
	}


	public String getBanner_name() {
		return banner_name;
	}


	public void setBanner_name(String banner_name) {
		this.banner_name = banner_name;
	}


	public String getBanner_url() {
		return banner_url;
	}


	public void setBanner_url(String banner_url) {
		this.banner_url = banner_url;
	}


	public int getBanner_stat() {
		return banner_stat;
	}


	public void setBanner_stat(int banner_stat) {
		this.banner_stat = banner_stat;
	}


	public Date getBanner_sdate() {
		return banner_sdate;
	}


	public void setBanner_sdate(Date banner_sdate) {
		this.banner_sdate = banner_sdate;
	}


	public Date getBanner_edate() {
		return banner_edate;
	}


	public void setBanner_edate(Date banner_edate) {
		this.banner_edate = banner_edate;
	}
	
	
	
	
	
	
	
	
	
}
