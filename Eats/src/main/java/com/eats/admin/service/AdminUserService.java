package com.eats.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.eats.admin.model.AdminStoreDTO;
import com.eats.admin.model.AdminUserDTO;

@Mapper
public interface AdminUserService {

	//public List<AdminUserDTO> userList();
	
	//public int userListCnt(Map<String, Object> params);
	//public List<AdminUserDTO> userListPage(int cp, int listSize, Map<String, Object> params);
	

	public int userListCnt();
	public List<AdminUserDTO> userListPage(int cp, int listSize);

	public AdminUserDTO userDetail(int user_idx);
	
	//public List<AdminStoreDTO> storeChartList();
	//public AdminStoreDTO adminStoreChartDetail(int st_idx);

}
