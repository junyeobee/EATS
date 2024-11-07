package com.eats.mapper.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.eats.store.model.StoreImgDTO;
import com.eats.store.model.StoreNewsDTO;

@Mapper
public interface StoreNewsMapper {

	public int storeNewsInsert(StoreNewsDTO dto);

	public int storeNewsTotalCnt(int store_idx);

	//public List<StoreNewsDTO> storeNewsList(Map<String, Object> params);

	public List<StoreNewsDTO> storeNewsList(int store_idx);

	public StoreNewsDTO storeNewsData(int news_idx);
}
