package com.eats.controller.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.service.StoreLoginService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class StoreLoginController {
	
	@Autowired
	private StoreLoginService service;

	@GetMapping("/storeLogin")
	public String storeLoginMain(){
		
		return "store/login/storeLogin";
			
	}
	
	@PostMapping("/storeLogin")
	public ModelAndView storeLoginSubmit(
			@RequestParam(value="storeId", required=true)String storeId,
			@RequestParam(value="storePwd", required=true)String storePwd,
			HttpSession session, 
			HttpServletResponse resp) {
		
		ModelAndView mav= new ModelAndView();
		
		int result= service.storeLogin(storeId, storePwd);
		
		String msg = "";

		if(result==3) {
			msg="로그인 성공";
			mav.setViewName("store/login/storeLoginMsg");
			mav.addObject("goUrl","storeLogin");
		}else {
			
			msg="아이디 또는 비밀번호를 확인하세요.";
			mav.setViewName("store/login/storeLoginMsg");
			mav.addObject("goUrl","storeLogin");
		}
		
		mav.addObject("msg",msg);
		
		
		return mav;
		
	}
	
	
} 
