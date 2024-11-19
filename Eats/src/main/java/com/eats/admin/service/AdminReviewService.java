package com.eats.admin.service;

import java.util.List;

import com.eats.admin.model.RevDelDTO;
import com.eats.admin.model.ReviewDeleteDTO;
import com.eats.store.model.StoreNewsDTO;

public interface AdminReviewService {
	public List<ReviewDeleteDTO> adminRevDelList();
	public int review_stateChange(ReviewDeleteDTO dto);
	public int revDel_stateChange(ReviewDeleteDTO dto);
}
