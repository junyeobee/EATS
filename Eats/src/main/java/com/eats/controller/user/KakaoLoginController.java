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
		String accessToken = "";
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
		
		String redirect="";
		if(kakaoUserDTO!=null) { //카카오 로그인 성공
			//1. 이미 카카오로 로그인한 적이 있을 때 -> session 저장
			//2. 로그인한 적이 없을 때 -> DB 저장 & session 저장
			long kakaoId=kakaoUserDTO.getId();
			String kakaoIdStr=String.valueOf(kakaoId);
			String nickname=kakaoUserDTO.getNickname();
			
			EatsUserDTO userDTO=kLoginService.checkUserIdx(kakaoIdStr);
			
			if(userDTO==null) {
				//DB 저장 & session 저장
				int insertIdx=kLoginService.insertUserAndProfile(kakaoUserDTO);
				if(insertIdx > 0) {
					//session 저장
					session.setAttribute("user_idx", insertIdx);
					session.setAttribute("user_nickname", nickname);
					redirect="/";
				}else {
					//삽입 실패
					redirect="/user/login";
				}
			}else {
				//세션 저장
				int userIdx=userDTO.getUser_idx();
				session.setAttribute("user_idx", userIdx);
				session.setAttribute("user_nickname", nickname);
				redirect="/";
			}
		}else { //카카오로그인 실패
			redirect="/user/login"; //다시 로그인 페이지로
		}
		
		return "redirect:"+redirect;
	}
}
