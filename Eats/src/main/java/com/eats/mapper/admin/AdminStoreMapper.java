package com.eats.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eats.admin.model.AdminStoreDTO;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreTimeDTO;


@Mapper
public interface AdminStoreMapper {

	public List<AdminStoreDTO> storeList();
	public AdminStoreDTO adminStoreDetail(int st_idx);
	public List<StoreTimeDTO> storeTimeList(int st_idx);
	
	public List<AdminStoreDTO> storeChartList();
	public AdminStoreDTO adminStoreChartDetail(int st_idx);

	public int storeTimeSave(StoreTimeDTO dto);
	public int storeTimeUpdate(StoreTimeDTO dto);
	public int storeTimeDelete(int stime_idx);

	public String storeWorkData(int store_idx);
	public int storeWorkSet(StoreDTO dto);
	
	//public int storeJoinUpdate(StoreDTO dto);
	//public int storeInsert(StoreDTO dto);
	

}
