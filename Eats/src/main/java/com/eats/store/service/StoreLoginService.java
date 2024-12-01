package com.eats.store.service;

import com.eats.store.model.EatsStoreDTO;

public interface StoreLoginService {

	public int storeLogin(String storeId, String storePwd);
	
	public String findId(EatsStoreDTO dto);
	
	public String storeidCheckForFindPwd(String storeId);
	
	public int storeUpdatePwd(String newPwd, String storeId);
	
	public String storeName(int storeIdx);
	
	public int storeIdx(String storeId);

	
	
	
}
