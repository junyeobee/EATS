package com.eats.store.service;

import java.util.List;
import java.util.Map;

import com.eats.store.model.StoreReportDTO;

public interface StoreReportService {
	public List<StoreReportDTO> selectReviewForReport(int store_idx);
	public boolean reportIsThere(Map<String, String> map);
}
