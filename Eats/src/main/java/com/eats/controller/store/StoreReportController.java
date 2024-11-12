package com.eats.controller.store;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eats.store.model.report.DayReservDTO;
import com.eats.store.model.report.MonthReservDTO;
import com.eats.store.model.report.ReservReportDTO;
import com.eats.store.model.report.TimeReservDTO;
import com.eats.store.model.report.WeekReservDTO;
import com.eats.store.model.report.YearCompareDTO;
import com.eats.store.service.StoreReportService;

import jakarta.servlet.http.HttpSession;

@Controller
public class StoreReportController {
	
	@Autowired
	private StoreReportService storeReportService;
	
	@GetMapping("/reportLoad")
	public String report() {
		return "store/storeReport/storeReport";
	}
	
	@GetMapping("/reportIsCreated")
	@ResponseBody
	public boolean reportIsCreated(HttpSession session) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		String thismonth = year + "-" + month;
		Map<String, String> map = new HashMap<String, String>();
		// int store_idx = (int)session.getAttribute("store_idx");
		int store_idx = 1;
		map.put("store_idx", store_idx+"");
		map.put("thismonth", thismonth);

		return storeReportService.reportIsThere(map);
	}
	
	@GetMapping("/weekreport")
	@ResponseBody
	public ResponseEntity<ReservReportDTO> weekChart(
			@RequestParam(defaultValue = "1") int storeIdx,
			@RequestParam(required = false) String yearMonth) {

		if (yearMonth == null) {
			yearMonth = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM"));
		}

		Map<String, String> map = new HashMap<>();
		map.put("store_idx", String.valueOf(storeIdx));
		map.put("thismonth", yearMonth);

		ReservReportDTO dto = new ReservReportDTO();
		dto.setStoreIdx(storeIdx);
		dto.setTimelyStats(storeReportService.reservTime(map));
		dto.setDailyStats(storeReportService.reservDay(map));
		dto.setWeeklyStats(storeReportService.reservWeek(map));
		dto.setMonthlyStats(storeReportService.reservMonth(map));
		dto.setYearlyStats(storeReportService.reservYear(map));

		return ResponseEntity.ok(dto);
	}
	
}
