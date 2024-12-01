package com.eats.admin.service;

import java.util.List;

import com.eats.admin.model.AdminStoreInfoUpdateDTO;

public interface AdminStoreInfoService {
	public List<AdminStoreInfoUpdateDTO> adminStoreInfoList();
	
	public List<AdminStoreInfoUpdateDTO> adminStoreInfoListIn();
	public List<AdminStoreInfoUpdateDTO> adminStoreInfoListOut();
	
	
	public int infoUpdateAction(AdminStoreInfoUpdateDTO dto);
	public int storeInfoUpdate(AdminStoreInfoUpdateDTO dto);
	public int storeInfoUpdateCeo(AdminStoreInfoUpdateDTO dto);
}
 