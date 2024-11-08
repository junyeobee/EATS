package com.eats.store.service;

import com.eats.store.model.StoreImgDTO;

public interface StoreImgService {
	public int storeImgInsert(StoreImgDTO dto);
	public StoreImgDTO storeImgData();
	public int storeImgUpdate(StoreImgDTO dto);
	public int storeImgUpDel(StoreImgDTO dto);
}
