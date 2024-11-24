package com.eats.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.admin.AdminStoreEntryMapper;
import com.eats.mapper.admin.AdminStoreInfoMapper;
import com.eats.store.model.EatsStoreDTO;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreInfoUpdateDTO;
import com.eats.store.model.StoreJoinDTO;

@Service
public class AdminStoreEntryServiceImple implements AdminStoreEntryService {
	
	@Autowired
	private AdminStoreEntryMapper mapper;

	@Override
	public List<StoreJoinDTO> adminMainEntryList() {
		List<StoreJoinDTO> lists = mapper.adminMainEntryList();
		return lists;
	}

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
	
	
	
	
	
	

	@Override
	public int storeJoinEntryApproval(int sj_idx) {
		int count = mapper.storeJoinEntryApproval(sj_idx);
		return count;
	}

	@Override
	public StoreJoinDTO storeJoinEntryData(int sj_idx) {
		StoreJoinDTO data = mapper.storeJoinEntryData(sj_idx);
		return data;
	}

	@Override
	public int areaCity(String city) {
		int count = mapper.areaCity(city);
		return count;
	}
	@Override
	public int areaGu(int city, String gu) {
		int count = mapper.areaGu(city, gu);
		return count;
	}
	
	
	

	@Override
	public int storeEntryInsert(StoreDTO dto) {
		int count = mapper.storeEntryInsert(dto);
		return count;
	}

	@Override
	public int findStoreIdx(String store_name) {
		int count = mapper.findStoreIdx(store_name);
		return count;
	}
	
	@Override
	public int storeAccountInsert(EatsStoreDTO dto) {
		int count = mapper.storeAccountInsert(dto);
		return count;
	}
	


	@Override
	public int storeJoinEntryCancel(StoreJoinDTO dto) {
		int count = mapper.storeJoinEntryCancel(dto);
		return count;
	}
}
