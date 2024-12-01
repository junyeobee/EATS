package com.eats.admin.model;

public class AdminStoreInfoUpdateDTO {
	
	private int su_idx;   
	
    private int store_idx;
    private String su_name, su_tel, su_addr, su_daddr, su_ceo, su_state, su_reason;
    
    private String store_name; 
    private int store_area;
    private String store_addr, store_daddr, store_tel, store_biznum, store_state, store_lat, store_lng;

    private String store_ceo;
    
    public AdminStoreInfoUpdateDTO() {
		// TODO Auto-generated constructor stub
	}

	public AdminStoreInfoUpdateDTO(int su_idx, int store_idx, String su_name, String su_tel, String su_addr,
			String su_daddr, String su_ceo, String su_state, String su_reason, String store_name, int store_area,
			String store_addr, String store_daddr, String store_tel, String store_biznum, String store_state,
			String store_lat, String store_lng, String store_ceo) {
		super();
		this.su_idx = su_idx;
		this.store_idx = store_idx;
		this.su_name = su_name;
		this.su_tel = su_tel;
		this.su_addr = su_addr;
		this.su_daddr = su_daddr;
		this.su_ceo = su_ceo;
		this.su_state = su_state;
		this.su_reason = su_reason;
		this.store_name = store_name;
		this.store_area = store_area;
		this.store_addr = store_addr;
		this.store_daddr = store_daddr;
		this.store_tel = store_tel;
		this.store_biznum = store_biznum;
		this.store_state = store_state;
		this.store_lat = store_lat;
		this.store_lng = store_lng;
		this.store_ceo = store_ceo;
	}

	public int getSu_idx() {
		return su_idx;
	}

	public void setSu_idx(int su_idx) {
		this.su_idx = su_idx;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public String getSu_name() {
		return su_name;
	}

	public void setSu_name(String su_name) {
		this.su_name = su_name;
	}

	public String getSu_tel() {
		return su_tel;
	}

	public void setSu_tel(String su_tel) {
		this.su_tel = su_tel;
	}

	public String getSu_addr() {
		return su_addr;
	}

	public void setSu_addr(String su_addr) {
		this.su_addr = su_addr;
	}

	public String getSu_daddr() {
		return su_daddr;
	}

	public void setSu_daddr(String su_daddr) {
		this.su_daddr = su_daddr;
	}

	public String getSu_ceo() {
		return su_ceo;
	}

	public void setSu_ceo(String su_ceo) {
		this.su_ceo = su_ceo;
	}

	public String getSu_state() {
		return su_state;
	}

	public void setSu_state(String su_state) {
		this.su_state = su_state;
	}

	public String getSu_reason() {
		return su_reason;
	}

	public void setSu_reason(String su_reason) {
		this.su_reason = su_reason;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public int getStore_area() {
		return store_area;
	}

	public void setStore_area(int store_area) {
		this.store_area = store_area;
	}

	public String getStore_addr() {
		return store_addr;
	}

	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}

	public String getStore_daddr() {
		return store_daddr;
	}

	public void setStore_daddr(String store_daddr) {
		this.store_daddr = store_daddr;
	}

	public String getStore_tel() {
		return store_tel;
	}

	public void setStore_tel(String store_tel) {
		this.store_tel = store_tel;
	}

	public String getStore_biznum() {
		return store_biznum;
	}

	public void setStore_biznum(String store_biznum) {
		this.store_biznum = store_biznum;
	}

	public String getStore_state() {
		return store_state;
	}

	public void setStore_state(String store_state) {
		this.store_state = store_state;
	}

	public String getStore_lat() {
		return store_lat;
	}

	public void setStore_lat(String store_lat) {
		this.store_lat = store_lat;
	}

	public String getStore_lng() {
		return store_lng;
	}

	public void setStore_lng(String store_lng) {
		this.store_lng = store_lng;
	}

	public String getStore_ceo() {
		return store_ceo;
	}

	public void setStore_ceo(String store_ceo) {
		this.store_ceo = store_ceo;
	}
}
