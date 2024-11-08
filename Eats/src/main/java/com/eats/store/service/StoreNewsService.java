package com.eats.store.service;

import java.util.List;
import java.util.Map;

import com.eats.store.model.StoreImgDTO;
import com.eats.store.model.StoreNewsDTO;

public interface StoreNewsService {

	public int storeNewsInsert(StoreNewsDTO dto);

	public int storeNewsTotalCnt(int store_idx);
	public List<StoreNewsDTO> storeNewsList(Integer store_idx);

	public StoreNewsDTO storeNewsData(int news_idx);
	
	
}
