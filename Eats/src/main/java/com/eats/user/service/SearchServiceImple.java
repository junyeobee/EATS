package com.eats.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int isInIt(String searchWord) {
		int count = mp.isInIt(searchWord);
		return count;
	}
	
	@Override
	public int addCount(String searchWord) {
		int count = mp.addCount(searchWord);
		return count;
	}
}
