package com.eats.mapper.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.eats.store.model.MenuDTO;
import com.eats.store.model.MenuImgDTO;

@Mapper
public interface storeMenuMapper {
	
	public List<MenuDTO> storeCateList(Integer storeIdx); //메뉴 카테고리 리스트
	
	public List<MenuDTO> storeMenuList(Map<String, Integer> map); //메뉴리스트 
	
	public int insertMenu(MenuDTO dto);//메뉴등록
	
	public int deleteMenuCate(int mcateIdx);
	
	public int insertCate(Integer storeIdx, String cateName, String mCateInfo); //메뉴카테고리 등록
	
	public int deleteMenu(List<Integer> menuIdx);
	
	public int insertMenuImg(MenuImgDTO idto);
	
	public int updateMenu(MenuDTO dto);
	
	public MenuDTO updateMenuInfo(Integer menuIdx);
	
	

}
