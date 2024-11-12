package com.eats.controller.admin;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.eats.admin.model.SearchDTO;
import com.eats.user.service.SearchService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
public class DataController {

	@Autowired
	private SearchService ss;
	
	@GetMapping("searchData")
	public ModelAndView searchData() {
		List<String> keyList = ss.getAllCateKeyName();
		
		LocalDateTime now = LocalDateTime.now();

		int now_year = now.getYear();
		int now_month_i = now.getMonthValue();
		String now_month = now.getMonthValue()<10?"0"+now.getMonthValue():""+now.getMonthValue();

		YearMonth yearMonth = YearMonth.of(now_year, now_month_i);

		String first_day = now_year+"-"+now_month+"-01";
        String last_day = yearMonth.atEndOfMonth().toString();
        
        Map<String, String> dateMap = new HashMap<>();
		dateMap.put("now_date", first_day);
		dateMap.put("next_date", last_day);
        
        List<SearchDTO> srcList = ss.getSearchData(dateMap);
        int src_count=0;
        for(SearchDTO dto:srcList) {
        	src_count+=dto.getSearch_count();
        }

		ModelAndView mv = new ModelAndView();
		
		mv.addObject("keyList", keyList);
		mv.addObject("first_day", first_day);
		mv.addObject("last_day", last_day);
		mv.addObject("src_count", src_count);
		mv.setViewName("admin/attr/searchData");
		
		return mv;
	}

	@ResponseBody
	@PostMapping("searchData")
	public Map<String, Object> getData(int selectMonth) {	
		LocalDateTime now = LocalDateTime.now();
		int now_year = now.getYear();

		YearMonth yearMonth = YearMonth.of(now_year, selectMonth);

        LocalDate last_day = yearMonth.atEndOfMonth();
		
        String now_date = now_year+"-"+(selectMonth<10?"0"+selectMonth:""+selectMonth)+"-01";
        String next_date = ""+last_day;

		Map<String, String> dateMap = new HashMap<>();
		dateMap.put("now_date", now_date);
		dateMap.put("next_date", next_date);

		List<SearchDTO> dataList = ss.getSearchData(dateMap);
		List<String> keyList = ss.getAllCateKeyName();

		Map<String, Object> map = new HashMap<>();
		map.put("dataList", dataList);
		map.put("keyList", keyList);
		map.put("selectMonth", selectMonth);
		map.put("now_date", now_date);
		map.put("next_date", next_date);

		return map;
	}
}
