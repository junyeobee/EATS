package com.eats.mapper.store;

import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreInfoUpdateDTO;
import com.eats.store.model.StoreNewsDTO;
import com.eats.store.model.StoreCateDTO;

import java.util.List;


public interface StoreEtcMapper {

	public StoreDTO storeData(int store_idx);
	public int StoreInfoUpdateInsert(StoreInfoUpdateDTO dto);
	public List<StoreCateDTO> storeCate(int store_idx);
}
