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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.HYStoreInfoDTO;
import com.eats.store.model.StoreTimeDTO;
import com.eats.store.service.StoreInfoService;
import com.eats.user.service.ReservationService;

@Controller
public class StoreInfoController {
	
	@Autowired
	private StoreInfoService service;
	
	@Autowired
	private ReservationService reserveService;

	@GetMapping("/user/storeInfo")
	public ModelAndView goStoreInfo(
			@RequestParam(value="store_idx", required=true) int store_idx) {
		
		HYStoreInfoDTO storeTotalInfo = service.getStoreTotalInfo(store_idx);
		List<String> dayArr = (List<String>) Arrays.asList("월", "화", "수", "목", "금", "토", "일");
		
		HashMap<String, Object> reserveInfo=(HashMap<String, Object>) reserveService.reserveInfoMap(store_idx);
		
		ModelAndView mv=new ModelAndView();
		
		if(reserveInfo.get("max_people_cnt")!=null) {
			Integer max_people = (Integer)reserveInfo.get("max_people_cnt");
			mv.addObject("max_people_cnt", max_people);
		}
		List<String> runningDayList=(List<String>)reserveInfo.get("running_day_list");
		
		mv.addObject("storeTotalInfo", storeTotalInfo);
		mv.addObject("dayList", dayArr);
		mv.addObject("runningDayList", runningDayList);
		mv.setViewName("user/storeDetail/storeInfo");
		
		return mv;
	}
	
	@GetMapping("/user/getTimeList")
	@ResponseBody
	public List getTimeListWithYN(int store_idx, java.sql.Date reserve_date, int reserve_cnt) {
		
		List<Map> timeList=reserveService.getTimeListWithYN(store_idx, reserve_date, reserve_cnt);

		return timeList;
	}
	
	@GetMapping("/user/getTableList")
	@ResponseBody
	public List getTableList(int store_idx, java.sql.Date reserve_date, int reserve_cnt, String reserve_time) {
		
		List<Map> tableList=reserveService.getAvailableTable(store_idx, reserve_date, reserve_cnt, reserve_time);
		
		return tableList;
	}
	
	@GetMapping("/goHeader")
	public String header() {
		return "userHeader";
	}
}
