package com.eats.kakao;


import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.eats.kakao.model.KakaoPayReadyDTO;

@Service
public class KakaoPayService {
    private static final Logger log = LoggerFactory.getLogger(KakaoPayService.class);
    
    @Value("${kakaopay.admin.key}")
    private String adminKey;
    
    @Autowired
    private RestTemplate restTemplate;
    
    public KakaoPayReadyDTO readyForPayment(String orderId, String userId) {
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "SECRET_KEY " + adminKey);
			headers.add("Content-Type", "application/json");
	    
			Map<String, String> parameters = new HashMap<>();
	    	parameters.put("cid", "TCSUBSCRIP");
			parameters.put("partner_order_id", "1234567890");
			parameters.put("partner_user_id", "roommake");
			parameters.put("item_name", "상품");
			parameters.put("quantity", "1");
			parameters.put("total_amount", "2200");
			parameters.put("tax_free_amount", "0");
			parameters.put("approval_url", "http://localhost:9090/store/storeReport/success");
			parameters.put("cancel_url", "http://localhost:9090/store/storeReport/cancel");
			parameters.put("fail_url", "http://localhost:9090/store/storeReport/fail");
			log.info("Request to KakaoPay: {}", parameters);
			
			HttpEntity<Map<String, String>> body = new HttpEntity<>(parameters, headers);
			
			return restTemplate.postForObject("https://open-api.kakaopay.com/online/v1/payment/ready",body,KakaoPayReadyDTO.class);
		    
		} catch (RestClientException e) {
			log.error("KakaoPay Error: ", e);
			throw new RuntimeException("카카오페이 결제 준비 실패", e);
		}
    }
}