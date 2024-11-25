package com.eats.mapper.store;

import java.util.List;
import java.util.Map;

import com.eats.store.model.StoreReportDTO;
import com.eats.store.model.report.DayReservDTO;
import com.eats.store.model.report.DaySellDTO;
import com.eats.store.model.report.MenuSellDTO;
import com.eats.store.model.report.MonthReservDTO;
import com.eats.store.model.report.MonthSellDTO;
import com.eats.store.model.report.TimeReservDTO;
import com.eats.store.model.report.WeekReservDTO;
import com.eats.store.model.report.WeekSellDTO;
import com.eats.store.model.report.YearCompareDTO;

public interface StoreReportMapper {
	public int isGudoked(int store_idx);
	public List<StoreReportDTO> selectReviewForReport(Map<String,String> map);
	public boolean reportIsThere(Map<String,String> map);
	public List<WeekReservDTO> reservWeek(Map<String,String> map);
	public List<MonthReservDTO> reservMonth(Map<String,String> map);
	public List<DayReservDTO> reservDay(Map<String,String> map);
	public List<YearCompareDTO> reservYear(Map<String,String> map);
	public List<TimeReservDTO> reservTime(Map<String,String> map);
	public List<DaySellDTO> sellDay(Map<String,String> map);
	public List<WeekSellDTO> sellWeek(Map<String,String> map);
	public List<MonthSellDTO> sellMonth(Map<String,String> map);
	public List<MenuSellDTO> sellMenu(Map<String,String> map);
}
