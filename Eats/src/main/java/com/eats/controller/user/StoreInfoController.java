package com.eats.controller.user;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.HYStoreInfoDTO;
import com.eats.store.model.StoreTimeDTO;
import com.eats.store.service.StoreInfoService;

@Controller
public class StoreInfoController {
	
	@Autowired
	private StoreInfoService service;

	@GetMapping("/user/storeInfo")
	public ModelAndView goStoreInfo(
			@RequestParam(value="store_idx", required=true) int store_idx) {
		
		HYStoreInfoDTO storeTotalInfo = service.getStoreTotalInfo(store_idx);
		List<String> dayArr = (List<String>) Arrays.asList("월", "화", "수", "목", "금", "토", "일");
		
		//System.out.println(korToday);
		
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("storeTotalInfo", storeTotalInfo);
		mv.addObject("dayList", dayArr);
		mv.setViewName("user/storeDetail/storeInfo");
		
		return mv;
	}
	
	@GetMapping("/goHeader")
	public String header() {
		return "userHeader";
	}
}
