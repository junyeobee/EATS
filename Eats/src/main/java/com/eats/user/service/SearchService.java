package com.eats.user.service;

import java.util.List;
import java.util.Map;

import com.eats.admin.model.SearchDTO;

public interface SearchService {

	public int addSearchWord(String searchWord);
	public int getSearchCount(String searchWord);
	public int addCount(String searchWord);
	public List<SearchDTO> getSearchData(Map<String,String> dateMap);
	public List<String> getAllCateKeyName();
}
