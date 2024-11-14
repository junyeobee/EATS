package com.eats.kakao;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.eats.kakao.model.KakaoPayApproveDTO;
import com.eats.kakao.model.KakaoPayReadyDTO;
import com.eats.mapper.store.GudokMapper;
import com.eats.store.model.GudokDTO;

@Service
public class KakaoPayService {
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private GudokMapper mapper;
	
	@Value("${kakaopay.cid}")
	private String cid;
	
	@Value("${kakaopay.admin.key}")
	private String adminKey;
	
	private static final String HOST = "https://kapi.kakao.com";
	
	public String readySubscription(GudokDTO gudok) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + adminKey);
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", cid);
		params.add("partner_order_id", gudok.getGudokIdx()+"");
		params.add("partner_user_id", gudok.getStoreIdx()+"");
		params.add("item_name", "구독 서비스");
		params.add("quantity", "1");
		params.add("total_amount", "0");
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:8080/kakao/success");
		params.add("cancel_url", "http://localhost:8080/kakao/cancel");
		params.add("fail_url", "http://localhost:8080/kakao/fail");
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<>(params, headers);
		
		KakaoPayReadyDTO response = restTemplate.postForObject(HOST + "/v1/payment/ready",
		body,
		KakaoPayReadyDTO.class);
		
		return response.getNext_redirect_pc_url();
	}
	
	public KakaoPayApproveDTO approveSubscription(String tid, String pgToken) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + adminKey);
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", cid);
		params.add("tid", tid);
		params.add("pg_token", pgToken);
		params.add("partner_order_id", "gudok_" + tid);
		params.add("partner_user_id", "store_" + tid);
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<>(params, headers);
		
		KakaoPayApproveDTO response = restTemplate.postForObject(HOST + "/v1/payment/approve", 
		body, 
		KakaoPayApproveDTO.class);
		
		return response;
	}
	
	public void updateNextPaymentDate(GudokDTO gudok) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(gudok.getGudokNextpay());
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		
		if (gudok.getGudokType() == 1) {
		cal.add(Calendar.MONTH, 1);
		} else {
		cal.add(Calendar.YEAR, 1);
		}
		
		gudok.setGudokNextpay(cal.getTime());
		mapper.updateNextPaymentDate(gudok);
	}
}