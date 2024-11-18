package com.eats.mapper.store;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.eats.store.model.SalesSaveDTO;

@Mapper
public interface SalesMapper {
	public int insertSell(SalesSaveDTO salesDTO);
	public void insertSellDetails(Map<String, Object> map);
}
