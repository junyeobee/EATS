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

import com.eats.store.model.AnalyzerDTO;
import com.eats.store.model.report.ReservReportDTO;
import com.eats.store.model.report.StoreAnalysisResultDTO;
import com.eats.store.service.StoreReportService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StoreReportController {
	
	@Autowired
	private StoreReportService storeReportService;
	
	@GetMapping("/reportLoad")
	public String report(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int store_idx = (int)session.getAttribute("storeIdx");
		int result = storeReportService.isGudoked(store_idx);
		if(result == -1){
			return "store/storeReport/storeReportLanding";
		}
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

	@GetMapping("/reportLanding")
	public String reportLanding() {
		return "store/storeReport/storeReportLanding";
	}
	

	@GetMapping("/weekreportTest")
	@ResponseBody
	public ResponseEntity<StoreAnalysisResultDTO> weekChartTest(
			@RequestParam(defaultValue = "1") int storeIdx,
			@RequestParam(required = false) String yearMonth) {

		// 기존 ReservReportDTO 생성
		if (yearMonth == null) {
			yearMonth = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM"));
		}

		Map<String, String> map = new HashMap<>();
		map.put("store_idx", String.valueOf(storeIdx));
		map.put("thismonth", yearMonth);

		ReservReportDTO reservDTO = new ReservReportDTO();
		reservDTO.setStoreIdx(storeIdx);
		reservDTO.setTimelyStats(storeReportService.reservTime(map));
		reservDTO.setDailyStats(storeReportService.reservDay(map));
		reservDTO.setWeeklyStats(storeReportService.reservWeek(map));
		reservDTO.setMonthlyStats(storeReportService.reservMonth(map));
		reservDTO.setYearlyStats(storeReportService.reservYear(map));
		reservDTO.setSellDay(storeReportService.sellDay(map));
		reservDTO.setSellWeek(storeReportService.sellWeek(map));
		reservDTO.setSellMonth(storeReportService.sellMonth(map));
		reservDTO.setSellMenu(storeReportService.sellMenu(map));

		// AnalyzerDTO 테스트 데이터 생성
		AnalyzerDTO analyzerDTO = new AnalyzerDTO();
		List<AnalyzerDTO.AnalysisResult> resultList = new ArrayList<>();
		AnalyzerDTO.AnalysisResult result = new AnalyzerDTO.AnalysisResult();

		// 분위기 데이터
		Map<String, List<String>> atmosphere = new HashMap<>();
		atmosphere.put("긍정", Arrays.asList("깨끗해요", "편안해요"));
		atmosphere.put("부정", Arrays.asList("시끄러워요"));
		result.setAtmosphere(atmosphere);

		// 서비스 데이터
		Map<String, List<String>> service = new HashMap<>();
		service.put("긍정", Arrays.asList("친절해요", "빨라요"));
		service.put("부정", Arrays.asList("불친절해요"));
		result.setService(service);

		// 메뉴 데이터
		List<Map<String, AnalyzerDTO.MenuEvaluation>> menuList = new ArrayList<>();
		
		// 첫 번째 메뉴
		Map<String, AnalyzerDTO.MenuEvaluation> menu1 = new HashMap<>();
		AnalyzerDTO.MenuEvaluation eval1 = new AnalyzerDTO.MenuEvaluation();
		eval1.setPositive(Arrays.asList("맛있어요", "신선해요"));
		eval1.setNegative(Arrays.asList("비싸요"));
		menu1.put("파스타", eval1);
		menuList.add(menu1);

		// 두 번째 메뉴
		Map<String, AnalyzerDTO.MenuEvaluation> menu2 = new HashMap<>();
		AnalyzerDTO.MenuEvaluation eval2 = new AnalyzerDTO.MenuEvaluation();
		eval2.setPositive(Arrays.asList("완벽해요"));
		eval2.setNegative(Arrays.asList("평범해요"));
		menu2.put("리조또", eval2);
		menuList.add(menu2);

		result.setMenu(menuList);
		resultList.add(result);
		analyzerDTO.setData(resultList);

		// 최종 DTO 생성
		StoreAnalysisResultDTO finalDTO = new StoreAnalysisResultDTO();
		finalDTO.setAnalyzerResult(analyzerDTO);
		finalDTO.setReservationStats(reservDTO);

		return ResponseEntity.ok(finalDTO);
	}
	
}
