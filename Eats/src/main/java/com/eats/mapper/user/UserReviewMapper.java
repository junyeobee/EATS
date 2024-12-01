package com.eats.mapper.user;

import java.util.List;
import java.util.Map;

import com.eats.store.model.HYMenuCateDTO;
import com.eats.store.model.HYMenuDTO;
import com.eats.user.model.ReservationDTO;
import com.eats.user.model.ReviewDTO;

public interface UserReviewMapper {

	public Map getStoreInfoByReserveIdx(int reserve_idx);
	public ReservationDTO getReserveInfo(int reserve_idx);
	public List<HYMenuCateDTO> getMenuCateListByReserveIdx(int reserve_idx);
	public List<HYMenuDTO> getMenuListByReserveIdx(int reserve_idx);
	public ReservationDTO getReviewInfoByReserve(int reserve_idx);
	public int insertReview(ReviewDTO dto);
	public List<String> getTagList();
	public int givePoint(int user_idx);
	public int getCurPoint(int user_idx);
	public int pointLog(Map<String, Integer> param);
}
