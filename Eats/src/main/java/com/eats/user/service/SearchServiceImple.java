package com.eats.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.admin.model.SearchDTO;
import com.eats.mapper.user.SearchMapper;

@Service
public class SearchServiceImple implements SearchService {

	@Autowired
	private SearchMapper mp;
	
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
	public List<String> getAllCateKeyName() {
		List<String> list = mp.getAllCateKeyName();
		return list;
	}
}
