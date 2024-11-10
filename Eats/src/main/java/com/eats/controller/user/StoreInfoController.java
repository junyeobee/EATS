package com.eats.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.HYStoreInfoDTO;
import com.eats.store.service.StoreInfoService;

@Controller
public class StoreInfoController {
	
	@Autowired
	private StoreInfoService service;

	@GetMapping("/user/storeInfo")
	public ModelAndView goStoreInfo(
			@RequestParam(value="store_idx", required=true) int store_idx) {
		
		HYStoreInfoDTO storeTotalInfo = service.getStoreTotalInfo(store_idx);
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("storeTotalInfo", storeTotalInfo);
		mv.setViewName("user/storeDetail/storeInfo");
		
		return mv;
	}
}
