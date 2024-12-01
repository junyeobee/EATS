package com.eats.user.service;

import java.util.List;
import java.util.Map;

import com.eats.store.model.HYMenuCateDTO;
import com.eats.store.model.HYMenuDTO;
import com.eats.user.model.ReservationDTO;
import com.eats.user.model.ReviewDTO;

public interface UserReviewService {

	public Map getStoreInfoByReserveIdx(int reserve_idx);
	public ReservationDTO getReserveInfo(int reserve_idx);
	public List<HYMenuCateDTO> getMenuCateListByReserveIdx(int reserve_idx);
	public List<HYMenuDTO> getMenuListByReserveIdx(int reserve_idx);
	public List<String> tagList();
	public int insertReview(ReviewDTO dto);
	public int givePoint(int user_idx);
	public int getCurPoint(int user_idx);
	public int pointLog(Map<String, Integer> param);
}
