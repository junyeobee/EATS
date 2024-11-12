package com.eats.mapper.store;

import java.util.List;
import java.util.Map;

import com.eats.store.model.StoreReportDTO;
import com.eats.store.model.report.DayReservDTO;
import com.eats.store.model.report.MonthReservDTO;
import com.eats.store.model.report.WeekReservDTO;
import com.eats.store.model.report.YearCompareDTO;

public interface StoreReportMapper {
	public List<StoreReportDTO> selectReviewForReport(int store_idx);
	public boolean reportIsThere(Map<String,String> map);
	public List<WeekReservDTO> reservWeek(Map<String,String> map);
	public List<MonthReservDTO> reservMonth(Map<String,String> map);
	public List<DayReservDTO> reservDay(Map<String,String> map);
	public List<YearCompareDTO> reservYear(Map<String,String> map);
}
