package com.eats.admin.model;

public class AdminStoreDTO {

	private int store_idx;
	private String store_name, store_tel, store_id, store_email, store_state;
	private int gudok_stat;
	
	private String store_addr, store_daddr, store_biznum;
	
	public AdminStoreDTO() {
		// TODO Auto-generated constructor stub
	}

	public AdminStoreDTO(int store_idx, String store_name, String store_tel, String store_id, String store_email,
			String store_state, int gudok_stat, String store_addr, String store_daddr, String store_biznum) {
		super();
		this.store_idx = store_idx;
		this.store_name = store_name;
		this.store_tel = store_tel;
		this.store_id = store_id;
		this.store_email = store_email;
		this.store_state = store_state;
		this.gudok_stat = gudok_stat;
		this.store_addr = store_addr;
		this.store_daddr = store_daddr;
		this.store_biznum = store_biznum;
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

	public String getStore_tel() {
		return store_tel;
	}

	public void setStore_tel(String store_tel) {
		this.store_tel = store_tel;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getStore_email() {
		return store_email;
	}

	public void setStore_email(String store_email) {
		this.store_email = store_email;
	}

	public String getStore_state() {
		return store_state;
	}

	public void setStore_state(String store_state) {
		this.store_state = store_state;
	}

	public int getGudok_stat() {
		return gudok_stat;
	}

	public void setGudok_stat(int gudok_stat) {
		this.gudok_stat = gudok_stat;
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

	public String getStore_biznum() {
		return store_biznum;
	}

	public void setStore_biznum(String store_biznum) {
		this.store_biznum = store_biznum;
	}
	
	


	
}
