package com.eats.user.model;

public class JjimDTO {
    private int userIdx;
    private int storeIdx;
    private String storeName;
    private String storeAddr;
    // getters and setters
    public JjimDTO() {
		// TODO Auto-generated constructor stub
	}
	public JjimDTO(int userIdx, int storeIdx, String storeName, String storeAddr) {
		super();
		this.userIdx = userIdx;
		this.storeIdx = storeIdx;
		this.storeName = storeName;
		this.storeAddr = storeAddr;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public int getStoreIdx() {
		return storeIdx;
	}
	public void setStoreIdx(int storeIdx) {
		this.storeIdx = storeIdx;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreAddr() {
		return storeAddr;
	}
	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}
    
}
