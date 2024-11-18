package com.eats.controller.store;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.eats.store.service.StoreSellService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SellController {
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
			response.put("message", processedCount + "건의 매출이 성공적으로 등록되었습니다.");
			response.put("processedCount", processedCount);
    
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "매출 등록 중 오류가 발생했습니다: " + e.getMessage());
		}
    
		return response;
	}
}
