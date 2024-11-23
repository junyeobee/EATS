package com.eats.admin.service;

import java.util.List;

import com.eats.admin.model.AdminStoreDTO;
import com.eats.admin.model.AdminUserDTO;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreTimeDTO;

public interface AdminStoreService {

	public List<AdminStoreDTO> storeList();
	//public List<AdminStoreDTO> storeListPage(int cp, int ls, String findkey);
	public int storeListCnt();
	public List<AdminStoreDTO> storeListPage(int cp, int listSize);
	
	
	public AdminStoreDTO adminStoreDetail(int st_idx);
	public List<StoreTimeDTO> storeTimeList(int st_idx);
	
	public List<AdminStoreDTO> storeChartList();
	public AdminStoreDTO adminStoreChartDetail(int st_idx);
	
	

	public int storeTimeSave(StoreTimeDTO dto);
	public int storeTimeUpdate(StoreTimeDTO dto);
	public int storeTimeDelete(int stime_idx);
	
	

	public String storeWorkData(int store_idx);
	public int storeWorkSet(StoreDTO dto);
	
	

    
    
	
	
	//public int storeJoinUpdate(StoreDTO dto);
	//public int storeInsert(StoreDTO dto);
}
