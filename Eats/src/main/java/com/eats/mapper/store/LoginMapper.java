package com.eats.mapper.store;

import com.eats.store.model.EatsStoreDTO;

public interface LoginMapper {

	public String storeLogin(String storeId);
	
	public String findId(EatsStoreDTO dto);
}
