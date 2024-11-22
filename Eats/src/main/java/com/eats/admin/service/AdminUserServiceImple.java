package com.eats.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.admin.model.AdminStoreDTO;
import com.eats.admin.model.AdminUserDTO;
import com.eats.mapper.admin.AdminStoreMapper;
import com.eats.mapper.admin.AdminUserMapper;

@Service
public class AdminUserServiceImple implements AdminUserService {
	
	@Autowired
	private AdminUserMapper mapper;

	@Override
	public List<AdminUserDTO> userList() {
		List<AdminUserDTO> lists = mapper.userList();
		return lists;
	}
	
	@Override
	public AdminUserDTO userDetail(int user_idx) {
		AdminUserDTO data = mapper.userDetail(user_idx);
		return data;
	}

	/*
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
	*/
}
