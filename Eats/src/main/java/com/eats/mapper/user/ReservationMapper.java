package com.eats.mapper.user;

import java.util.List;
import java.util.Map;

public interface ReservationMapper {

	public int getMaxPeopleCnt(int store_idx);
	public List getRunningDays(int store_idx);
	public List<Map> getTimeListWithYN(Map map);
}
