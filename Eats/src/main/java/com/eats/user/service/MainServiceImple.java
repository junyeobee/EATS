package com.eats.user.service;

import java.util.List;
import java.util.Map; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.admin.model.BannerDTO;
import com.eats.mapper.user.MainMapper;
import com.eats.store.model.HYStoreDTO;
import com.eats.user.model.AreaDTO;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;
import com.eats.user.model.ReviewDTO;

@Service
public class MainServiceImple implements MainService {
	@Autowired
	public MainMapper mp;

	@Override
	public List<CateKeyDTO> getCateKey() {
		List<CateKeyDTO> list = mp.getCateKey();
		return list;
	}
	
	@Override
	public List<String> getValueList(int cate_key_idx) {
		List<String> list = mp.getValueList(cate_key_idx);
		return list;
	}
	
	@Override
	public List<CateValueDTO> getCateValues(int cate_key_idx) {
		List<CateValueDTO> list = mp.getCateValues(cate_key_idx);
		return list;
	}
	
	@Override
	public List<AreaDTO> getCityList() {
		List<AreaDTO> list = mp.getCityList();
		return list;
	}
	
	@Override
	public List<String> getUnitList(int area_idx) {
		List<String> list = mp.getUnitList(area_idx);
		return list;
	}
	
	@Override
	public List<Integer> getPopularReviews(String cityWord, String unitWord) {
		List<Integer> list = mp.getPopularReviews(cityWord, unitWord);
		return list;
	}
	
	@Override
	public Double getStorePoint(int store_idx) {
		double storePoint = mp.getStorePoint(store_idx);
		return storePoint;
	}
	
	@Override
	public Integer getLikeCount(int rev_idx) {
		int likeCount = mp.getLikeCount(rev_idx);
		return likeCount;
	}
	
	@Override
	public Integer getFollowerCount(int user_idx) {
		int followCount = mp.getFollowerCount(user_idx);
		return followCount;
	}
	
	@Override
	public String getTag(int tag_idx) {
		String tag = mp.getTag(tag_idx);
		return tag;
	}

	@Override
	public ReviewDTO getReview(int rev_idx) {
		ReviewDTO dto = mp.getReview(rev_idx);
		return dto;
	}
	
	@Override
	public Integer getReviewCountByStoreIdx(int store_idx) {
		int count = mp.getReviewCountByStoreIdx(store_idx);
		return count;
	}
	
	@Override
	public List<HYStoreDTO> getStoreByJjimCount(Map<String, Object> map) {
		List<HYStoreDTO> list = mp.getStoreByJjimCount(map);
		return list;
	}
	
	@Override
	public List<HYStoreDTO> getStoreByStarPoint(Map<String, Object> map) {
		List<HYStoreDTO> list = mp.getStoreByStarPoint(map);
		return list;
	}
	
	@Override
	public List<String> getStoreCategoryName(int store_idx) {
		List<String> list = mp.getStoreCategoryName(store_idx);
		return list;
	}
	
	@Override
	public List<BannerDTO> getBannerForSwiper(String todate) {
		List<BannerDTO> list = mp.getBannerForSwiper(todate);
		return list;
	}
}
