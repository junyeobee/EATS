package com.eats.mapper.store;

import com.eats.store.model.SalesSaveDTO;

public interface SalesMapper {
	public int insertSalesWithDetails(SalesSaveDTO salesDTO);
}
