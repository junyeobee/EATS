package com.eats.mapper.store;

import java.util.List;
import java.util.Map;

import com.eats.store.model.StoreReportDTO;
import com.eats.store.model.ReservationDTO;

public interface StoreReportMapper {
	public List<StoreReportDTO> selectReviewForReport(int store_idx);
	public boolean reportIsThere(Map<String,String> map);
	public List<ReservationDTO> reportReservation(Map<String,String> map);
}
