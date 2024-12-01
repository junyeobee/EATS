package com.eats.store.model;

public class SalesSearchDTO {
	private int storeIdx;
	private String startDateTime;  
	private String endDateTime;    
	private String dateType;
	
	public SalesSearchDTO() {
		// TODO Auto-generated constructor stub
	}

	public SalesSearchDTO(int storeIdx, String startDateTime, String endDateTime, String dateType) {
		this.storeIdx = storeIdx;
		this.startDateTime = startDateTime;
		this.endDateTime = endDateTime;
		this.dateType = dateType;
	}

	public int getStoreIdx() {
		return storeIdx;
	}

	public void setStoreIdx(int storeIdx) {
		this.storeIdx = storeIdx;
	}

	public String getStartDateTime() {
		return startDateTime;
	}

	public void setStartDateTime(String startDateTime) {
		this.startDateTime = startDateTime;
	}

	public String getEndDateTime() {
		return endDateTime;
	}

	public void setEndDateTime(String endDateTime) {
		this.endDateTime = endDateTime;
	}

	public String getDateType() {
		return dateType;
	}

	public void setDateType(String dateType) {
		this.dateType = dateType;
	}

	
	
}
