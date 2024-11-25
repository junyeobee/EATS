package com.eats.mapper.user;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.eats.user.model.AlarmDTO;
import com.eats.user.model.ReservationDTO;

public interface MyplateMapper {
	
	public List<Map<String, BigDecimal>> getTotalReserveCntByState(int user_idx); //예약상태별 예약 개수
	//public List<Map<String, Integer>> getDdayList(int user_idx);
	public List<Map> getReserveInfoList(int user_idx);
	public int checkReviewExist(int reserve_idx);
	public int getDday(int reserve_idx);
	public ReservationDTO getReserveInfoByreserve(int reserve_idx);
	public List<AlarmDTO> getAlarmList(int user_idx);
	public int checkWriter(int reserve_idx);
	public Map<String, Object> getRevInfo(int reserve_idx);
	public int cancelReserve(int reserve_idx);
	public List<ReservationDTO> reserveListCal(Map map);
	public List<AlarmDTO> alarmListCal(Map map);
}
