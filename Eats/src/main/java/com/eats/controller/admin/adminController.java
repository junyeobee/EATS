package com.eats.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class adminController {

	@GetMapping("/adminLogin")
	public String openadminLogin() {
		
		return "admin/login/adminLogin";
	}
	
	@PostMapping("/adminLogin")
	public ModelAndView adminLogin(
			@RequestParam String userId,
			@RequestParam String userPwd,
			HttpSession hs, HttpServletResponse resp) {
		
		ModelAndView mv = new ModelAndView();
		return mv;
	}
}
