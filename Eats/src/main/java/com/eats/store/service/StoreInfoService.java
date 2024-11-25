package com.eats.store.service;

import java.util.List;
import java.util.Map;

import com.eats.store.model.HYMenuDTO;
import com.eats.store.model.HYStoreInfoDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.model.ReviewDTO;

public interface StoreInfoService {

	public HYStoreInfoDTO getStoreTotalInfo(int store_idx);
	public boolean checkJjim(int user_idx, int store_idx);
	public boolean insertJjim(JjimDTO dto);
	public boolean deleteJjim(JjimDTO dto);
	public int getJjimCnt(int store_idx);
	public Map getStoreBriefInfo(int store_idx);
	public List<Map<String, Object>> getReviewList(int store_idx);
	public List<HYMenuDTO> getRevMenuList(List<Integer> list);
	public double getAvgRevScore(int store_idx);
	public int getRevCount(int store_idx);
	public List<Map<String, Object>> getSortedReviewList(int store_idx, String sortType);
}
