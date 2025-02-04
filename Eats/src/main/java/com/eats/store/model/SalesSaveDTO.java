package com.eats.store.model;

import java.util.Date;
import java.util.List;

public class SalesSaveDTO {
	private int sellIdx;
    private int storeIdx;
    private Date sellDate;
    private String sellMethod;
    private int totalCnt;
    private List<SellsDetailDTO> details;
    
    public SalesSaveDTO() {
		// TODO Auto-generated constructor stub
	}

	public SalesSaveDTO(int sellIdx, int storeIdx, Date sellDate, String sellMethod, int totalCnt,
			List<SellsDetailDTO> details) {
		super();
		this.sellIdx = sellIdx;
		this.storeIdx = storeIdx;
		this.sellDate = sellDate;
		this.sellMethod = sellMethod;
		this.totalCnt = totalCnt;
		this.details = details;
	}

	public int getSellIdx() {
		return sellIdx;
	}

	public void setSellIdx(int sellIdx) {
		this.sellIdx = sellIdx;
	}

	public int getStoreIdx() {
		return storeIdx;
	}

	public void setStoreIdx(int storeIdx) {
		this.storeIdx = storeIdx;
	}

	public Date getSellDate() {
		return sellDate;
	}

	public void setSellDate(Date sellDate) {
		this.sellDate = sellDate;
	}

	public String getSellMethod() {
		return sellMethod;
	}

	public void setSellMethod(String sellMethod) {
		this.sellMethod = sellMethod;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public List<SellsDetailDTO> getDetails() {
		return details;
	}

	public void setDetails(List<SellsDetailDTO> details) {
		this.details = details;
	}
    
    
    
}
