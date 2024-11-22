package com.eats.user.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.user.MyplateMapper;
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

//	@Override
//	public List<Map<String, Integer>> getDdayList(int user_idx) {
//		
//		List<Map<String, Integer>> getDday = mapper.getDday(user_idx);
//		return getDday;
//	}

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
}
