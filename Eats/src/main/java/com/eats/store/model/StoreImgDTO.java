package com.eats.store.model;

public class StoreImgDTO {
	
	private int si_idx;
	private int store_idx;
	private String store_img1;
	private String store_img2;
	private String store_img3;
	private String store_img4;
	private String store_img5;
	
	public StoreImgDTO() {
		// TODO Auto-generated constructor stub
	}

	public StoreImgDTO(int si_idx, int store_idx, String store_img1, String store_img2, String store_img3,
			String store_img4, String store_img5) {
		super();
		this.si_idx = si_idx;
		this.store_idx = store_idx;
		this.store_img1 = store_img1;
		this.store_img2 = store_img2;
		this.store_img3 = store_img3;
		this.store_img4 = store_img4;
		this.store_img5 = store_img5;
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

	public String getStore_img1() {
		return store_img1;
	}

	public void setStore_img1(String store_img1) {
		this.store_img1 = store_img1;
	}

	public String getStore_img2() {
		return store_img2;
	}

	public void setStore_img2(String store_img2) {
		this.store_img2 = store_img2;
	}

	public String getStore_img3() {
		return store_img3;
	}

	public void setStore_img3(String store_img3) {
		this.store_img3 = store_img3;
	}

	public String getStore_img4() {
		return store_img4;
	}

	public void setStore_img4(String store_img4) {
		this.store_img4 = store_img4;
	}

	public String getStore_img5() {
		return store_img5;
	}

	public void setStore_img5(String store_img5) {
		this.store_img5 = store_img5;
	}
	
	
}
