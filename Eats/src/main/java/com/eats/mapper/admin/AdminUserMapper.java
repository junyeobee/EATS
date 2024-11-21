package com.eats.mapper.admin;

import java.util.List;

import com.eats.admin.model.AdminStoreDTO;
import com.eats.admin.model.AdminUserDTO;

public interface AdminUserMapper {


	public List<AdminUserDTO> userList();
	public AdminUserDTO userDetail(int user_idx);
	
	//public List<AdminStoreDTO> mainStoreList();
	//public AdminStoreDTO adminStoreChartDetail(int st_idx);
}
