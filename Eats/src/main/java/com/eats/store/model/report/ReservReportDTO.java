package com.eats.store.model.report;

import java.util.List;

public class ReservReportDTO {
	private int storeIdx;          // 매장 번호
	private List<WeekReservDTO> weeklyStats;      // 주간 통계
	private List<MonthReservDTO> monthlyStats;    // 월간 통계
	private List<DayReservDTO> dailyStats;        // 요일별 통계
	private List<YearCompareDTO> yearlyStats;     // 연간 통계
	private List<TimeReservDTO> timelyStats;
	
	public ReservReportDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReservReportDTO(int storeIdx, List<WeekReservDTO> weeklyStats, List<MonthReservDTO> monthlyStats,
			List<DayReservDTO> dailyStats, List<YearCompareDTO> yearlyStats, List<TimeReservDTO> timelyStats) {
		super();
		this.storeIdx = storeIdx;
		this.weeklyStats = weeklyStats;
		this.monthlyStats = monthlyStats;
		this.dailyStats = dailyStats;
		this.yearlyStats = yearlyStats;
		this.timelyStats = timelyStats;
	}

	public int getStoreIdx() {
		return storeIdx;
	}

	public void setStoreIdx(int storeIdx) {
		this.storeIdx = storeIdx;
	}

	public List<WeekReservDTO> getWeeklyStats() {
		return weeklyStats;
	}

	public void setWeeklyStats(List<WeekReservDTO> weeklyStats) {
		this.weeklyStats = weeklyStats;
	}

	public List<MonthReservDTO> getMonthlyStats() {
		return monthlyStats;
	}

	public void setMonthlyStats(List<MonthReservDTO> monthlyStats) {
		this.monthlyStats = monthlyStats;
	}

	public List<DayReservDTO> getDailyStats() {
		return dailyStats;
	}

	public void setDailyStats(List<DayReservDTO> dailyStats) {
		this.dailyStats = dailyStats;
	}

	public List<YearCompareDTO> getYearlyStats() {
		return yearlyStats;
	}

	public void setYearlyStats(List<YearCompareDTO> yearlyStats) {
		this.yearlyStats = yearlyStats;
	}

	public List<TimeReservDTO> getTimelyStats() {
		return timelyStats;
	}

	public void setTimelyStats(List<TimeReservDTO> timelyStats) {
		this.timelyStats = timelyStats;
	}	
	
}
