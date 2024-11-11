package com.eats.store.service;

import java.util.List;

import com.eats.store.model.StoreCateDTO;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreInfoUpdateDTO;
import com.eats.store.model.StoreNewsDTO;

public interface StoreEtcService {

	public StoreDTO storeData(int store_idx);
	public int StoreInfoUpdateInsert(StoreInfoUpdateDTO dto);
	public List<StoreNewsDTO> storeCate(int store_idx);
}
