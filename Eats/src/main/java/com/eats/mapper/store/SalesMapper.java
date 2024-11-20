package com.eats.mapper.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.eats.store.model.SalesResponseDTO;
import com.eats.store.model.SalesSaveDTO;
import com.eats.store.model.SalesSearchDTO;

@Mapper
public interface SalesMapper {
	public int insertSell(SalesSaveDTO salesDTO);
	public void insertSellDetails(Map<String, Object> map);
	public List<SalesResponseDTO> sellList(SalesSearchDTO dto);
	public List<SalesResponseDTO> sellListWeek(SalesSearchDTO dto);
	public List<SalesResponseDTO> sellListMonth(SalesSearchDTO dto);
	public List<SalesResponseDTO> sellList3Month(SalesSearchDTO dto);
}
