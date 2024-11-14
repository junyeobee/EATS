package com.eats.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.StoreNewsMapper;
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
		
		List<StoreNewsDTO> lists = mapper.storeNewsList(store_idx);
		return lists;
	}

	@Override
	public StoreNewsDTO storeNewsData(int news_idx) {
		StoreNewsDTO data = mapper.storeNewsData(news_idx);
		return data;
	}

	@Override
	public int storeNewsUpdate(StoreNewsDTO dto) {
		int count = mapper.storeNewsUpdate(dto);
		return count;
	}

	@Override
	public int storeNewsUpDel(int news_idx) {
		int count = mapper.storeNewsUpDel(news_idx);
		return count;
	}
}
