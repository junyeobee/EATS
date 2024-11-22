package com.eats.store.service;

import java.util.List;
import java.util.Map;

import com.eats.store.model.ReserveOkListDTO;

public interface StoreReserveService {

	public List<ReserveOkListDTO> getStoreReserveOkList(Map<String, Object> map);
}
