package com.eats.kakao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.eats.kakao.model.KakaoUserDTO;
import com.eats.mapper.user.KakaoUserMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class KakaoService {

	@Value("${kakao.client.id}")
	private String clientId;
	
	@Value("${kakao.redirect.uri}")
	private String redirectUri;
	
	private final String KAKAO_TOKEN_URL="https://kauth.kakao.com/oauth/token";
	
	//카카오 로그인 url 반환
	public String getKakaoLoginUrl() {
		
		String kakaoLoginUrl="https://kauth.kakao.com/oauth/authorize?client_id="+clientId+"&redirect_uri="+redirectUri+"&response_type=code";
		return kakaoLoginUrl;
	}
	
	//엑세스 토큰 발급받기
	public String getAccessToken(String code) throws JsonProcessingException {
		//HTTP헤더 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//HTTP 바디 생성
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("grant_type", "authorization_code");
		body.add("client_id", clientId);
		body.add("redirect_uri", redirectUri);
		body.add("code", code);
		
		//HTTP 요청 보내기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(body, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, kakaoTokenRequest, String.class);

		//HTTP 응답 (JSON) -> 토큰 파싱
		String responseBody = response.getBody();
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonNode = objectMapper.readTree(responseBody);

		return jsonNode.get("access_token").asText();
	}
	
	//토큰으로 카카오 유저 정보 가져오기
	public KakaoUserDTO getKakaoInfo(String accessToken) throws JsonProcessingException {
		//HTTP 헤더 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer "+accessToken);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//HTTP 요청 보내기
		HttpEntity<MultiValueMap<String, String>> kakaoUserInfoReq = new HttpEntity<>(headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.GET, kakaoUserInfoReq, String.class);
		
		//responseBody에 있는 정보 보내기
		String responseBody = response.getBody();
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonNode = objectMapper.readTree(responseBody);
		
		Long id=jsonNode.get("id").asLong();
		String nickname=jsonNode.get("properties").get("nickname").asText();
		
		KakaoUserDTO kakaoUserDTO = new KakaoUserDTO(id, nickname);
		
		return kakaoUserDTO;
	}

}
