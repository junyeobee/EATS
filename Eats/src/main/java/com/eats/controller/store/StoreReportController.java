package com.eats.controller.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StoreReportController {
	
	
	@GetMapping("/reportLoad")
	public String report() {
		return "store/storeReport/storeReport";
	}
	
	@GetMapping("/reportIsCreated")
	@ResponseBody
	public boolean reportIsCreated() {
		System.out.println("호출");
		return false;
	}
	
}
