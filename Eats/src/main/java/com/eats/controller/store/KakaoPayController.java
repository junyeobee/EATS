package com.eats.controller.store;

import java.time.LocalDateTime;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eats.kakao.KakaoPayService;
import com.eats.kakao.model.KakaoPayReadyDTO;

@Controller
@RequestMapping("/store/storeReport")
public class KakaoPayController {
	private static final Logger log = LoggerFactory.getLogger(KakaoPayController.class);
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@GetMapping("/subscribe")
	public String showPaymentPage(Model model) {
		System.out.println(model);
		return "store/storeReport/test";
	}
	   
	@PostMapping("/ready")
	@ResponseBody
	public ResponseEntity<?> readyToPayment(@RequestBody Map<String, String> request) {
		log.info("Payment ready requested with data: {}", request);
		
		try {
			String userId = request.get("userId");
			if (userId == null || userId.trim().isEmpty()) {
				return ResponseEntity.badRequest().body(Map.of("error", "유저아이디 필요"));
		}
		
			String orderId = "ORDER_" + System.currentTimeMillis() + "_" + userId;
			KakaoPayReadyDTO response = kakaoPayService.readyForPayment(orderId, userId);
		
			return ResponseEntity.ok(response);
		    
		} catch (Exception e) {
			log.error("Error in payment ready: ", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", e.getMessage(),"timestamp", LocalDateTime.now().toString()));
		}
	}
	   
	@GetMapping("/success")
	public String paymentSuccess(@RequestParam("pg_token") String pgToken) {
		return "store/storeReport/success";
	}
	
	@GetMapping("/cancel")
	public String paymentCancel() {
		return "store/storeReport/cancel";  // 경로 수정
	}
	
	@GetMapping("/fail")
	public String paymentFail() {
		return "store/storeReport/fail";  // 경로 수정
	}
}
