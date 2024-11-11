package com.eats.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.StoreEtcMapper;
import com.eats.store.model.StoreCateDTO;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreInfoUpdateDTO;

@Service
public class StoreEtcServiceImple implements StoreEtcService {


	@Autowired
	private StoreEtcMapper mapper;
	
	@Override
	public StoreDTO storeData(int store_idx) {

		StoreDTO data = mapper.storeData(store_idx);
		return data;
	}

	@Override
	public int StoreInfoUpdateInsert(StoreInfoUpdateDTO dto) {
		int count = mapper.StoreInfoUpdateInsert(dto);
		return count;
	}
	
	@Override
	public List storeCate(int store_idx) {

		List<StoreCateDTO> data = mapper.storeCate(store_idx);
		return data;
	}
}
