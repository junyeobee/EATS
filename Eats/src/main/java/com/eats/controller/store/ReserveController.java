package com.eats.controller.store;

import java.sql.Date;
import java.text.DecimalFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.reserve.StoreTimeDTO;
import com.eats.store.model.reserve.ReservOkViewDTO;
import com.eats.store.model.reserve.ReserveListDTO;
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
	public ModelAndView getTables(HttpServletRequest req) {
	   ModelAndView mv = new ModelAndView();
	   HttpSession session = req.getSession();
	   
	   int storeIdx = (Integer)session.getAttribute("store_idx") == null ? 1 : (Integer)session.getAttribute("store_idx");
	   
	   LocalDateTime now = LocalDateTime.now();
	   
	   DayOfWeek dayOfWeek = now.getDayOfWeek();
	   String todayChar = switch(dayOfWeek) {
	       case MONDAY -> "월";
	       case TUESDAY -> "화";
	       case WEDNESDAY -> "수";
	       case THURSDAY -> "목";
	       case FRIDAY -> "금";
	       case SATURDAY -> "토";
	       case SUNDAY -> "일";
	   };
	   
	   DecimalFormat df = new DecimalFormat("00");
	   String dateStr = String.format("%d-%s-%s", 
	       now.getYear(),
	       df.format(now.getMonthValue()),
	       df.format(now.getDayOfMonth())
	   );
	   Date day = Date.valueOf(dateStr);
	   
	   int roundedMin = ((now.getMinute() + 15) / 30) * 30;
	   int currentHour = now.getHour();
	   if (roundedMin == 60) {
	       roundedMin = 0;
	       currentHour++;
	   }
	   String currentTime = String.format("%02d:%02d", currentHour, roundedMin);
	   
	   Map<String, Object> map = new HashMap<>();
	   map.put("storeIdx", storeIdx);
	   map.put("day", day+"");
	   map.put("time", currentTime);
	   map.put("stimeDay", todayChar);
	   
	   List<TableDTO> tables = service.tables(map);
	   List<ReserveListDTO> lists = service.reserveList(map);
	   StoreTimeDTO timeInfo = service.storeTime(map);
	   
	   List<String> timeList = generateTimeList(timeInfo.getStime_start(),timeInfo.getStime_end(),timeInfo.getStime_break());
	   mv.addObject("timeList", timeList);
	   
	   ReservOkViewDTO dto = new ReservOkViewDTO();
	   dto.setTables(tables);
	   dto.setLists(lists);
	   
	   mv.addObject("dto", dto);
	   mv.addObject("today", dateStr);
	   mv.addObject("currentTime", currentTime);
	   mv.addObject("timeInfo", timeInfo);
	   mv.setViewName("store/reservation/reserveOkPage");
	   
	   return mv;
	}

	private List<String> generateTimeList(String startTime, String endTime, String breakTime) {
		List<String> timeList = new ArrayList<>();


		LocalTime time = LocalTime.parse(startTime);
		LocalTime end = LocalTime.parse(endTime);

		String[] breakTimes = breakTime.split("-");
		LocalTime break1 = LocalTime.parse(breakTimes[0]);
		LocalTime break2 = LocalTime.parse(breakTimes[1]);
		break2 = break2.plusMinutes(-30); //브레이크 타임 끝 시간부터
		end = end.plusHours(-1); //마감 1시간전까지
		while (!time.isAfter(end)) {
			if (time.isBefore(break1) || time.isAfter(break2)) {
				timeList.add(time.format(DateTimeFormatter.ofPattern("HH:mm")));
			}
			time = time.plusMinutes(30);
		}

		return timeList;
	}

	@GetMapping("/reserveDateInTime")
	@ResponseBody
	public List<String> getTimeListOfDate(HttpServletRequest req, String date) {
		HttpSession session = req.getSession();
		LocalDate localDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		DayOfWeek dayOfWeek = localDate.getDayOfWeek();
		String todayChar = switch(dayOfWeek) {
			case MONDAY -> "월";
			case TUESDAY -> "화";
			case WEDNESDAY -> "수";
			case THURSDAY -> "목";
			case FRIDAY -> "금";
			case SATURDAY -> "토";
			case SUNDAY -> "일";
		};
		int storeIdx = session.getAttribute("store_idx") == null ? 1 : (Integer)session.getAttribute("store_idx");
		Map<String, Object> map = new HashMap<>();
		map.put("storeIdx", storeIdx);
		map.put("stimeDay", todayChar);
		StoreTimeDTO timeInfo = service.storeTime(map);
		if(timeInfo == null) {
			List<String> emptyList = new ArrayList<>();
			emptyList.add("휴업일이거나 설정되지 않았습니다.");
			return emptyList;
		}
		List<String> timeList = generateTimeList(timeInfo.getStime_start(),timeInfo.getStime_end(),timeInfo.getStime_break());
		return timeList;
	}

	@GetMapping("/reservations")
	@ResponseBody
	public ReservOkViewDTO getReservations(HttpServletRequest req, String date, String time) {
		HttpSession session = req.getSession();
		int storeIdx = session.getAttribute("store_idx") == null ? 1 : (Integer)session.getAttribute("store_idx");
		Map<String, Object> map = new HashMap<>();
		map.put("storeIdx", storeIdx);
		map.put("day", date);
		map.put("time", time);
		List<ReserveListDTO> lists = service.reserveList(map);
		
	   	List<TableDTO> tables = service.tables(map);
		ReservOkViewDTO dto = new ReservOkViewDTO();
		dto.setTables(tables);
		dto.setLists(lists);
		return dto;
	}

	@GetMapping("/assign")
	@ResponseBody
	public Map<String, Integer> assignTable(HttpServletRequest req, int tableNum, int reserveIdx) {
		HttpSession session = req.getSession();
		int storeIdx = session.getAttribute("store_idx") == null ? 1 : (Integer)session.getAttribute("store_idx");
		Map<String, Object> map = new HashMap<>();
		map.put("storeIdx", storeIdx);
		map.put("reserveIdx", reserveIdx);
		map.put("tableNum", tableNum);
		int result = service.assignTable(map);
		System.out.println(result);
		Map<String, Integer> response = new HashMap<>();
    	response.put("result", result);
		return response;
	}

}
