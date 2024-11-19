package com.eats.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.user.UserReviewMapper;
import com.eats.store.model.HYMenuCateDTO;
import com.eats.store.model.HYMenuDTO;
import com.eats.user.model.ReservationDTO;

@Service
public class UserReviewServiceImple implements UserReviewService {

	@Autowired
	private UserReviewMapper reviewMapper;
	
	@Override
	public Map getStoreInfoByReserveIdx(int reserve_idx) {
		
		Map storeInfo=reviewMapper.getStoreInfoByReserveIdx(reserve_idx);
		return storeInfo;
	}

	@Override
	public ReservationDTO getReserveInfo(int reserve_idx) {
		
		ReservationDTO reserveDTO= reviewMapper.getReserveInfo(reserve_idx);
		return reserveDTO;
	}

	@Override
	public List<HYMenuCateDTO> getMenuCateListByReserveIdx(int reserve_idx) {
		
		List<HYMenuCateDTO> menuCateList = reviewMapper.getMenuCateListByReserveIdx(reserve_idx);
		return menuCateList;
	}

	@Override
	public List<HYMenuDTO> getMenuListByReserveIdx(int reserve_idx) {
		
		List<HYMenuDTO> menuList = reviewMapper.getMenuListByReserveIdx(reserve_idx);
		return menuList;
	}

}
