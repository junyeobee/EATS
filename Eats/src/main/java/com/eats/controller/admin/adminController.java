package com.eats.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class adminController {

	@GetMapping("/adminLogin")
	public String openadminLogin() {
		
		return "admin/login/adminLogin";
	}
}
