package com.eats.store.model;

public class StoreImgDTO {

    private int si_idx;
    private int store_idx;
    
    private String store_img;
    private int img_order;
    
    public StoreImgDTO() {
		// TODO Auto-generated constructor stub
	}

	public StoreImgDTO(int si_idx, int store_idx, String store_img, int img_order) {
		super();
		this.si_idx = si_idx;
		this.store_idx = store_idx;
		this.store_img = store_img;
		this.img_order = img_order;
	}

	public int getSi_idx() {
		return si_idx;
	}

	public void setSi_idx(int si_idx) {
		this.si_idx = si_idx;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public String getStore_img() {
		return store_img;
	}

	public void setStore_img(String store_img) {
		this.store_img = store_img;
	}

	public int getImg_order() {
		return img_order;
	}

	public void setImg_order(int img_order) {
		this.img_order = img_order;
	}
    
    
}
