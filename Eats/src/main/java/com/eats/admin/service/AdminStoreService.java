package com.eats.admin.service;

import java.util.List;

import com.eats.admin.model.AdminStoreDTO;
import com.eats.store.model.StoreTimeDTO;

public interface AdminStoreService {

	public List<AdminStoreDTO> storeList();
	public AdminStoreDTO adminStoreDetail(int st_idx);
	public List<StoreTimeDTO> storeTimeList(int st_idx);
	
	public List<AdminStoreDTO> storeChartList();
	public AdminStoreDTO adminStoreChartDetail(int st_idx);
	

    
    
	
	
	//public int storeJoinUpdate(StoreDTO dto);
	//public int storeInsert(StoreDTO dto);
}
