package com.eats.user.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.user.MyplateMapper;
import com.eats.user.model.AlarmDTO;
import com.eats.user.model.ReservationDTO;

@Service
public class MyplateServiceImple implements MyplateService {

	@Autowired
	private MyplateMapper mapper;
	
	@Override
	public List<Map<String, BigDecimal>> getReserveCntByState(int user_idx) {
		List<Map<String, BigDecimal>> reserveCnt = mapper.getTotalReserveCntByState(user_idx);
		return reserveCnt;
	}

	@Override
	public List<Map> getReserveInfoList(int user_idx) {
		
		List<Map> reserveInfoList = (List<Map>) mapper.getReserveInfoList(user_idx);
		return reserveInfoList;
	}

	@Override
	public boolean checkReviewExist(int reserve_idx) {
		
		boolean revExist = mapper.checkReviewExist(reserve_idx)>0? true:false; 
		return revExist;
	}
	
	@Override
	public int getDday(int reserve_idx) {
		
		int dDay=mapper.getDday(reserve_idx);
		return dDay;
	}
	
	@Override
	public ReservationDTO getReserveInfo(int reserve_idx) {
		
		ReservationDTO dto=mapper.getReserveInfoByreserve(reserve_idx);
		return dto;
	}
	
	@Override
	public List<AlarmDTO> getAlarmList(int user_idx) {
		
		List<AlarmDTO> alarmList = mapper.getAlarmList(user_idx);
		return alarmList;
	}
	
	@Override
	public int checkWriter(int reserve_idx) {
		int user_idx=mapper.checkWriter(reserve_idx);
		return user_idx;
	}
	
	@Override
	public Map<String, Object> getRevInfo(int reserve_idx) {
		Map<String, Object> map = mapper.getRevInfo(reserve_idx);
		return map;
	}
	
	@Override
	public int cancelReserve(int reserve_idx) {
		int result = mapper.cancelReserve(reserve_idx);
		return result;
	}
	
	@Override
	public List<ReservationDTO> reserveListCal(Map map) {
		List<ReservationDTO> reservlist=mapper.reserveListCal(map);
		return reservlist;
	}
	
	@Override
	public List<AlarmDTO> alarmListCal(Map map) {
		List<AlarmDTO> alarmlist = mapper.alarmListCal(map);
		return alarmlist;
	}
}
