package com.eats.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.user.model.PayDTO;
import com.eats.user.service.PayService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {
	@Autowired
	PayService service;
	
	@GetMapping("/resPayment")
	public ModelAndView payment( 
			@RequestParam(value="store_idx") int store_idx,
			 @RequestParam(value="reserve_date") String reserve_date,
			 @RequestParam(value="reserve_time") String reserve_time,
			 @RequestParam(value="reserve_count") int reserve_count,
			 @RequestParam(value="reserve_table") String reserve_table,
			 @RequestParam(value="request", required=false) String request,
			 HttpSession session) {

		int user_idx=(int)session.getAttribute("user_idx"); // 확인하기
		ModelAndView mav = new ModelAndView();
		
		session.setAttribute("store_idx", store_idx);
		session.setAttribute("reserve_date",reserve_date);
		session.setAttribute("reserve_time",reserve_time);
		session.setAttribute("reserve_count",reserve_count);
		session.setAttribute("reserve_table",reserve_table);
		session.setAttribute("request",request.trim());

		PayDTO dto = service.storeInfo(user_idx,store_idx);
		
		mav.addObject("dto",dto);
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
