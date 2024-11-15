package com.eats.store.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.eats.store.model.MenuDTO;
import com.eats.store.model.MenuImgDTO;

public interface storeMenuService {
	public List<MenuDTO> storeCateList();
	
	public List<MenuDTO> storeMenuList(Integer idx);
	
	public int insertMenu(MenuDTO dto,MultipartFile menuImg,String realpath) throws IOException;
	
	public int deleteMenuCate(String cateName);
	
	public int insertCate(String cateName);
	
	public int deleteMenu(List<Integer> menuIdx);
	
	public int updateMenu(MenuDTO dto);
	
	
	
	
	
	
	
}
