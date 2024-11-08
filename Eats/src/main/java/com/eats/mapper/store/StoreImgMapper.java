package com.eats.mapper.store;


import com.eats.store.model.StoreImgDTO;

public interface StoreImgMapper {
	public int storeImgInsert(StoreImgDTO dto);
	public StoreImgDTO storeImgData();
	public int storeImgUpdate(StoreImgDTO dto);
	public int storeImgUpDel(StoreImgDTO dto);
}
