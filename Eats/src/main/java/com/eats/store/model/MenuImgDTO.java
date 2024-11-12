package com.eats.store.model;

/*
CREATE TABLE MENU_IMAGE (
	    MENU_IMAGE_IDX NUMBER(15) PRIMARY KEY, -- AUTO_INCREMENT를 사용하기 위해 NUMBER로 정의
	    ORIGIN_IMAGE_NAME VARCHAR2(256) NOT NULL,
	    NEW_IMAGE_NAME VARCHAR2(256) NOT NULL,
	    IMAGE_PATH VARCHAR2(256) NOT NULL
	);*/

public class MenuImgDTO {

	private Integer menu_image_idx;
	private String origin_image_name;
	private String new_image_name;
	private String image_path;
	
	
	public MenuImgDTO() {
		
	}


	public MenuImgDTO(Integer menu_image_idx, String origin_image_name, String new_image_name, String image_path) {
		super();
		this.menu_image_idx = menu_image_idx;
		this.origin_image_name = origin_image_name;
		this.new_image_name = new_image_name;
		this.image_path = image_path;
	}


	public Integer getMenu_image_idx() {
		return menu_image_idx;
	}


	public void setMenu_image_idx(Integer menu_image_idx) {
		this.menu_image_idx = menu_image_idx;
	}


	public String getOrigin_image_name() {
		return origin_image_name;
	}


	public void setOrigin_image_name(String origin_image_name) {
		this.origin_image_name = origin_image_name;
	}


	public String getNew_image_name() {
		return new_image_name;
	}


	public void setNew_image_name(String new_image_name) {
		this.new_image_name = new_image_name;
	}


	public String getImage_path() {
		return image_path;
	}


	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}


	
	
	
	
	
	
	
	
	
}
