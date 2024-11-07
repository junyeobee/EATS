package com.eats.controller.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreReportController {
	
	@GetMapping("/reportLoad")
	public String report() {
		return "store/storeReport/storeReport";
	}
}
