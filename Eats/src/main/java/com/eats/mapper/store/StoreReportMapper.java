package com.eats.mapper.store;

import java.util.List;
import com.eats.store.model.StoreReportDTO;

public interface StoreReportMapper {
	public List<StoreReportDTO> selectReviewForReport(int store_idx);
}
