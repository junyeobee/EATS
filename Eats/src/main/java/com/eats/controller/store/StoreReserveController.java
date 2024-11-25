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
		
		Map<String, Object> infoMap = new HashMap<>();
		infoMap.put("store_idx", store_idx);
		infoMap.put("todayDate", todayDate);
		infoMap.put("searching", searching);
		
		List<ReserveOkListDTO> rList = srs.getStoreReserveOkList(infoMap);
		
		Map<Integer, String> stateMap = new HashMap<>();
		Map<Integer, String> stateClass = new HashMap<>();
		for(ReserveOkListDTO dto:rList) {
			String state = "";
			String st_class="";
			if(dto.getReserve_state()==0){
				state="승인 대기";
				st_class="st_ready";
			} else if(dto.getReserve_state()==1){
				state="승인됨";
				st_class="st_apply";
			} else if(dto.getReserve_state()==2){
				state="취소됨";
				st_class="st_cancel";
			} else if(dto.getReserve_state()==3){
				state="방문 완료";
				st_class="st_visit";
			} else if(dto.getReserve_state()==4){
				state="노쇼";
				st_class="st_noshow";
			} 
			
			stateMap.put(dto.getReserve_idx(), state);
			stateClass.put(dto.getReserve_idx(), st_class);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("rList", rList);
		mv.addObject("stateMap", stateMap);
		mv.addObject("stateClass", stateClass);
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
