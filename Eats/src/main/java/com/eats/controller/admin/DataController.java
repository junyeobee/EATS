package com.eats.controller.admin;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eats.admin.model.SearchDTO;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.service.MainService;
import com.eats.user.service.SearchService;

@Controller
public class DataController {

	@Autowired
	private SearchService ss;
	@Autowired
	private MainService ms;
	
	@GetMapping("searchData")
	public ModelAndView searchData() {
		List<CateKeyDTO> keyList = ms.getCateKey();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("keyList", keyList);
		mv.setViewName("admin/attr/searchData");
		
		return mv;
	}

	@ResponseBody
	@PostMapping("searchData")
	public Map<String, Object> getData(int selectMonth) {	
		
		Map<String, String> dateMap = getSEdate(selectMonth);

		List<SearchDTO> dataList = ss.getSearchData(dateMap);
		List<CateKeyDTO> keyList = ms.getCateKey();

		 List<SearchDTO> srcList = ss.getSearchData(dateMap);
	        int src_count=0;
	        for(SearchDTO dto:srcList) {
	        	src_count+=dto.getSearch_count();
	        }

		Map<String, Object> map = new HashMap<>();
		map.put("dataList", dataList);
		map.put("keyList", keyList);
		map.put("selectMonth", selectMonth);
		map.put("first_date", dateMap.get("first_date"));
		map.put("last_date", dateMap.get("last_date"));
		map.put("before_date", dateMap.get("before_date"));
		map.put("src_count", src_count);
		
		return map;
	}
	
	@ResponseBody
	@GetMapping("tagData")
	public Map<String, Object> tagData(@RequestParam("selectTag") int  keyidx, int selectMonth) {
		List<String> valueList = ms.getValueList(keyidx);
		Map<String, String> dateMap = getSEdate(selectMonth);
		
		Map<String, Integer> countMap= ss.getSearchCountByTag(valueList, dateMap);
		
		Map<String, Object> map = new HashMap<>();
		map.put("valueList", valueList);
		map.put("countMap", countMap);
		map.put("before_date", dateMap.get("before_date"));
		map.put("last_date", dateMap.get("last_date"));
		map.put("keyidx", keyidx);
		
		return map;
	}
	
	public Map<String, String> getSEdate(int selectMonth) {
		LocalDateTime now = LocalDateTime.now();
		int now_year = now.getYear();
		
		YearMonth yearMonth = YearMonth.of(now_year, selectMonth);

        LocalDate last_day = yearMonth.atEndOfMonth();
		
        String first_date = now_year+"-"+(selectMonth<10?"0"+selectMonth:""+selectMonth)+"-01";
        String last_date = ""+last_day;
        String before_date = ""+(selectMonth<3?(now_year-1):now_year)+"-"+(selectMonth<10?"0"+selectMonth:""+selectMonth)+"-01";
		
        Map<String, String> dateMap = new HashMap<>();
		dateMap.put("first_date", first_date);
		dateMap.put("last_date", last_date);
		dateMap.put("before_date",before_date);
		
		return dateMap;
	}
}
