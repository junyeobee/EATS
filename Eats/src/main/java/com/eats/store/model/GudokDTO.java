package com.eats.store.model;

import java.util.*;


public class GudokDTO {
	private int gudokIdx;
	private int storeIdx;
	private Date gudokStart;
	private Date gudokNextpay;
	private Date gudokEnd;
	private int gudokType;
	private String gudokMethod;
	private String gudokInfo;
	private int gudokStat;
	
	public GudokDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public GudokDTO(int gudokIdx, int storeIdx, Date gudokStart, Date gudokNextpay, Date gudokEnd, int gudokType,
			String gudokMethod, String gudokInfo, int gudokStat) {
		super();
		this.gudokIdx = gudokIdx;
		this.storeIdx = storeIdx;
		this.gudokStart = gudokStart;
		this.gudokNextpay = gudokNextpay;
		this.gudokEnd = gudokEnd;
		this.gudokType = gudokType;
		this.gudokMethod = gudokMethod;
		this.gudokInfo = gudokInfo;
		this.gudokStat = gudokStat;
	}
	
	public int getGudokIdx() {
		return gudokIdx;
	}
	
	public void setGudokIdx(int gudokIdx) {
		this.gudokIdx = gudokIdx;
	}
	
	public int getStoreIdx() {
		return storeIdx;
	}
	
	public void setStoreIdx(int storeIdx) {
		this.storeIdx = storeIdx;
	}
	
	public Date getGudokStart() {
		return gudokStart;
	}
	
	public void setGudokStart(Date gudokStart) {
		this.gudokStart = gudokStart;
	}
	
	public Date getGudokNextpay() {
		return gudokNextpay;
	}
	
	public void setGudokNextpay(Date gudokNextpay) {
		this.gudokNextpay = gudokNextpay;
	}
	
	public Date getGudokEnd() {
		return gudokEnd;
	}
	
	public void setGudokEnd(Date gudokEnd) {
		this.gudokEnd = gudokEnd;
	}
	
	public int getGudokType() {
		return gudokType;
	}
	
	public void setGudokType(int gudokType) {
		this.gudokType = gudokType;
	}
	
	public String getGudokMethod() {
		return gudokMethod;
	}
	
	public void setGudokMethod(String gudokMethod) {
		this.gudokMethod = gudokMethod;
	}
	
	public String getGudokInfo() {
		return gudokInfo;
	}
	
	public void setGudokInfo(String gudokInfo) {
		this.gudokInfo = gudokInfo;
	}
	
	public int getGudokStat() {
		return gudokStat;
	}
	
	public void setGudokStat(int gudokStat) {
		this.gudokStat = gudokStat;
	}
}
