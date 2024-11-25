package com.eats.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.admin.model.AdminStoreInfoUpdateDTO;
import com.eats.mapper.admin.AdminStoreInfoMapper;

@Service
public class AdminStoreInfoServiceImple implements AdminStoreInfoService {

	@Autowired
	private AdminStoreInfoMapper mapper;

	@Override
	public List<AdminStoreInfoUpdateDTO> adminStoreInfoList() {
		
		List<AdminStoreInfoUpdateDTO> lists = mapper.adminStoreInfoList();
		return lists;
	}
	
	@Override
	public List<AdminStoreInfoUpdateDTO> adminStoreInfoListIn() {
		
		List<AdminStoreInfoUpdateDTO> lists = mapper.adminStoreInfoListIn();
		return lists;
	}
	
	@Override
	public List<AdminStoreInfoUpdateDTO> adminStoreInfoListOut() {
		
		List<AdminStoreInfoUpdateDTO> lists = mapper.adminStoreInfoListOut();
		return lists;
	}

	@Override
	public int infoUpdateAction(AdminStoreInfoUpdateDTO dto) {
		int count = mapper.infoUpdateAction(dto);
		return count;
	}

	@Override
	public int storeInfoUpdate(AdminStoreInfoUpdateDTO dto) {
		int count = mapper.storeInfoUpdate(dto);
		return count;
	}

	@Override
	public int storeInfoUpdateCeo(AdminStoreInfoUpdateDTO dto) {
		int count = mapper.storeInfoUpdateCeo(dto);
		return count;
	}
}
