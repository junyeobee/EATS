package com.eats.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.admin.model.RevDelDTO;
import com.eats.admin.model.ReviewDeleteDTO;
import com.eats.mapper.admin.AdminReviewMapper;
import com.eats.store.model.StoreJoinDTO;
import com.eats.store.model.StoreNewsDTO;

@Service
public class AdminReviewServiceImple implements AdminReviewService {
	
	@Autowired
	private AdminReviewMapper mapper;


	@Override
	public List<ReviewDeleteDTO> adminMainReviewList() {
		
		List<ReviewDeleteDTO> lists = mapper.adminMainReviewList();
		return lists;
	}
	
	@Override
	public List<ReviewDeleteDTO> adminRevDelList() {
		
		List<ReviewDeleteDTO> lists = mapper.adminRevDelList();
		return lists;
	}

	@Override
	public int review_stateChange(ReviewDeleteDTO dto) {
		int count = mapper.review_stateChange(dto);
		return count;
	}

	@Override
	public int revDel_stateChange(ReviewDeleteDTO dto) {
		int count = mapper.revDel_stateChange(dto);
		return count;
	}
}
