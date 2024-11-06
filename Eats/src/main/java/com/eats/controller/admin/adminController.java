package com.eats.controller.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.admin.service.AdminLoginService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class adminController {

	@Autowired AdminLoginService adminservice;
	
	@GetMapping("/adminLogin")
	public String openadminLogin() {
		
		return "admin/login/adminLogin";
	}
	
	@PostMapping("/adminLogin")
	public ModelAndView adminLogin(
			@RequestParam String userId,
			@RequestParam String userPwd,
			HttpSession hs, HttpServletResponse resp) {
		
		int result = adminservice.loginAuth(userId, userPwd);
		
		ModelAndView mv = new ModelAndView();
		
		if(result==3) {
			int adminidx = adminservice.getAdmin(userId);
			hs.setAttribute("admin_idx", adminidx);
			
		}
		return mv;
	}
}
