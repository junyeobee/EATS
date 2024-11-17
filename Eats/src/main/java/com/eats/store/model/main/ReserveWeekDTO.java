package com.eats.store.model.main;

public class ReserveWeekDTO {
	private String saledate;
	private int totalamount;
	
	public ReserveWeekDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReserveWeekDTO(String saledate, int totalamount) {
		super();
		this.saledate = saledate;
		this.totalamount = totalamount;
	}

	public String getSaledate() {
		return saledate;
	}

	public void setSaledate(String saledate) {
		this.saledate = saledate;
	}

	public int getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(int totalamount) {
		this.totalamount = totalamount;
	}
	
}
