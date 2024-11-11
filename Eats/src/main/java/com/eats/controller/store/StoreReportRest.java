package com.eats.controller.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eats.store.model.AnalyzerDTO;
import com.eats.store.model.StoreReportDTO;
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
	public Mono<AnalyzerDTO> reportSelect() {
		List<StoreReportDTO> reviews = service.selectReviewForReport(1);
		Mono<AnalyzerDTO> al = analyserv.analyzeReviews(reviews);
		return al;
	}
}
