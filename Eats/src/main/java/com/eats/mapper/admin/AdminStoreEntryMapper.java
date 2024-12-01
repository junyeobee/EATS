package com.eats.mapper.admin;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.eats.store.model.EatsStoreDTO;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreJoinDTO;

@Mapper
public interface AdminStoreEntryMapper {

	public List<StoreJoinDTO> adminMainEntryList();
	
	public List<StoreJoinDTO> adminStoreEntryList();
	public StoreJoinDTO adminStoreEntryDetail(int sj_idx);
	
	public int storeJoinUpdate(StoreJoinDTO dto);
	public int storeInsert(StoreJoinDTO dto);

	
	
	
	public int storeJoinEntryApproval(int sj_idx);
	public StoreJoinDTO storeJoinEntryData(int sj_idx);
	public int areaCity(String city);
	public int areaGu(int city, String gu);
	
	
	
	public int storeEntryInsert(StoreDTO dto);
	public int findStoreIdx(String store_name);
	
	public int storeAccountInsert(EatsStoreDTO dto);
	
	public int storeJoinEntryCancel(StoreJoinDTO dto);
	
}
