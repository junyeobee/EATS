package com.eats.store.model.report;

public class ReservReportDTO {
	private int storeIdx;          // 매장 번호
	private WeekReservDTO weeklyStats;      // 주간 통계
	private MonthReservDTO monthlyStats;    // 월간 통계
	private DayReservDTO dailyStats;        // 요일별 통계
	private YearCompareDTO yearlyStats;     // 연간 통계
	
	public ReservReportDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReservReportDTO(int storeIdx, WeekReservDTO weeklyStats, MonthReservDTO monthlyStats,
			DayReservDTO dailyStats, YearCompareDTO yearlyStats) {
		super();
		this.storeIdx = storeIdx;
		this.weeklyStats = weeklyStats;
		this.monthlyStats = monthlyStats;
		this.dailyStats = dailyStats;
		this.yearlyStats = yearlyStats;
	}

	public int getStoreIdx() {
		return storeIdx;
	}

	public void setStoreIdx(int storeIdx) {
		this.storeIdx = storeIdx;
	}

	public WeekReservDTO getWeeklyStats() {
		return weeklyStats;
	}

	public void setWeeklyStats(WeekReservDTO weeklyStats) {
		this.weeklyStats = weeklyStats;
	}

	public MonthReservDTO getMonthlyStats() {
		return monthlyStats;
	}

	public void setMonthlyStats(MonthReservDTO monthlyStats) {
		this.monthlyStats = monthlyStats;
	}

	public DayReservDTO getDailyStats() {
		return dailyStats;
	}

	public void setDailyStats(DayReservDTO dailyStats) {
		this.dailyStats = dailyStats;
	}

	public YearCompareDTO getYearlyStats() {
		return yearlyStats;
	}

	public void setYearlyStats(YearCompareDTO yearlyStats) {
		this.yearlyStats = yearlyStats;
	}
	
}
