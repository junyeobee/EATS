package com.eats.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.admin.model.SearchDTO;
import com.eats.mapper.user.MainMapper;
import com.eats.mapper.user.SearchMapper;
import com.eats.store.model.StoreDTO;
import com.eats.user.model.CateKeyDTO;

@Service
public class SearchServiceImple implements SearchService {

	@Autowired
	private SearchMapper mp;
	@Autowired
	private MainMapper mm;
	
	@Override
	public int addSearchWord(String searchWord) {
		int count = mp.addSearchWord(searchWord);
		return count;
	}

	@Override
	public int getSearchCount(String searchWord) {
		int count = mp.getSearchCount(searchWord);
		return count;
	}
	
	@Override
	public int addCount(String searchWord) {
		int count = mp.addCount(searchWord);
		return count;
	}
	
	@Override
	public List<SearchDTO> getSearchData(Map<String,String> dateMap) {
		List<SearchDTO> list = mp.getSearchData(dateMap);
		return list;
	}
	
	@Override
	public Map<String, Integer> getSearchCountByTag(List<String> valueList, Map<String, String> dateMap) {
		Map<String, Object> newmap = new HashMap<>();
		newmap.put("valueList", valueList);
		newmap.put("first_date", dateMap.get("first_date"));
		newmap.put("last_date", dateMap.get("last_date"));

		List<SearchDTO> dtoList = mp.getSearchCountByTag(newmap);
		
		Map<String, Integer> countMap = new HashMap<>();
		for(String value:valueList) {
			int count=0;
			for(SearchDTO dto:dtoList) {
				if(dto.getSearch_word().contains(value)) {
					count+=dto.getSearch_count();
				}
			}
			countMap.put(value, count);
		}
		
		return countMap;
	}
	
	@Override
	public List<StoreDTO> getStoreInfo() {
		List<StoreDTO> list = mp.getStoreInfo();
		return list;
	}
}
