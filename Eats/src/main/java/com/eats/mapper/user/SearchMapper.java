package com.eats.mapper.user;

public interface SearchMapper {

	public int addSearchWord(String searchWord);
	public int isInIt(String searchWord);
	public int addCount(String searchWord);
}
