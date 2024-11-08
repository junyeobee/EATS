package com.eats.user.service;

public interface SearchService {

	public int addSearchWord(String searchWord);
	public int isInIt(String searchWord);
	public int addCount(String searchWord);
}
