package com.eats.mapper.store;

import java.util.List;

import com.eats.store.model.MenuDTO;

public interface storeMenuMapper {
	
	public List<MenuDTO> storeCateList(); //메뉴 카테고리 리스트
	
	public List<MenuDTO> storeMenuList(); //메뉴리스트 
	

}
