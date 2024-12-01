package com.eats.store.model.report;

public class MonthReservDTO {
	private String yearMonth;
	private int currMonthCount;
	private int prevMonthCount;
	private int currTotalCount;
	private int prevTotalCount;
	
	public MonthReservDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public MonthReservDTO(String yearMonth, int currMonthCount, int prevMonthCount, int growthRate, int currTotalCount,
			int prevTotalCount) {
		super();
		this.yearMonth = yearMonth;
		this.currMonthCount = currMonthCount;
		this.prevMonthCount = prevMonthCount;
		this.currTotalCount = currTotalCount;
		this.prevTotalCount = prevTotalCount;
	}
	
	public String getYearMonth() {
		return yearMonth;
	}
	
	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}
	
	public int getCurrMonthCount() {
		return currMonthCount;
	}
	
	public void setCurrMonthCount(int currMonthCount) {
		this.currMonthCount = currMonthCount;
	}
	
	public int getPrevMonthCount() {
		return prevMonthCount;
	}
	
	public void setPrevMonthCount(int prevMonthCount) {
		this.prevMonthCount = prevMonthCount;
	}
	
	public int getCurrTotalCount() {
		return currTotalCount;
	}
	
	public void setCurrTotalCount(int currTotalCount) {
		this.currTotalCount = currTotalCount;
	}
	
	public int getPrevTotalCount() {
		return prevTotalCount;
	}
	
	public void setPrevTotalCount(int prevTotalCount) {
		this.prevTotalCount = prevTotalCount;
	}
    
}
