package com.eats.store.model.report;

public class YearCompareDTO {
	private String month;      // MM
    private int reservCount;   // 예약 건수
    private int totalCount;    // 예약 인원 수
    
    public YearCompareDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public YearCompareDTO(String month, int reservCount, int totalCount) {
		super();
		this.month = month;
		this.reservCount = reservCount;
		this.totalCount = totalCount;
	}
	
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getReservCount() {
		return reservCount;
	}

	public void setReservCount(int reservCount) {
		this.reservCount = reservCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
}
