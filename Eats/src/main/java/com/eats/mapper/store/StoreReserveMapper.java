package com.eats.mapper.store;

import java.util.List;
import java.util.Map;

import com.eats.store.model.ReserveOkListDTO;

public interface StoreReserveMapper {
	
	public List<ReserveOkListDTO> getStoreReserveOkList(Map<String, Object> map);
}
