package com.eats.store.service;

import com.eats.store.model.HYStoreInfoDTO;
import com.eats.user.model.JjimDTO;

public interface StoreInfoService {

	public HYStoreInfoDTO getStoreTotalInfo(int store_idx);
	public boolean checkJjim(int user_idx, int store_idx);
	public boolean insertJjim(JjimDTO dto);
	public boolean deleteJjim(JjimDTO dto);
	public int getJjimCnt(int store_idx);
}
