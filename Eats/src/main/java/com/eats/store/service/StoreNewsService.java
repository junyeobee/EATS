package com.eats.store.service;

import java.util.List;
import com.eats.store.model.StoreNewsDTO;

public interface StoreNewsService {

	public int storeNewsInsert(StoreNewsDTO dto);

	public int storeNewsTotalCnt(int store_idx);
	public List<StoreNewsDTO> storeNewsList(Integer store_idx);

	public StoreNewsDTO storeNewsData(int news_idx);
	
	public int storeNewsUpdate(StoreNewsDTO dto);
	public int storeNewsUpDel(int s_news_idx);
}
