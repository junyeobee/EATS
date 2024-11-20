package com.eats.controller.store;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eats.store.model.reserve.TableDTO;
import com.eats.store.service.ReserveService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReserveController {
	@Autowired
	private ReserveService service;
	
	@GetMapping("/suminbabo")
	@ResponseBody
	public List<TableDTO> getTables(HttpServletRequest req){
		HttpSession session = req.getSession();
		int storeIdx = (Integer)session.getAttribute("store_idx") == null ? 1 : (Integer)session.getAttribute("store_idx");
		LocalDateTime now =	LocalDateTime.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		int today = now.getDayOfMonth();
		
		
		Date day = Date.valueOf(year+"-"+month+"-"+today);
		
		int hour = now.getHour();
		int min = now.getMinute();
		Map map = new HashMap<>();
		map.put("storeIdx", storeIdx);
		map.put("day", day);
		map.put("time", hour+":"+min);
		List<TableDTO> lists = service.tables(map);
		return lists;
	}
}
