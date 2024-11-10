package com.eats.controller.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eats.store.model.StoreReportDTO;
import com.eats.store.service.StoreReportService;

@Controller
public class StoreReportController {
	
	@Autowired
	private StoreReportService service;
	
	@GetMapping("/reportLoad")
	public String report() {
		return "store/storeReport/storeReport";
	}
	
	@GetMapping("/storeReportCreate")
	@ResponseBody()
	public List<StoreReportDTO> reportSelect(int store_idx) {
		List<StoreReportDTO> reviews = service.selectReviewForReport(store_idx);
		return reviews;
	}
	
}
