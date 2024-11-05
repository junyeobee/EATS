package com.eats.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.store.model.StoreImgDTO;
import com.eats.mapper.store.StoreImgMapper;

@Service
public class StoreImgServiceImple implements StoreImgService {
	
	@Autowired
	private StoreImgMapper mapper;

	@Override
	public int storeImgInsert(StoreImgDTO dto) {
		int count = mapper.storeImgInsert(dto);
		return count;
	}

}
