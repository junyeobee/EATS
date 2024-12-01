package com.eats.store.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.StoreReviewListMapper;
import com.eats.store.model.reviewList.ReviewDetailDTO;
import com.eats.store.model.reviewList.ReviewsListDTO;

@Service
public class StoreReviewListServiceImple implements StoreReviewListService {
	
	@Autowired
	private StoreReviewListMapper mapper;
	
	@Override
	public int getReviewCount(int storeIdx) {
		int result = mapper.getReviewCount(storeIdx);
		return result;
	}

	@Override
	public List<ReviewsListDTO> getReivewLists(Map<String, Object> map) {
		List<ReviewsListDTO> result = mapper.getReivewLists(map);
		return result;
	}

	@Override
	public ReviewDetailDTO getReviewDetail(int revIdx) {
		ReviewDetailDTO result = mapper.getReviewDetail(revIdx);
		return result;
	}

	@Override
	public String getMenus(Integer menu) {
		String result = mapper.getMenus(menu);
		return result;
	}
	
	@Override
	public int getRevRequest(int rev_idx) {
		int result = mapper.getRevRequest(rev_idx);
		return result;
	}
	
	@Override
	public int insertRevReq(Map<String, Object> map) {
		int result = mapper.insertRevReq(map);
		return result;
	}

}
