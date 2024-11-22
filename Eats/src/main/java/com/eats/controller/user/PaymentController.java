package com.eats.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {
	
	@GetMapping("/resPayment")
	public String payment() {
		
		return "user/payment/reservationPayment";
	}
	

}
