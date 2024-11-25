package com.eats.mapper.user;

import java.util.List;
import java.util.Map;

import com.eats.user.model.AlarmDTO;
import com.eats.user.model.ReservationDTO;

public interface ReservationMapper {

	public int getMaxPeopleCnt(int store_idx);
	public List getRunningDays(int store_idx);
	public List<Map> getTimeListWithYN(Map map);
	public List<Map> getAvailableTable(Map map);
	public int getMinTableIdx(Map map);
	public int makeReserve(ReservationDTO reservationDTO);
	public int sendAlarmRequest(AlarmDTO alarmDTO);
	public int checkAlarmExist(AlarmDTO alarmDTO);
}
