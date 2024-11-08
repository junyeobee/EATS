package com.eats.controller.user;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.eats.kakao.KakaoService;
import com.eats.kakao.model.KakaoUserDTO;
import com.eats.user.model.EatsUserDTO;
import com.eats.user.service.KakaoLoginService;
import com.fasterxml.jackson.core.JsonProcessingException;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class KakaoLoginController {
	
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	private KakaoLoginService kLoginService;

	@GetMapping("/user/kakaoLogin")
	public void goKakaoLogin(HttpServletResponse response) throws IOException {
		String url=kakaoService.getKakaoLoginUrl();
		response.sendRedirect(url);
	}
	
	@GetMapping("/user/kakao/callback")
	public String kakaoCallback(String code, HttpSession session) {
		System.out.println("callback");
		String accessToken = "";
		System.out.println(code);
		try {
			accessToken=kakaoService.getAccessToken(code);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		KakaoUserDTO kakaoUserDTO = null;
		
		try {
			kakaoUserDTO = kakaoService.getKakaoInfo(accessToken);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		System.out.println("id="+kakaoUserDTO.getId()+"nickname="+kakaoUserDTO.getNickname());
		
		if(kakaoUserDTO!=null) {
			//DB저장 or session 저장 로직
			long kakaoId=kakaoUserDTO.getId();
			String kakaoIdStr=String.valueOf(kakaoId);
			String nickname=kakaoUserDTO.getNickname();
			
			EatsUserDTO userDTO=kLoginService.checkUserIdx(kakaoIdStr);
			
			if(userDTO==null) {
				//DB 저장
				int insertUserResult=kLoginService.insertKakaoUser(kakaoUserDTO);
				int insertProfileResult=kLoginService.insertUserProfile(null);
			}else {
				//세션 저장
				int userIdx=userDTO.getUser_idx();
				
			}
			
			//1. 이미 카카오로 로그인한 적이 있을 때 -> session저장
			
			//2. 로그인한 적이 없을 때 -> DB 저장
		}
		return "redirect:/";
	}
}
