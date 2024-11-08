package com.eats.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.storeMenuMapper;
import com.eats.store.model.MenuDTO;

@Service
public class storeMenuServiceImple implements storeMenuService {

	@Autowired
	private storeMenuMapper mapper;

	
	@Override
	public List<MenuDTO> storeCateList() {
		List<MenuDTO> lists = mapper.storeCateList();
		return lists;
	}
	
	
	@Override
	public List<MenuDTO> storeMenuList(Integer idx) {
		List<MenuDTO> lists = mapper.storeMenuList(idx);
		return lists;
	}
	
	@Override
	public int insertMenu(MenuDTO dto) {
		int result = mapper.insertMenu(dto);
		return result;
	}
}
