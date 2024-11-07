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
			@RequestParam String adminId,
			@RequestParam String adminPwd,
			HttpSession hs, HttpServletResponse resp) {
		
		int result = adminservice.loginAuth(adminId, adminPwd);
		
		ModelAndView mv = new ModelAndView();
		
		if(result==3) {
			int adminidx = adminservice.getAdmin(adminId);
			// System.out.println(adminidx);
			hs.setAttribute("admin_idx", adminidx);
			mv.addObject("msg", "환영합니다!");
			// 이부분 관리자 메인으로 수정하기!
			mv.addObject("url", "/");
			mv.setViewName("admin/login/adminMsg");
		}else if(result==1) {
			mv.addObject("msg", "고객센터로 문의해주세요.");
			mv.addObject("url", "adminLogin");
			mv.setViewName("admin/login/adminMsg");
		}else {
			mv.addObject("msg", "아이디 또는 비밀번호를 확인해주세요.");
			mv.addObject("url", "adminLogin");
			mv.setViewName("admin/login/adminMsg");
		}
		
		return mv;
	}
	
	@GetMapping("/adminLogout")
	public String adminLogout(HttpSession hs) {
		hs.invalidate();
		
		// 이부분 관리자 메인으로 수정하기!
		return "redirect:/";
	}
	
}
