package com.eats.mapper.store;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.eats.store.model.StoreNewsDTO;

@Mapper
public interface StoreNewsMapper {

	public int storeNewsInsert(StoreNewsDTO dto);

	public int storeNewsTotalCnt(int store_idx);
	public List<StoreNewsDTO> storeNewsList(int store_idx);

	public StoreNewsDTO storeNewsData(int news_idx);
	public int storeNewsUpdate(StoreNewsDTO dto);
	public int storeNewsUpDel(int news_idx);
}
