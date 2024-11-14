package com.eats.store.model.report;


public class DayReservDTO {
	private String dayName;
	private int reservCount;
	private int totalCount;
	
	public DayReservDTO() {
		// TODO Auto-generated constructor stub
	}

	public DayReservDTO(String yearMonth, String dayName, int reservCount, int totalCount) {
		super();
		this.dayName = dayName;
		this.reservCount = reservCount;
		this.totalCount = totalCount;
	}

	public String getDayName() {
		return dayName;
	}

	public void setDayName(String dayName) {
		this.dayName = dayName;
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
