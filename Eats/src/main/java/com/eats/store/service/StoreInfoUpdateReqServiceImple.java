package com.eats.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.StoreInfoUpdateMapper;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreImgDTO;
import com.eats.store.model.StoreInfoUpdateDTO;

@Service
public class StoreInfoUpdateReqServiceImple implements StoreInfoUpdateReqService {
	

	@Autowired
	private StoreInfoUpdateMapper mapper;
	
	@Override
	public StoreDTO storeData() {

		StoreDTO data = mapper.storeData();
		return data;
		
		
	}

	@Override
	public int StoreInfoUpdateInsert(StoreInfoUpdateDTO dto) {
		int count = mapper.StoreInfoUpdateInsert(dto);
		return count;
	}
}
