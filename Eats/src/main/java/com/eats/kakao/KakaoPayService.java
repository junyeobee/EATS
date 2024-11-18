package com.eats.kakao;


import java.time.LocalDate;
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

import com.eats.kakao.model.KakaoPayApproveDTO;
import com.eats.kakao.model.KakaoPayCancelDTO;
import com.eats.kakao.model.KakaoPayReadyDTO;
import com.eats.mapper.store.GudokMapper;

@Service
public class KakaoPayService {
    private static final Logger log = LoggerFactory.getLogger(KakaoPayService.class);
    
    @Value("${kakaopay.admin.key}")
    private String adminKey;
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Autowired
    private GudokMapper mapper;
    
    public KakaoPayReadyDTO readyForPayment(String orderId, String userId) {
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "SECRET_KEY " + adminKey);
			headers.add("Content-Type", "application/json");
	    
			Map<String, String> parameters = new HashMap<>();
	    	parameters.put("cid", "TCSUBSCRIP");
			parameters.put("partner_order_id", orderId);
			parameters.put("partner_user_id", userId);
			parameters.put("item_name", "잇츠 프리미엄 구독");
			parameters.put("quantity", "1");
			parameters.put("total_amount", "11900");
			parameters.put("tax_free_amount", "0");
			parameters.put("approval_url", "http://localhost:9090/store/storeReport/success");
			parameters.put("cancel_url", "http://localhost:9090/store/storeReport/cancel");
			parameters.put("fail_url", "http://localhost:9090/store/storeReport/fail");
			log.info("Request to KakaoPay: {}", parameters);
			
			HttpEntity<Map<String, String>> body = new HttpEntity<>(parameters, headers);
			
			return restTemplate.postForObject("https://open-api.kakaopay.com/online/v1/payment/ready", body, KakaoPayReadyDTO.class);
		    
		} catch (RestClientException e) {
			log.error("KakaoPay Error: ", e);
			throw new RuntimeException("카카오페이 결제 준비 실패", e);
		}
    }
    
    public KakaoPayApproveDTO approvePayment(String pgToken, String tid, String orderId, String userId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "SECRET_KEY " + adminKey);
        headers.add("Content-Type", "application/json");

        Map<String, String> params = new HashMap<>();
        params.put("cid", "TCSUBSCRIP");
        params.put("tid", tid);
        params.put("partner_order_id", orderId);
        params.put("partner_user_id", userId);
        params.put("pg_token", pgToken);

        HttpEntity<Map<String, String>> body = new HttpEntity<>(params, headers);
        return restTemplate.postForObject("https://open-api.kakaopay.com/online/v1/payment/approve", body, KakaoPayApproveDTO.class);
    }
    
    public void saveSubscription(String sid, int storeIdx, String tid) {
        Map<String, Object> params = new HashMap<>();
        params.put("storeIdx", storeIdx);
        params.put("billingKey", sid);
        params.put("nextPayDate", LocalDate.now().plusMonths(1));
        params.put("endDate", LocalDate.now().plusYears(1));
        params.put("gudokType", 1);
        params.put("tid", tid);
        mapper.insertSubscription(params);
    }
    
    public KakaoPayCancelDTO cancelPayment(String tid) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "SECRET_KEY " + adminKey);
        headers.add("Content-Type", "application/json");

        Map<String, Object> params = new HashMap<>();
        params.put("cid", "TCSUBSCRIP");
        params.put("tid", tid);
        params.put("cancel_amount", 2200);
        params.put("cancel_tax_free_amount", 0);

        HttpEntity<Map<String, Object>> body = new HttpEntity<>(params, headers);
        
        return restTemplate.postForObject(
            "https://open-api.kakaopay.com/online/v1/payment/cancel",
            body,
            KakaoPayCancelDTO.class
        );
    }
}