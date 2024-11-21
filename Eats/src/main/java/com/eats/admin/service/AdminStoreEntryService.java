package com.eats.admin.service;

import java.util.List;

import com.eats.admin.model.AdminStoreDTO;
import com.eats.store.model.StoreJoinDTO;

public interface AdminStoreEntryService {

	public List<StoreJoinDTO> adminMainEntryList();
	
	public List<StoreJoinDTO> adminStoreEntryList();
	public StoreJoinDTO adminStoreEntryDetail(int sj_idx);
	
	public int storeJoinUpdate(StoreJoinDTO dto);
	public int storeInsert(StoreJoinDTO dto);
}
