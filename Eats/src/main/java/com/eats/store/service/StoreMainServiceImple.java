package com.eats.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.StoreMainMapper;
import com.eats.store.model.main.GenderCntDTO;
import com.eats.store.model.main.MonthCntDTO;
import com.eats.store.model.main.ReserveNoshowDTO;
import com.eats.store.model.main.ReserveReqDTO;
import com.eats.store.model.main.ReserveToTimeDTO;
import com.eats.store.model.main.ReserveWeekDTO;
import com.eats.store.model.main.SellTop3MenuDTO;
import com.eats.store.model.main.SelltwlwDTO;

@Service
public class StoreMainServiceImple implements StoreMainService {
	
	@Autowired
	private StoreMainMapper mapper;
	
	@Override
	public int dailySell(int store_idx) {
		Integer result = mapper.dailySell(store_idx);
		int rlt = result == null ? 0 : result;
		return rlt;
	}
	
	@Override
	public int dailyReserve(int store_idx) {
		Integer result = mapper.dailyReserve(store_idx);
		int rlt = result == null ? 0 : result;
		return rlt;
	}
	
	@Override
	public List<GenderCntDTO> gendercnt(int store_idx) {
		List<GenderCntDTO> result = mapper.gendercnt(store_idx);
		return result;
	}
	@Override
	public List<MonthCntDTO> monthResereve(int store_idx) {
		List<MonthCntDTO> dto = mapper.monthResereve(store_idx);
		return dto;
	}
	@Override
	public ReserveNoshowDTO reserveNoshowOrCancel(int store_idx) {
		ReserveNoshowDTO dto = mapper.reserveNoshowOrCancel(store_idx);
		return dto;
	}
	
	@Override
	public List<ReserveReqDTO> reserveReq(int store_idx) {
		List<ReserveReqDTO> result = mapper.reserveReq(store_idx);
		return result;
	}
	
	@Override
	public List<ReserveToTimeDTO> reserveTimeSlotWithToday(int store_idx) {
		List<ReserveToTimeDTO> result = mapper.reserveTimeSlotWithToday(store_idx);
		return result;
	}
	
	@Override
	public int reserveWaitingCnt(int store_idx) {
		Integer result = mapper.reserveWaitingCnt(store_idx);
		int rlt = result == null ? 0 : result;
		return rlt;
	}
	
	@Override
	public List<ReserveWeekDTO> reserveWeek(int store_idx) {
		List<ReserveWeekDTO> result = mapper.reserveWeek(store_idx);
		return result;
	}
	
	@Override
	public SelltwlwDTO sellCompare(int store_idx) {
		SelltwlwDTO dto = mapper.sellCompare(store_idx);
		return dto;
	}
	
	@Override
	public List<SellTop3MenuDTO> sellTop3Menu(int store_idx) {
		List<SellTop3MenuDTO> result = mapper.sellTop3Menu(store_idx);
		return result;
	}

}
