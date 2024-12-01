package com.eats.mapper.admin;

import java.util.List;
import java.util.Map;

import com.eats.admin.model.AdminUserDTO;

public interface AdminUserMapper {


	//public List<AdminUserDTO> userList();
	
	//public int userListCnt(Map<String, Object> params);
	//public List<AdminUserDTO> userListPage(int cp, int listSize, Map<String, Object> params);

	public int userListCnt();
	public List<AdminUserDTO> userListPage(int cp, int listSize);
	
	public AdminUserDTO userDetail(int user_idx);
	
	//public List<AdminStoreDTO> mainStoreList();
	//public AdminStoreDTO adminStoreChartDetail(int st_idx);
}
