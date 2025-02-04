package com.eats.user.service;

import java.util.List;
import java.util.Map;

import com.eats.user.model.AlarmDTO;
import com.eats.user.model.PayDTO;
import com.eats.user.model.ReservationDTO;

public interface ReservationService {
	
	public Map<String, Object> reserveInfoMap(int store_idx);
	public List<Map> getTimeListWithYN(int store_idx, String reserve_date, int reserve_cnt);
	public List<Map> getAvailableTable(int store_idx, String reserve_date, int reserve_cnt, String reserve_time);
	public int makeReserve(ReservationDTO reservationDTO,PayDTO paydto);
	public int getMinTableIdx(int store_idx, String reserve_date, int reserve_cnt, String reserve_time, String reserve_table);
	public int sendAlarmRequest(AlarmDTO alarmDTO);
	public int checkAlarmExist(AlarmDTO alarmDTO);
}
