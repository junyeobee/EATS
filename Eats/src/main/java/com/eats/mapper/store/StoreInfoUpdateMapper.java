package com.eats.mapper.store;

import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreInfoUpdateDTO;

public interface StoreInfoUpdateMapper {

	public StoreDTO storeData();
	public int StoreInfoUpdateInsert(StoreInfoUpdateDTO dto);
}
