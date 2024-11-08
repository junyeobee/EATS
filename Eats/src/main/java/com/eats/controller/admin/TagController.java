package com.eats.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TagController {

	@GetMapping("tagPage")
	public String tagPage() {
		return "admin/attr/manageTag";
	}
}
