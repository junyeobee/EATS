package com.eats.admin.service;

import java.util.List;

import com.eats.admin.model.AdminStoreDTO;
import com.eats.store.model.EatsStoreDTO;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreJoinDTO;
import com.eats.user.model.AreaDTO;

public interface AdminStoreEntryService {

	public List<StoreJoinDTO> adminMainEntryList();
	
	public List<StoreJoinDTO> adminStoreEntryList();
	public StoreJoinDTO adminStoreEntryDetail(int sj_idx);
	
	public int storeJoinUpdate(StoreJoinDTO dto);
	public int storeInsert(StoreJoinDTO dto);

	
	
	
	
	
	public int storeJoinEntryApproval(int sj_idx);
	public StoreJoinDTO storeJoinEntryData(int sj_idx);
	
	public int areaCity(String city);
	public int areaGu(int city, String gu);
	

	public int storeEntryInsert(StoreDTO dto);

	public int findStoreIdx(String store_name);
	public int storeAccountInsert(EatsStoreDTO dto);


	public int storeJoinEntryCancel(StoreJoinDTO dto);

}
