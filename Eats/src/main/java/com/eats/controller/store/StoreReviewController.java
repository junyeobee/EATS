package com.eats.controller.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class StoreReviewController {

	@GetMapping("/store/review")
	public ModelAndView reviewList(HttpSession session) {
		Integer store_idx = (Integer)session.getAttribute("storeIdx");
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("store/review/reviewList");
		return mv;
	}
}
