package com.eats.mapper.store;

import java.util.List;
import java.util.Map;

import com.eats.store.model.CategoryDTO;
import com.eats.store.model.HYMenuCateDTO;
import com.eats.store.model.HYMenuDTO;
import com.eats.store.model.HYStoreDTO;
import com.eats.store.model.HYStoreImgDTO;
import com.eats.store.model.HYStoreNewsDTO;
import com.eats.store.model.StoreTimeDTO;

public interface StoreInfoMapper {

	public HYStoreDTO getStoreInfo(int store_idx);
	public List<HYStoreImgDTO> getStoreImg(int store_idx);
	public List<StoreTimeDTO> getStoreTime(int store_idx);
	public List<HYStoreNewsDTO> getStoreNews(int store_idx);
	public List<HYMenuCateDTO> getStoreMenuCate(int store_idx);
	public List<HYMenuDTO> getStoreMenu(int store_idx);
	public List<CategoryDTO> getStoreConvinient(int store_idx);
	public int getJjimCnt(int store_idx);
	public StoreTimeDTO getTodayTime(Map<String, Object> param);
}
