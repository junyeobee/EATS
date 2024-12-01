package com.eats.controller.store;

import java.time.LocalDateTime;
import java.util.HashMap;
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
import com.eats.kakao.model.KakaoPayApproveDTO;
import com.eats.kakao.model.KakaoPayCancelDTO;
import com.eats.kakao.model.KakaoPayReadyDTO;
import com.eats.mapper.store.GudokMapper;
import com.eats.store.model.GudokDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/store/storeReport")
public class KakaoPayController {
	private static final Logger log = LoggerFactory.getLogger(KakaoPayController.class);
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private GudokMapper mapper;
	
	@GetMapping("/subscribe")
	public String showPaymentPage(Model model) {
		System.out.println(model);
		return "store/storeReport/test";
	}
	   
	@PostMapping("/ready")
	@ResponseBody
	public ResponseEntity<?> readyToPayment(@RequestBody Map<String, String> request, HttpServletRequest req) {
		log.info("Payment ready requested with data: {}", request);
		
		try {
			String userId = request.get("userId");
			if (userId == null || userId.trim().isEmpty()) {
				return ResponseEntity.badRequest().body(Map.of("error", "유저아이디 필요"));
		}
		
			String orderId = "ORDER_" + System.currentTimeMillis() + "_" + userId;
			KakaoPayReadyDTO response = kakaoPayService.readyForPayment(orderId, userId);
			HttpSession session = req.getSession();
			session.setAttribute("tid", response.getTid());
		    session.setAttribute("orderId", orderId);
		    session.setAttribute("userId", userId);
			return ResponseEntity.ok(response);
		    
		} catch (Exception e) {
			log.error("Error in payment ready: ", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", e.getMessage(),"timestamp", LocalDateTime.now().toString()));
		}
	}
	   
	@GetMapping("/success")
	public String paymentSuccess(@RequestParam("pg_token") String pgToken,HttpServletRequest req) {
		HttpSession session = req.getSession();
		Integer storeIdx = (Integer)session.getAttribute("storeIdx");
		int store_idx;
		if(storeIdx == null) {
			store_idx = 1;
		}else {
			store_idx = storeIdx;
		}
		String tid = (String)session.getAttribute("tid");
		String orderId = (String)session.getAttribute("orderId");
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		KakaoPayApproveDTO approveResult = kakaoPayService.approvePayment(pgToken, tid, orderId, userId);
		String sid = approveResult.getSid();
		kakaoPayService.saveSubscription(sid, store_idx, tid);
		return "store/storeReport/success";
	}
	
	@PostMapping("/cancel")
	@ResponseBody
	public ResponseEntity<?> cancelPayment(HttpSession session) {
		String storeidx = (String)session.getAttribute("storeIdx");
		int store_idx = storeidx == null? 1 : Integer.parseInt(storeidx);
		GudokDTO subscription = mapper.getGudokInfo(store_idx);
	   
		if (subscription == null) {
			return ResponseEntity.badRequest().body("결제 정보가 없습니다");
		}
		String tid = subscription.getGudok_tid();
		KakaoPayCancelDTO cancelResult = kakaoPayService.cancelPayment(tid);
		Map<String, Integer> params = new HashMap<>();
		params.put("gudokIdx", subscription.getGudok_Idx());
		params.put("status", 2);
		mapper.updateInfo(params);
		return ResponseEntity.ok(cancelResult);
	}
	
	@GetMapping("/fail")
	public String paymentFail() {
		return "store/storeReport/fail";
	}
}
