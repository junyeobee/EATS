package com.eats.store.service;

import java.util.List;

import com.eats.store.model.main.GenderCntDTO;
import com.eats.store.model.main.MonthCntDTO;
import com.eats.store.model.main.ReserveNoshowDTO;
import com.eats.store.model.main.ReserveReqDTO;
import com.eats.store.model.main.ReserveToTimeDTO;
import com.eats.store.model.main.ReserveWeekDTO;
import com.eats.store.model.main.SellTop3MenuDTO;
import com.eats.store.model.main.SelltwlwDTO;

public interface StoreMainService {
	public int dailySell(int store_idx);
	public int dailyReserve(int store_idx);
	public List<GenderCntDTO> gendercnt(int store_idx);
	public List<MonthCntDTO> monthResereve(int store_idx);
	public int reserveWaitingCnt(int store_idx);
	public ReserveNoshowDTO reserveNoshowOrCancel(int store_idx);
	public List<ReserveWeekDTO> reserveWeek(int store_idx);
	public List<ReserveToTimeDTO> reserveTimeSlotWithToday(int store_idx);
	public List<ReserveReqDTO> reserveReq(int store_idx);
	public SelltwlwDTO sellCompare(int store_idx);
	public List<SellTop3MenuDTO> sellTop3Menu(int store_idx);
}
