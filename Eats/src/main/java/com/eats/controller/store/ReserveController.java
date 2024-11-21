package com.eats.controller.store;

import java.sql.Date;
import java.text.DecimalFormat;
import java.time.DayOfWeek;
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
	   
	   // 매장 정보 가져오기
	   int storeIdx = (Integer)session.getAttribute("store_idx") == null ? 1 : (Integer)session.getAttribute("store_idx");
	   
	   // 현재 날짜/시간 정보
	   LocalDateTime now = LocalDateTime.now();
	   
	   // 요일 변환
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
	   
	   // 날짜 포맷팅 (yyyy-MM-dd)
	   DecimalFormat df = new DecimalFormat("00");
	   String dateStr = String.format("%d-%s-%s", 
	       now.getYear(),
	       df.format(now.getMonthValue()),
	       df.format(now.getDayOfMonth())
	   );
	   Date day = Date.valueOf(dateStr);
	   
	   // 현재 시간 30분 단위로 반올림
	   int roundedMin = ((now.getMinute() + 15) / 30) * 30;
	   int currentHour = now.getHour();
	   if (roundedMin == 60) {
	       roundedMin = 0;
	       currentHour++;
	   }
	   String currentTime = String.format("%02d:%02d", currentHour, roundedMin);
	   
	   // 매퍼 파라미터 설정
	   Map<String, Object> map = new HashMap<>();
	   map.put("storeIdx", storeIdx);
	   map.put("day", day+"");
	   map.put("time", currentTime);
	   map.put("stimeDay", todayChar);
	   
	   // 서비스 호출
	   List<TableDTO> tables = service.tables(map);
	   List<ReserveListDTO> lists = service.reserveList(map);
	   StoreTimeDTO timeInfo = service.storeTime(map);
	   
	   List<String> timeList = generateTimeList(timeInfo.getStime_start(),timeInfo.getStime_end(),timeInfo.getStime_break());
	   mv.addObject("timeList", timeList);
	   
	   // DTO 설정
	   ReservOkViewDTO dto = new ReservOkViewDTO();
	   dto.setTables(tables);
	   dto.setLists(lists);
	   
	   // ModelAndView 설정
	   mv.addObject("dto", dto);
	   mv.addObject("today", dateStr);
	   mv.addObject("currentTime", currentTime);
	   mv.addObject("timeInfo", timeInfo);
	   mv.setViewName("store/reservation/reserveOkPage");
	   
	   return mv;
	}

	// 시간 목록 생성 메소드
	private List<String> generateTimeList(String startTime, String endTime, String breakTime) {
	   List<String> timeList = new ArrayList<>();
	   
	   
       LocalTime time = LocalTime.parse(startTime);
       LocalTime end = LocalTime.parse(endTime);
       
       // 브레이크타임 파싱
       String[] breakTimes = breakTime.split("-");
       LocalTime break1 = LocalTime.parse(breakTimes[0]);
       LocalTime break2 = LocalTime.parse(breakTimes[1]);
       
       // 30분 단위로 시간 추가
       while (!time.isAfter(end)) {
           if (time.isBefore(break1) || time.isAfter(break2)) {
               timeList.add(time.format(DateTimeFormatter.ofPattern("HH:mm")));
           }
           time = time.plusMinutes(30);
       }
       
       return timeList;
	}
}
