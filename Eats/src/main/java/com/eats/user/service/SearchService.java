package com.eats.user.service;

import java.util.List;
import java.util.Map;

import com.eats.admin.model.SearchDTO;
import com.eats.store.model.StoreDTO;
import com.eats.user.model.CateKeyDTO;

public interface SearchService {

	public int addSearchWord(String searchWord);
	public int getSearchCount(String searchWord);
	public int addCount(String searchWord);
	public List<SearchDTO> getSearchData(Map<String,String> dateMap);
	public Map<String, Integer> getSearchCountByTag(List<String> valueList, Map<String, String> map);
	public List<StoreDTO> getStoreInfo(Map<String, Object> map);
}
