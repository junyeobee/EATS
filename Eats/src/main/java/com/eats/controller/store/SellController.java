package com.eats.controller.store;

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.SalesResponseDTO;
import com.eats.store.model.SalesSearchDTO;
import com.eats.store.service.StoreSellService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SellController { 
	private static final Logger log = LoggerFactory.getLogger(SellController.class);
	@Autowired
	private StoreSellService service;
	
	@GetMapping("/sellUploadForm")
	public String sellUploadForm() {
		return "store/sell/selladd";
	}
	
	@PostMapping("/sellUpload")
	@ResponseBody
    public Map<String, Object> uploadSales(@RequestParam("file") MultipartFile file, HttpServletRequest req) {
		HttpSession session = req.getSession();
		int storeIdx = (Integer)session.getAttribute("store_idx") == null ? 1 : (Integer)session.getAttribute("store_idx");
		Map<String, Object> response = new HashMap<>();
		try {
			int processedCount = service.sellInsert(file, storeIdx);
			response.put("success", true);
			response.put("message", processedCount + "건의 매출이 등록되었습니다.");
			response.put("processedCount", processedCount);
    
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "매출 등록 중 오류가 발생했습니다: " + e.getMessage());
		}
    
		return response;
	}
	
	@GetMapping("/sellDetail")
	public ModelAndView sellDetail(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int storeIdx = (Integer)session.getAttribute("store_idx") == null ? 1 : (Integer)session.getAttribute("store_idx");
		ModelAndView mv = new ModelAndView();
		SalesSearchDTO dto = new SalesSearchDTO();
		dto.setStoreIdx(storeIdx);
		dto.setDateType("hour");
		LocalDateTime now = LocalDateTime.now();
		dto.setStartDateTime(now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd 00:00")));
		dto.setEndDateTime(now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd 23:59")));
		List<SalesResponseDTO> result = service.sellList(dto);
		int totalSell = 0;
		int totalCnt = 0;
		
		DecimalFormat df = new DecimalFormat("#,##0");	
		for(SalesResponseDTO dt : result) {
			totalSell += Integer.parseInt(dt.getSalesAmount());
			totalCnt += Integer.parseInt(dt.getSalesCount());
		}
		mv.addObject("totalSell", df.format(totalSell));
		mv.addObject("totalCnt", totalCnt);
		mv.addObject("sellData", result);
		mv.setViewName("store/sell/sellDetail");
		return mv;
	}
	
	@PostMapping("/sellDetailLists")
	@ResponseBody
	public List<SalesResponseDTO> getSalesList(SalesSearchDTO dto, HttpServletRequest req) {
		HttpSession session = req.getSession();
		int storeIdx = session.getAttribute("store_idx") == null ? 1 : (Integer)session.getAttribute("store_idx");
		dto.setStoreIdx(storeIdx);
		System.out.println(dto.getStartDateTime());
		System.out.println(dto.getEndDateTime());
		List<SalesResponseDTO> result = service.sellList(dto);
		
		return result;
	}
	
}
