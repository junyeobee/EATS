package com.eats.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPlateController {

	@GetMapping("/user/writeReview")
	public String goWriteReview() {
		return "user/myplate/writeReview";
	}
}
