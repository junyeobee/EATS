package com.eats.controller.user;

import java.sql.Date;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.HYStoreInfoDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.model.ReservationDTO;
import com.eats.store.model.StoreTimeDTO;
import com.eats.store.service.StoreInfoService;
import com.eats.user.service.ReservationService;

import ch.qos.logback.classic.joran.ModelClassToModelHandlerLinker;
import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StoreInfoController {
	
	@Autowired
	private StoreInfoService service;
	
	@Autowired
	private ReservationService reserveService;

	@GetMapping("/user/storeInfo")
	public ModelAndView goStoreInfo(
			@RequestParam(value="store_idx", required=true) int store_idx,
			@RequestParam(value="reserve_date", required=false) String reserve_date,
			@RequestParam(value="reserve_time", required = false) String reserve_time,
			@RequestParam(value="reserve_count", required=false) String reserve_count,
			@RequestParam(value="reserve_table", required = false) String reserve_table,
			HttpSession session) {
		
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
		
		if(reserve_date !=null && reserve_date != "") {
			mv.addObject("reserve_date", reserve_date);
		}
		if(reserve_time != null && reserve_time != "") {
			mv.addObject("reserve_time", reserve_time);
		}
		if(reserve_count != null && reserve_count != "") {
			mv.addObject("reserve_count", reserve_count);
		}
		
		if(session.getAttribute("user_idx")!=null){
			Integer user_idx = (Integer)session.getAttribute("user_idx");
			boolean isJjimed=service.checkJjim(user_idx, store_idx);
			mv.addObject("isJjimed", isJjimed);
		}
		mv.setViewName("user/storeDetail/storeInfo");
		
		return mv;
	}
	
	@GetMapping("/user/getTimeList")
	@ResponseBody
	public List getTimeListWithYN(int store_idx, String reserve_date, int reserve_cnt) {
		
		List<Map> timeList=reserveService.getTimeListWithYN(store_idx, reserve_date, reserve_cnt);

		return timeList;
	}
	
	@GetMapping("/user/getTableList")
	@ResponseBody
	public List getTableList(int store_idx, String reserve_date, int reserve_cnt, String reserve_time) {
		List<Map> tableList=reserveService.getAvailableTable(store_idx, reserve_date, reserve_cnt, reserve_time);
		
		return tableList;
	}
	
	@GetMapping("/user/reserveConfirm")
	public ModelAndView reserveConfirm(int store_idx, String reserve_date, int reserve_cnt, String reserve_time, String reserve_table, HttpSession session) {
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("user_idx", session.getAttribute("user_idx"));
		mv.addObject("store_idx", store_idx);
		mv.addObject("reserve_date", reserve_date);
		mv.addObject("reserve_cnt", reserve_cnt);
		mv.addObject("reserve_time", reserve_time);
		mv.addObject("reserve_table", reserve_table);
		
		mv.setViewName("user/reserve/confirm");
		
		return mv;
	}
	
	@GetMapping("/user/makeReserve")
	public ModelAndView makeReserve(int store_idx, String reserve_date, int reserve_count, String reserve_time, String reserve_table, String request,  
			HttpSession session, HttpServletRequest req) {
		
		String callback=req.getHeader("Referer");
		
		Integer user_idx = (Integer)session.getAttribute("user_idx");
		
		ModelAndView mv=null;
		
		if(user_idx != null) {
			int minTableIdx=reserveService.getMinTableIdx(store_idx, reserve_date, reserve_count, reserve_time, reserve_table);
			
			Date reserve_date_d = Date.valueOf(reserve_date);
			ReservationDTO reservationDTO=new ReservationDTO(0, user_idx, store_idx, reserve_date_d, reserve_time, reserve_count, minTableIdx, request, 0, null);
			
			int result=reserveService.makeReserve(reservationDTO);
			
			if(result>0) {
				//예약 삽입 성공 로직 (매장에 문자 보내기)
				mv=new ModelAndView("redirect:/");
			}else {
				//예약 삽입 실패 로직 -> 에러 메시지
				mv=new ModelAndView("redirect:/"+callback);
			}
		}else {
			mv=new ModelAndView();
			mv.addObject("errorMsg", "잘못된 접근입니다.");
			mv.addObject("goTo", callback);
			mv.setViewName("user/myplate/error");
		}
		
		return mv;
	}
	
	@PostMapping("/user/insertJjim")
	@ResponseBody
	public int insertJjim(JjimDTO dto) {
		boolean result=service.insertJjim(dto);
		if(result) {
			int jjimCnt=service.getJjimCnt(dto.getStore_idx());
			return jjimCnt;
		}else {
			return -1;
		}
	}
	
	@PostMapping("/user/deleteJjim")
	@ResponseBody
	public int deleteJjim(JjimDTO dto) {
		
		boolean result=service.deleteJjim(dto);
		if(result) {
			int jjimCnt=service.getJjimCnt(dto.getStore_idx());
			return jjimCnt;
		}else {
			return -1;
		}
	}
	
	@GetMapping("/goHeader")
	public String header() {
		return "userHeader";
	}
}
