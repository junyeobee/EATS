package com.eats.mapper.store;

import java.util.List;
import java.util.Map;

import com.eats.store.model.reviewList.ReviewDetailDTO;
import com.eats.store.model.reviewList.ReviewsListDTO;

public interface StoreReviewListMapper {
	public int getReviewCount(int storeIdx);
	public List<ReviewsListDTO> getReivewLists(Map<String, Object> map);
	public ReviewDetailDTO getReviewDetail(int revIdx);
	public String getMenus(Integer menu);
	public int getRevRequest(int rev_idx);
	public int insertRevReq(int rev_idx);
}
