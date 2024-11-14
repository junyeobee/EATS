package com.eats.store.model.report;

import com.eats.store.model.AnalyzerDTO;

public class StoreAnalysisResultDTO {
	private AnalyzerDTO analyzerResult;
	private ReservReportDTO reservationStats;
	
	public StoreAnalysisResultDTO() {
		// TODO Auto-generated constructor stub
	}


	public StoreAnalysisResultDTO(AnalyzerDTO analyzerResult, ReservReportDTO reservationStats) {
		super();
		this.analyzerResult = analyzerResult;
		this.reservationStats = reservationStats;
	}


	public AnalyzerDTO getAnalyzerResult() {
		return analyzerResult;
	}


	public void setAnalyzerResult(AnalyzerDTO analyzerResult) {
		this.analyzerResult = analyzerResult;
	}


	public ReservReportDTO getReservationStats() {
		return reservationStats;
	}


	public void setReservationStats(ReservReportDTO reservationStats) {
		this.reservationStats = reservationStats;
	}
	
}
