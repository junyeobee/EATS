package com.eats.user.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.eats.user.model.AlarmDTO;
import com.eats.user.model.ReservationDTO;

public interface MyplateService {

	public List<Map<String, BigDecimal>> getReserveCntByState(int user_idx);
	//public List<Map<String, Integer>> getDdayList(int user_idx);
	public List<Map> getReserveInfoList(int user_idx);
	public boolean checkReviewExist(int reserve_idx);
	public int getDday(int reserve_idx);
	public ReservationDTO getReserveInfo(int reserve_idx);
	public List<AlarmDTO> getAlarmList(int user_idx);
	public int checkWriter(int reserve_idx);
	public Map<String, Object> getRevInfo(int reserve_idx);
	public int cancelReserve(int reserve_idx);
	public List<ReservationDTO> reserveListCal(Map map);
	public List<AlarmDTO> alarmListCal(Map map);
}
