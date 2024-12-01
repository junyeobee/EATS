package com.eats.store.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.StoreReserveMapper;
import com.eats.store.model.ReserveOkListDTO;

@Service
public class StoreReserveServiceImple implements StoreReserveService {

	@Autowired
	private StoreReserveMapper sr;
	
	@Override
	public List<ReserveOkListDTO> getStoreReserveOkList(Map<String, Object> map) {
		List<ReserveOkListDTO> list = sr.getStoreReserveOkList(map);
		return list;
	}
	
	@Override
	public List<ReserveOkListDTO> getStoreReserveOkListDetail(int reserve_idx) {
		List<ReserveOkListDTO> list = sr.getStoreReserveOkListDetail(reserve_idx);
		return list;
	}
}
