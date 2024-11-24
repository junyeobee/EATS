package com.eats.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.admin.StoreEntryMapper;
import com.eats.store.model.StoreJoinDTO;

@Service
public class StoreEntryServiceImple implements StoreEntryService {

	@Autowired
	private StoreEntryMapper mapper;
	
	@Override
	public int tagOneCheck(int store_idx) {
		int count = mapper.tagOneCheck(store_idx);
		return count;
	}
	
	@Override
	public int tagTwoCheck(int store_idx) {
		int count = mapper.tagTwoCheck(store_idx);
		return count;
	}

	@Override
	public int timeCheck(int store_idx) {
		int count = mapper.timeCheck(store_idx);
		return count;
	}
	
	@Override
	public int imgCheck(int store_idx) {
		int count = mapper.imgCheck(store_idx);
		return count;
	}
	
	@Override
	public int storeEntryInAction(int store_idx) {
		int count = mapper.storeEntryInAction(store_idx);
		return count;
	}
}
