package com.eats.controller.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.reviewList.ReviewsListDTO;
import com.eats.store.service.StoreReviewListService;

import jakarta.servlet.http.HttpSession;

@Controller
public class StoreReviewController {
	
	@Autowired
	private StoreReviewListService service;
	
	@GetMapping("/store/review")
	public ModelAndView reviewList(HttpSession session) {
		Integer store_idx = (Integer)session.getAttribute("storeIdx");
		List<ReviewsListDTO> result = service.getReivewLists(store_idx);
		ModelAndView mv=new ModelAndView();
		mv.addObject("lists", result);
		mv.setViewName("store/review/reviewList");
		return mv;
	}
}
