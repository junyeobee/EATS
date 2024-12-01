package com.eats.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eats.admin.model.AdminStoreInfoUpdateDTO;

@Mapper
public interface AdminStoreInfoMapper {
	public List<AdminStoreInfoUpdateDTO> adminStoreInfoList();
	
	public List<AdminStoreInfoUpdateDTO> adminStoreInfoListIn();
	public List<AdminStoreInfoUpdateDTO> adminStoreInfoListOut();
	
	public int infoUpdateAction(AdminStoreInfoUpdateDTO dto);
	public int storeInfoUpdate(AdminStoreInfoUpdateDTO dto);
	public int storeInfoUpdateCeo(AdminStoreInfoUpdateDTO dto);

}
