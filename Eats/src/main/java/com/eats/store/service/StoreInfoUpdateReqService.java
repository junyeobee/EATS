package com.eats.store.service;

import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreInfoUpdateDTO;

public interface StoreInfoUpdateReqService {

	public StoreDTO storeData();
	public int StoreInfoUpdateInsert(StoreInfoUpdateDTO dto);
}
