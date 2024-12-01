package com.eats.store.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.eats.store.model.MenuDTO;

public interface storeMenuService {
	public List<MenuDTO> storeCateList(Integer storeIdx);
	
	public List<MenuDTO> storeMenuList(Map<String, Integer> map);
	
	public int insertMenu(MenuDTO dto,MultipartFile menuImg,String realpath) throws IOException;
	
	public int deleteMenuCate(int idx);
	
	public int insertCate(Integer storeIdx, String cateName, String mCateInfo);
	
	public int deleteMenu(List<Integer> menuIdx);
	
	public int updateMenu(MenuDTO dto);
	
	public MenuDTO updateMenuInfo(Integer menuIdx);
	
	
	
	
	
	
	
	
	
}
