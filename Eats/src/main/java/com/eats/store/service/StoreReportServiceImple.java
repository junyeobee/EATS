package com.eats.store.service;

import java.util.List;
import java.util.Map;

import com.eats.mapper.store.StoreReportMapper;
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreReportServiceImple implements StoreReportService {
	
	@Autowired
	private StoreReportMapper mapper;
	
	public List<StoreReportDTO> selectReviewForReport(Map<String,String> map){
		List<StoreReportDTO> reivews = mapper.selectReviewForReport(map);
		return reivews;
	}

	public boolean reportIsThere(Map<String, String> map) {
		return mapper.reportIsThere(map);
	}
	
	@Override
	public List<WeekReservDTO> reservWeek(Map<String, String> map) {
		List<WeekReservDTO> thisweek = mapper.reservWeek(map);
		return thisweek;
	}
	
	@Override
	public List<DayReservDTO> reservDay(Map<String, String> map) {
		List<DayReservDTO> result = mapper.reservDay(map);
		return result;
	}
	@Override
	public List<MonthReservDTO> reservMonth(Map<String, String> map) {
		List<MonthReservDTO> result = mapper.reservMonth(map);
		return result;
	}
	@Override
	public List<YearCompareDTO> reservYear(Map<String, String> map) {
		List<YearCompareDTO> result = mapper.reservYear(map);
		return result;
	}
	
	@Override
	public List<TimeReservDTO> reservTime(Map<String, String> map) {
		List<TimeReservDTO> result = mapper.reservTime(map);
		return result;
	}

	@Override
	public List<DaySellDTO> sellDay(Map<String, String> map) {
		List<DaySellDTO> result = mapper.sellDay(map);
		return result;
	}

	@Override
	public List<WeekSellDTO> sellWeek(Map<String, String> map) {
		List<WeekSellDTO> result = mapper.sellWeek(map);
		return result;
	}

	@Override
	public List<MonthSellDTO> sellMonth(Map<String, String> map) {
		List<MonthSellDTO> result = mapper.sellMonth(map);
		return result;
	}

	@Override
	public List<MenuSellDTO> sellMenu(Map<String, String> map) {
		List<MenuSellDTO> result = mapper.sellMenu(map);
		return result;
	}
	
}
