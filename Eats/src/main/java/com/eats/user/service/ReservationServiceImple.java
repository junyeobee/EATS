package com.eats.user.service;

import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.controller.store.SellController;
import com.eats.mapper.user.ReservationMapper;
import com.eats.user.model.AlarmDTO;
import com.eats.user.model.ReservationDTO;

@Service
public class ReservationServiceImple implements ReservationService {
	private static final Logger log = LoggerFactory.getLogger(ReservationServiceImple.class);
	@Autowired
	ReservationMapper mapper;
	
	@Override
	public Map<String, Object> reserveInfoMap(int store_idx) {
		
		Map<String,Object> reserveInfo=new HashMap<String, Object>();
		
		int max_people=mapper.getMaxPeopleCnt(store_idx);
		List runningDayList=mapper.getRunningDays(store_idx);
		
		reserveInfo.put("max_people_cnt", max_people);
		reserveInfo.put("running_day_list", runningDayList);
		
		return reserveInfo;
	}
	
	@Override
	public List<Map> getTimeListWithYN(int store_idx, String reserve_date, int reserve_cnt) {
		
		Map param=new HashMap<>();
		param.put("store_idx", store_idx);
		param.put("reserve_date",  reserve_date);
		param.put("reserve_cnt", reserve_cnt);
		List<Map> timeList = mapper.getTimeListWithYN(param);
		return timeList;
	}
	
	@Override
	public List<Map> getAvailableTable(int store_idx, String reserve_date, int reserve_cnt, String reserve_time) {
		
		Map param=new HashMap<>();
		param.put("store_idx", store_idx);
		param.put("reserve_date", reserve_date);
		param.put("reserve_cnt", reserve_cnt);
		param.put("reserve_time", reserve_time);
		
		List<Map> tableList=mapper.getAvailableTable(param);

		return tableList;
	}
	
	@Override
	public int makeReserve(ReservationDTO reservationDTO) {
		
		int result=mapper.makeReserve(reservationDTO);
		return result;
	}
	
	@Override
	public int getMinTableIdx(int store_idx, String reserve_date, int reserve_cnt, String reserve_time,
			String reserve_table) {
		
		Map param=new HashMap<>();
		param.put("store_idx", store_idx);
		param.put("reserve_date", reserve_date);
		param.put("reserve_count", reserve_cnt);
		param.put("reserve_time",  reserve_time);
		param.put("reserve_table", reserve_table);
		
		int minTableIdx = mapper.getMinTableIdx(param);
		
		return minTableIdx;
	}
	
	@Override
	public int sendAlarmRequest(AlarmDTO alarmDTO) {
		
		int result=mapper.sendAlarmRequest(alarmDTO);
		return result;
	}
	
	@Override
	public int checkAlarmExist(AlarmDTO alarmDTO) {
		
		int s_alarm_idx=mapper.checkAlarmExist(alarmDTO);
		return s_alarm_idx;
	}
}
