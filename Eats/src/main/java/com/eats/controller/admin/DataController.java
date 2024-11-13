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
		
		LocalDateTime now = LocalDateTime.now();
		int thisMonth = now.getMonthValue();
		int beforeMonth = thisMonth==1?12:thisMonth-1;
		int pastMonth = thisMonth<=2?thisMonth+10:thisMonth-2;
		
		Map<String,String> thisDate = getSEdate(thisMonth,false);
		Map<String,String> lastDate = getSEdate(pastMonth,thisMonth<=2?true:false);

		ModelAndView mv = new ModelAndView();
		mv.addObject("keyList", keyList);
		mv.addObject("thisMonth", thisMonth);
		mv.addObject("thisDate",thisDate);
		mv.addObject("beforeMonth",beforeMonth);
		mv.addObject("pastMonth",pastMonth);
		mv.addObject("lastDate", lastDate);
		mv.setViewName("admin/attr/searchData");

		return mv;
	}

	@ResponseBody
	@PostMapping("MonthData")
	public Map<String, Object> getMonthData(int selectMonth) {
		Map<String, String> dateMap = getSEdate(selectMonth,false);

		List<SearchDTO> dataList = ss.getSearchData(dateMap);
		List<CateKeyDTO> keyList = ms.getCateKey();

		List<SearchDTO> srcList = ss.getSearchData(dateMap);
		int src_count = 0;
		for (SearchDTO dto : srcList) {
			src_count += dto.getSearch_count();
		}

		Map<String, Object> map = new HashMap<>();
		map.put("dataList", dataList);
		map.put("keyList", keyList);
		map.put("selectMonth", selectMonth);
		map.put("first_date", dateMap.get("first_date"));
		map.put("last_date", dateMap.get("last_date"));
		map.put("src_count", src_count);

		return map;
	}

	@ResponseBody
	@GetMapping("tagData")
	public Map<String, Object> gettagData(@RequestParam("selectTag") int keyidx, int selectMonth) {
		List<String> valueList = ms.getValueList(keyidx);
		Map<String, String> firstDate = getSEdate(selectMonth,false);
		Map<String, String> beforeDate = getSEdate((selectMonth<2?selectMonth+11:selectMonth-1), selectMonth<2?true:false);
		Map<String, String> pastDate = getSEdate((selectMonth<3?selectMonth+10:selectMonth-2),selectMonth<3?true:false);
		
		Map<String, Integer> countMap3= ss.getSearchCountByTag(valueList, firstDate);
		Map<String, Integer> countMap2= ss.getSearchCountByTag(valueList, beforeDate);
		Map<String, Integer> countMap1= ss.getSearchCountByTag(valueList, pastDate);

		Map<String, Object> map = new HashMap<>();
		map.put("valueList", valueList);
		map.put("countMap1", countMap1);
		map.put("countMap2", countMap2);
		map.put("countMap3", countMap3);
		map.put("first_date", pastDate.get("first_date"));
		map.put("last_date", firstDate.get("last_date"));
		map.put("selectMonth", selectMonth);
		map.put("keyidx", keyidx);

		return map;
	}

	public Map<String, String> getSEdate(int selectMonth,boolean otheryear) {
		LocalDateTime now = LocalDateTime.now();
		int now_year = otheryear==true?now.getYear()-1:now.getYear();

		YearMonth yearMonth = YearMonth.of(now_year, selectMonth);
		LocalDate last_day = yearMonth.atEndOfMonth();

		String first_date = now_year + "-" + (selectMonth < 10 ? "0" + selectMonth : "" + selectMonth) + "-01";
		String last_date = "" + last_day;

		Map<String, String> dateMap = new HashMap<>();
		dateMap.put("first_date", first_date);
		dateMap.put("last_date", last_date);
		
		return dateMap;
	}
}
