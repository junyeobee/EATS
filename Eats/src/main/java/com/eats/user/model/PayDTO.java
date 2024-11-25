package com.eats.user.model;

public class PayDTO {

	
	private int store_idx;
	private String store_name;
	private String user_name;
	private String user_tel;
	private int pay_price;
	private int pay_method;
	
	public PayDTO() {
		
	}
	
	public PayDTO(int pay_price, int pay_method) {
		this.pay_price = pay_price;
		this.pay_method = pay_method;
	}
	
	public PayDTO(int store_idx, String store_name, String user_name, String user_tel, int pay_price, int pay_method) {
		this.store_idx = store_idx;
		this.store_name = store_name;
		this.user_name = user_name;
		this.user_tel = user_tel;
		this.pay_price = pay_price;
		this.pay_method = pay_method;
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


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_tel() {
		return user_tel;
	}


	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public int getPay_method() {
		return pay_method;
	}

	public void setPay_method(int pay_method) {
		this.pay_method = pay_method;
	}
	
	
	
	
}
