package com.eats.store.service;

import java.util.List;

import com.eats.mapper.store.StoreReportMapper;
import com.eats.store.model.StoreReportDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreReportServiceImple implements StoreReportService {
	
	@Autowired
	private StoreReportMapper mapper;
	
	public List<StoreReportDTO> selectReviewForReport(int store_idx){
		List<StoreReportDTO> reivews = mapper.selectReviewForReport(store_idx);
		return reivews;
	}
}
