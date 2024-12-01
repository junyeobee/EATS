package com.eats.mapper.store;

import java.util.Map;

import com.eats.store.model.EatsStoreDTO;

public interface LoginMapper {

	public EatsStoreDTO storeLogin(String storeId);
	
	public String findId(EatsStoreDTO dto);
	
	public String storeidCheckForFindPwd(String storeId);
	
	public int storeUpdatePwd(Map<String,String> map);
	
	public String storeName(int storeIdx);
	
	public Integer storeIdx(String storeId);
	
}
