package com.eats.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.admin.model.AdminStoreDTO;
import com.eats.mapper.admin.AdminStoreEntryMapper;
import com.eats.mapper.admin.AdminStoreMapper;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreJoinDTO;
import com.eats.store.model.StoreTimeDTO;

@Service
public class AdminStoreServiceImple implements AdminStoreService {
	
	@Autowired
	private AdminStoreMapper mapper;

	@Override
	public List<AdminStoreDTO> storeList() {
		List<AdminStoreDTO> lists = mapper.storeList();
		return lists;
	}
	
	@Override
	public AdminStoreDTO adminStoreDetail(int st_idx) {
		AdminStoreDTO data = mapper.adminStoreDetail(st_idx);
		return data;
	}

	@Override
	public List<StoreTimeDTO> storeTimeList(int st_idx) {
		List<StoreTimeDTO> t_list = mapper.storeTimeList(st_idx);
		return t_list;
	}

	@Override
	public List<AdminStoreDTO> storeChartList() {
		List<AdminStoreDTO> lists = mapper.storeList();
		return lists;
	}
	
	@Override
	public AdminStoreDTO adminStoreChartDetail(int st_idx) {
		AdminStoreDTO data = mapper.adminStoreChartDetail(st_idx);
		return data;
	}
	
	/*

	@Override
	public int storeJoinUpdate(StoreJoinDTO dto) {
		int count = mapper.storeJoinUpdate(dto);
		return count;
	}
	
	@Override
	public int storeInsert(StoreJoinDTO dto) {
		int count = mapper.storeInsert(dto);
		return count;
	}
	*/
}
