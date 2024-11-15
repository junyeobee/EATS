package com.eats.store.model;

//store 테이블에 있는 컬럼
//+store_account에 있는 store_ceo 존재
public class StoreDTO {

    private int store_idx; 
    private String store_name;
    
    private int store_area;
    
    private String store_addr, store_daddr, store_tel, store_biznum, store_state;
    private int store_lat, store_lng;
    
    private String store_ceo;
    
    public StoreDTO() {
		// TODO Auto-generated constructor stub
	}

	public StoreDTO(int store_idx, String store_name, int store_area, String store_addr, String store_daddr,
			String store_tel, String store_biznum, String store_state, int store_lat, int store_lng) {
		super();
		this.store_idx = store_idx;
		this.store_name = store_name;
		this.store_area = store_area;
		this.store_addr = store_addr;
		this.store_daddr = store_daddr;
		this.store_tel = store_tel;
		this.store_biznum = store_biznum;
		this.store_state = store_state;
		this.store_lat = store_lat;
		this.store_lng = store_lng;
	}

	public StoreDTO(int store_idx, String store_name, int store_area, String store_addr, String store_daddr,
			String store_tel, String store_biznum, String store_state, int store_lat, int store_lng, String store_ceo) {
		super();
		this.store_idx = store_idx;
		this.store_name = store_name;
		this.store_area = store_area;
		this.store_addr = store_addr;
		this.store_biznum = store_biznum;
		this.store_tel = store_tel;
		this.store_tel = store_tel;
		this.store_state = store_state;
		this.store_lat = store_lat;
		this.store_lng = store_lng;
		
		this.store_ceo = store_ceo;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
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

	public int getStore_lat() {
		return store_lat;
	}

	public void setStore_lat(int store_lat) {
		this.store_lat = store_lat;
	}

	public int getStore_lng() {
		return store_lng;
	}

	public void setStore_lng(int store_lng) {
		this.store_lng = store_lng;
	}
    

	public String getStore_ceo() {
		return store_ceo;
	}

	public void setStore_ceo(String store_ceo) {
		this.store_ceo = store_ceo;
	}
    

}
