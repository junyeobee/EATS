package com.eats.user.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.user.ReservationMapper;

@Service
public class ReservationServiceImple implements ReservationService {

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
	public List<Map> getTimeListWithYN(int store_idx, java.sql.Date reserve_date, int reserve_cnt) {
		
		Map param=new HashMap<>();
		param.put("store_idx", store_idx);
		param.put("reserve_date",  reserve_date);
		param.put("reserve_cnt", reserve_cnt);
		
		List<Map> timeList = mapper.getTimeListWithYN(param);
		
		return timeList;
	}
	
	@Override
	public List<Map> getAvailableTable(int store_idx, Date reserve_date, int reserve_cnt, String reserve_time) {
		
		Map param=new HashMap<>();
		param.put("store_idx", store_idx);
		param.put("reserve_date", reserve_date);
		param.put("reserve_cnt", reserve_cnt);
		param.put("reserve_time", reserve_time);
		
		List<Map> tableList=mapper.getAvailableTable(param);

		return tableList;
	}
}
