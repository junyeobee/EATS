package com.eats.controller.store;

import java.util.Calendar;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eats.store.model.report.WeekReservDTO;
import com.eats.store.service.StoreReportService;

import jakarta.servlet.http.HttpSession;

@Controller
public class StoreReportController {
	
	@Autowired
	private StoreReportService storeReportService;
	
	@GetMapping("/reportLoad")
	public String report() {
		return "store/storeReport/storeReport";
	}
	
	@GetMapping("/reportIsCreated")
	@ResponseBody
	public boolean reportIsCreated(HttpSession session) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		String thismonth = year + "/" + month;
		Map<String, String> map = new HashMap<String, String>();
		// int store_idx = (int)session.getAttribute("store_idx");
		int store_idx = 1;
		map.put("store_idx", store_idx+"");
		map.put("thismonth", thismonth);
		if(storeReportService.reportIsThere(map)) {
			return true;
		}
		return false;
	}
	
	@GetMapping("/weekreport")
	@ResponseBody()
	public List<WeekReservDTO> weekChart(){
		Map<String,String> map = new HashMap<String,String>();
		map.put("store_idx", 1+"");
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		String thismonth = year + "-" + month;
		System.out.println(thismonth);
		map.put("thismonth", thismonth);
		List<WeekReservDTO> lists = storeReportService.reservWeek(map);
		return lists;
	}
	
}
