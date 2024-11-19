package com.eats.mapper.admin;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreJoinDTO;

@Mapper
public interface AdminStoreEntryMapper {

	public List<StoreJoinDTO> adminStoreEntryList();
	public StoreJoinDTO adminStoreEntryDetail(int sj_idx);
	
	public int storeJoinUpdate(StoreJoinDTO dto);
	public int storeInsert(StoreJoinDTO dto);
	
	
}
