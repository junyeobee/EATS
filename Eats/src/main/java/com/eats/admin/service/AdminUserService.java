package com.eats.admin.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eats.admin.model.AdminStoreDTO;
import com.eats.admin.model.AdminUserDTO;

@Mapper
public interface AdminUserService {

	public List<AdminUserDTO> userList();
	public AdminUserDTO userDetail(int user_idx);
	
	//public List<AdminStoreDTO> storeChartList();
	//public AdminStoreDTO adminStoreChartDetail(int st_idx);

}
