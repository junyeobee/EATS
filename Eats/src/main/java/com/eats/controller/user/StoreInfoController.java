package com.eats.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StoreInfoController {

	@GetMapping("/user/storeInfo")
	public String goStoreInfo(
			@RequestParam int store_idx) {
		
		return "/user/storeDetail/storeInfo";
	}
}
