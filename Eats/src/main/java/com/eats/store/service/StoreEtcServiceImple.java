package com.eats.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.StoreEtcMapper;
import com.eats.store.model.StoreCateDTO;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreGridAllDTO;
import com.eats.store.model.StoreGridBaseDTO;
import com.eats.store.model.StoreGridDetailDTO;
import com.eats.store.model.StoreInfoUpdateDTO;

@Service
public class StoreEtcServiceImple implements StoreEtcService {

	@Autowired
	private StoreEtcMapper mapper;
	
	@Override
	public StoreDTO storeData(int store_idx) {

		StoreDTO data = mapper.storeData(store_idx);
		return data;
	}

	@Override
	public int StoreInfoUpdateInsert(StoreInfoUpdateDTO dto) {
		int count = mapper.StoreInfoUpdateInsert(dto);
		return count;
	}
	
	@Override
	public List storeCate(int store_idx) {

		List<StoreCateDTO> data = mapper.storeCate(store_idx);
		return data;
	}
	
	@Override
	public int StoreGridBaseInsert(int store_idx, int s_floor, int sg_row, int sg_col) {
		int data = mapper.StoreGridBaseInsert(store_idx, s_floor, sg_row, sg_col);
		return data;
	}
	
	@Override
	public int storeGridBaseKeySelect(int store_idx) {

		int data = mapper.storeGridBaseKeySelect(store_idx);
		return data;
	}
	
	@Override
	public int StoreGridDetailInsert(StoreGridDetailDTO dto) {
		int data = mapper.StoreGridDetailInsert(dto);
		return data;
    }

	@Override
	public StoreGridBaseDTO storeGridBaseSelect(int store_idx) {
		
		StoreGridBaseDTO data = mapper.storeGridBaseSelect(store_idx);
		return data;
	}

	@Override
	public List<StoreGridDetailDTO> storeGridDetailView(int sg_idx) {

		List<StoreGridDetailDTO> data = mapper.storeGridDetailView(sg_idx);
		return data;
	}

	@Override
	public int StoreGridDetailDelete(int sg_idx) {
		int count = mapper.StoreGridDetailDelete(sg_idx);
		return count;
	}
	
	@Override
	public int StoreGridBaseDelete(int sg_idx) {
		int count = mapper.StoreGridBaseDelete(sg_idx);
		return count;
	}
}
