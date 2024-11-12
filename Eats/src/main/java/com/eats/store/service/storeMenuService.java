package com.eats.store.service;

import java.util.List;

import com.eats.store.model.MenuDTO;
import com.eats.store.model.MenuImgDTO;

public interface storeMenuService {
	public List<MenuDTO> storeCateList();
	public List<MenuDTO> storeMenuList(Integer idx);
	public int insertMenu(MenuDTO dto);
	public int deleteMenuCate(String cateName);
	public int insertCate(String cateName);
	
	public int deleteMenu(List<Integer> menuIdx);
	public int insertMenuImg(MenuImgDTO idto);
	
	
	
}
