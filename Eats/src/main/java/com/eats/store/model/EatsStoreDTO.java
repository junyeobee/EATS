package com.eats.store.model;

/*CREATE TABLE STORE_ACCOUNT(
		STORE_IDX NUMBER(10) PRIMARY KEY
		, STORE_ID VARCHAR2(30) NOT NULL
		, STORE_PWD VARCHAR2(30) NOT NULL
		, STORE_CEO VARCHAR2(10) NOT NULL
		, FOREIGN KEY(STORE_IDX) REFERENCES STORE(STORE_IDX)
	);*/
public class EatsStoreDTO {

	private int store_idx;
	private String store_id;
	private String store_pwd;
	private String store_ceo;
	public EatsStoreDTO() {
		super();
	}
	public EatsStoreDTO(int store_idx, String store_id, String store_pwd, String store_ceo) {
		super();
		this.store_idx = store_idx;
		this.store_id = store_id;
		this.store_pwd = store_pwd;
		this.store_ceo = store_ceo;
	}
	public int getStore_idx() {
		return store_idx;
	}
	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getStore_pwd() {
		return store_pwd;
	}
	public void setStore_pwd(String store_pwd) {
		this.store_pwd = store_pwd;
	}
	public String getStore_ceo() {
		return store_ceo;
	}
	public void setStore_ceo(String store_ceo) {
		this.store_ceo = store_ceo;
	}
	
	
	
}
