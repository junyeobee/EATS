package com.eats.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PaymentController {
	
	@GetMapping("/resPayment")
	public ModelAndView payment( @RequestParam(value="store_idx") String store_idx,
			  
			 @RequestParam(value="reserve_date") String reserve_date,
			 
			 @RequestParam(value="reserve_time") String reserve_time,
			  
			 @RequestParam(value="reserve_count") String reserve_count,
			 
			  @RequestParam(value="reserve_table") String reserve_table,
			 
			 @RequestParam(value="request", required=false) String request
			 
			) {
		
		

		ModelAndView mav = new ModelAndView();
		
	
		
		 mav.addObject("store_idx",store_idx);
		 mav.addObject("reserve_date",reserve_date);
		 mav.addObject("reserve_time",reserve_time);
		 mav.addObject("reserve_count",reserve_count);
		 mav.addObject("reserve_table",reserve_table);
		 mav.addObject("request",request);
		 
		
		mav.setViewName("user/payment/reservationPayment");
		
		return mav;
	}
	
	
	@GetMapping("/Payment")
	public ModelAndView paymentGo() {
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("user/payment/payment");
		
		return mav;
		
	}

}
