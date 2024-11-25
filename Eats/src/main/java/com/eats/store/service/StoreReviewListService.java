package com.eats.store.service;

import java.util.List;

import com.eats.store.model.reviewList.ReviewDetailDTO;
import com.eats.store.model.reviewList.ReviewsListDTO;

public interface StoreReviewListService {
	public List<ReviewsListDTO> getReivewLists(int storeIdx);
	public ReviewDetailDTO getReviewDetail(int revIdx);
	public String getMenus(Integer menu);
	public int getRevRequest(int rev_idx);
	public int insertRevReq(int rev_idx);
}
