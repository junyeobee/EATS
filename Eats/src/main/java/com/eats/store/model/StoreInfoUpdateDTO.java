package com.eats.store.model;

public class StoreInfoUpdateDTO {

	private int su_idx;
	private int store_idx;
	private String su_name, su_tel, su_addr, su_daddr, su_ceo, su_state, su_reason;
	
	public StoreInfoUpdateDTO() {
		// TODO Auto-generated constructor stub
	}

	public StoreInfoUpdateDTO(int su_idx, int store_idx, String su_name, String su_tel, String su_addr, String su_daddr,
			String su_ceo, String su_state, String su_reason) {
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
	
	
}
