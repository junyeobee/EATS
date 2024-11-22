package com.eats.controller.store;

import java.time.LocalDate;
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

import com.eats.store.model.ReserveOkListDTO;
import com.eats.store.service.StoreReserveService;

@Controller
public class StoreReserveController {
	
	@Autowired
	private StoreReserveService srs;

	@GetMapping("/store/reserveOkListPage")
	public ModelAndView reserveOkListPage(int store_idx,
			@RequestParam(required=false) String selectedDate,
			@RequestParam(required=false) String searching) {
		
		LocalDate today = LocalDate.now();
		String todayDate="";
		if(selectedDate==null || selectedDate.equals("")) {
			todayDate=""+today;
		} else {
			todayDate=selectedDate;
		}
		
//		if(searching!=null && !searching.equals("")) {
//			String regex = "^01(?:0|1|[6-9])-(?:\\d{3}|\\d{4})-\\d{4}$\r\n";
//			if(!searching.matches(regex)) {
//				System.out.println("d");
//			}
//		}
		
		Map<String, Object> infoMap = new HashMap<>();
		infoMap.put("store_idx", store_idx);
		infoMap.put("todayDate", todayDate);
		infoMap.put("searching", searching);
		
		List<ReserveOkListDTO> rList = srs.getStoreReserveOkList(infoMap);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("rList", rList);
		mv.setViewName("/store/reservation/reserveOkListPage");
		
		return mv;
	}
	
	@PostMapping("/store/selectThisList")
	@ResponseBody
	public Map<String, Object> seleteThisList(int reserve_idx){
		Map<String, Object> map = new HashMap<>();
		
		List<ReserveOkListDTO> list = srs.getStoreReserveOkListDetail(reserve_idx);
		map.put("dList", list);
		
		return map;
	}
}
