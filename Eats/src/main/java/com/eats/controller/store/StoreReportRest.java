package com.eats.controller.store;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eats.store.model.StoreReportDTO;
import com.eats.store.model.report.ReservReportDTO;
import com.eats.store.model.report.StoreAnalysisResultDTO;
import com.eats.store.service.ReviewAnalyzsisService;
import com.eats.store.service.StoreReportService;

import reactor.core.publisher.Mono;

@RestController
public class StoreReportRest {
	@Autowired
	private StoreReportService service;
	
	@Autowired
	private ReviewAnalyzsisService analyserv;
	
	
	@PostMapping("/storeReportCreate")
	public Mono<StoreAnalysisResultDTO> reportSelect() {
	    Map<String, String> map = new HashMap<>();
	    map.put("store_idx", "1");
	    map.put("thismonth", LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM")));

	    List<StoreReportDTO> reviews = service.selectReviewForReport(map);

	    // 먼저 리뷰 분석을 완료
	    return analyserv.analyzeReviews(reviews)
	        .flatMap(analyzerResult -> {
	            // 리뷰 분석이 완료된 후 예약 통계 생성
	            ReservReportDTO reportDTO = new ReservReportDTO();
	            reportDTO.setStoreIdx(1);
	            reportDTO.setDailyStats(service.reservDay(map));
	            reportDTO.setWeeklyStats(service.reservWeek(map));
	            reportDTO.setMonthlyStats(service.reservMonth(map));
	            reportDTO.setYearlyStats(service.reservYear(map));
	            reportDTO.setTimelyStats(service.reservTime(map));
	            reportDTO.setSellDay(service.sellDay(map));
	            reportDTO.setSellWeek(service.sellWeek(map));
	            reportDTO.setSellMonth(service.sellMonth(map));
	            reportDTO.setSellMenu(service.sellMenu(map));

	            // 최종 결과 생성
	            StoreAnalysisResultDTO result = new StoreAnalysisResultDTO();
	            result.setAnalyzerResult(analyzerResult);
	            result.setReservationStats(reportDTO);
	            
	            return Mono.just(result);
	        });
	}
}
