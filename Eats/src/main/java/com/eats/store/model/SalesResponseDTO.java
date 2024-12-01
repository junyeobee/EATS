package com.eats.store.model;

public class SalesResponseDTO {
	private String sellDate;      
	private String salesAmount;    // #,### 형식
	private String salesCount;     // #,### 형식 
	private String dateType;       // 차트 표시용
	
	public SalesResponseDTO() {
		// TODO Auto-generated constructor stub
	}

	public SalesResponseDTO(String sellDate, String salesAmount, String salesCount, String dateType) {
		this.sellDate = sellDate;
		this.salesAmount = salesAmount;
		this.salesCount = salesCount;
		this.dateType = dateType;
	}

	public String getSellDate() {
		return sellDate;
	}

	public void setSellDate(String sellDate) {
		this.sellDate = sellDate;
	}

	public String getSalesAmount() {
		return salesAmount;
	}

	public void setSalesAmount(String salesAmount) {
		this.salesAmount = salesAmount;
	}

	public String getSalesCount() {
		return salesCount;
	}

	public void setSalesCount(String salesCount) {
		this.salesCount = salesCount;
	}

	public String getDateType() {
		return dateType;
	}

	public void setDateType(String dateType) {
		this.dateType = dateType;
	}
	
	
}
