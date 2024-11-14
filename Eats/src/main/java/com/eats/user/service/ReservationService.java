package com.eats.user.service;

import java.util.List;
import java.util.Map;

public interface ReservationService {
	
	public Map<String, Object> reserveInfoMap(int store_idx);
	public List<Map> getTimeListWithYN(int store_idx, java.sql.Date reserve_date, int reserve_cnt);
}
