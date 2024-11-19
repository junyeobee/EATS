package com.eats.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.admin.AdminStoreEntryMapper;
import com.eats.mapper.admin.AdminStoreInfoMapper;
import com.eats.store.model.StoreInfoUpdateDTO;
import com.eats.store.model.StoreJoinDTO;

@Service
public class AdminStoreEntryServiceImple implements AdminStoreEntryService {
	
	@Autowired
	private AdminStoreEntryMapper mapper;

	@Override
	public List<StoreJoinDTO> adminStoreEntryList() {
		List<StoreJoinDTO> lists = mapper.adminStoreEntryList();
		return lists;
	}

	@Override
	public StoreJoinDTO adminStoreEntryDetail(int sj_idx) {
		StoreJoinDTO data = mapper.adminStoreEntryDetail(sj_idx);
		return data;
	}
	
	

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

}
