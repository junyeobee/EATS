package com.eats.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.StoreNewsMapper;
import com.eats.store.model.StoreImgDTO;
import com.eats.store.model.StoreNewsDTO;

@Service
public class StoreNewsServiceImple implements StoreNewsService {

	@Autowired
	private StoreNewsMapper mapper;

	@Override
	public int storeNewsInsert(StoreNewsDTO dto) {
		int count = mapper.storeNewsInsert(dto);
		return count;
	}

	@Override
	public int storeNewsTotalCnt(int store_idx) {
		
		int count = mapper.storeNewsTotalCnt(store_idx);
		return count;
	}

	@Override
	public List<StoreNewsDTO> storeNewsList(Integer store_idx) {
		//public List<StoreNewsDTO> storeNewsList(Map<String, Object> params){

		//int start=(cp-1)*ls+1;
		//int end = cp*ls;
		//Map map = new HashMap();
		//map.put("start", start);
		//map.put("end", end);
		
		List<StoreNewsDTO> lists = mapper.storeNewsList(store_idx);
		return lists;
		
		//List<StoreNewsDTO> lists = mapper.storeNewsList(cp, ls);
		//return lists;
	}

	@Override
	public StoreNewsDTO storeNewsData(int news_idx) {
		StoreNewsDTO data = mapper.storeNewsData(news_idx);
		return data;
	}
	
	

	
}
