package com.eats.store.service;

import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreInfoUpdateDTO;

public interface StoreInfoUpdateReqService {

	public StoreDTO storeData(int store_idx);
	public int StoreInfoUpdateInsert(StoreInfoUpdateDTO dto);
}
