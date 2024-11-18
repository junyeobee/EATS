package com.eats.admin.service;

import java.util.List;

import com.eats.admin.model.AdminStoreInfoUpdateDTO;

public interface AdminStoreInfoService {
	public List<AdminStoreInfoUpdateDTO> adminStoreInfoList();
	public int infoUpdateAction(AdminStoreInfoUpdateDTO dto);
	public int storeInfoUpdate(AdminStoreInfoUpdateDTO dto);
	public int storeInfoUpdateCeo(AdminStoreInfoUpdateDTO dto);
}
 