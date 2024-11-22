package com.eats.store.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.ReserveMapper;
import com.eats.store.model.reserve.StoreTimeDTO;
import com.eats.store.model.reserve.ReserveListDTO;
import com.eats.store.model.reserve.TableDTO;

@Service
public class ReserveServiceImple implements ReserveService {

	@Autowired
	private ReserveMapper mapper;
	
	@Override
	public List<TableDTO> tables(Map map) {
		List<TableDTO> result = mapper.tables(map);
		return result;
	}
	
	@Override
	public List<ReserveListDTO> reserveList(Map map) {
		List<ReserveListDTO> result = mapper.reserveList(map);
		return result;
	}

	public StoreTimeDTO storeTime(Map map){
		StoreTimeDTO result = mapper.storeTime(map);
		return result;
	}
}
