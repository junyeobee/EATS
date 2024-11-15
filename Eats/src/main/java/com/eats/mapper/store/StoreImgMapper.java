package com.eats.mapper.store;


import java.util.List;

import com.eats.store.model.StoreImgBeforeDTO;
import com.eats.store.model.StoreImgDTO;
import com.eats.store.model.StoreNewsDTO;

public interface StoreImgMapper {
	
	public int storeImgInsert(StoreImgDTO dto);
	public List<StoreImgDTO> storeImgData(Integer store_idx);
	public int storeImgUpdate(StoreImgDTO dto);
	public int storeImgUpDel2(int si_idx);
	
	
	
	
	
	public int storeImgInsertBefore(StoreImgBeforeDTO dto);
	public StoreImgBeforeDTO storeImgBeforeData();
	public int storeImgBeforeUpdate(StoreImgBeforeDTO dto);
	public int storeImgUpDel(StoreImgBeforeDTO dto);
	
}
