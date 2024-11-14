package com.eats.store.model.report;

public class WeekReservDTO {
	private String yearMonth;     // YYYY-MM
	private int weekNum;         // 주차
	private int reservCount;     // 예약 건수
	private int totalCount;      // 예약 인원 수
	public WeekReservDTO() {
		// TODO Auto-generated constructor stub
	}
	public WeekReservDTO(String yearMonth, int weekNum, int reservCount, int totalCount) {
		super();
		this.yearMonth = yearMonth;
		this.weekNum = weekNum;
		this.reservCount = reservCount;
		this.totalCount = totalCount;
	}
	public String getYearMonth() {
		return yearMonth;
	}
	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}
	public int getWeekNum() {
		return weekNum;
	}
	public void setWeekNum(int weekNum) {
		this.weekNum = weekNum;
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
