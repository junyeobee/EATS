package com.eats.store.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.eats.mapper.store.StoreImgMapper;
import com.eats.store.model.StoreImgBeforeDTO;
import com.eats.store.model.StoreImgDTO;
import com.eats.store.model.StoreNewsDTO;

@Service
public class StoreImgServiceImple implements StoreImgService {
	
	@Autowired
	private StoreImgMapper mapper;

	@Override
	public int storeImgInsert(StoreImgDTO dto) {
		int count = mapper.storeImgInsert(dto);
		return count;
	}
	
	@Override
	public List<StoreImgDTO> storeImgData(Integer store_idx) {
		
		List<StoreImgDTO> lists = mapper.storeImgData(store_idx);
		return lists;
	}

	@Override
	public int storeImgUpdate(StoreImgDTO dto) {
		int count = mapper.storeImgUpdate(dto);
		return count;
	}

	@Override
	public int storeImgUpDel2(int si_idx) {
		int count = mapper.storeImgUpDel2(si_idx);
		return count;
	}
	
	
	
	
	
	
	
	@Override
	public int storeImgInsertBefore(StoreImgBeforeDTO dto) {
		int count = mapper.storeImgInsertBefore(dto);
		return count;
	}
	
	@Override
	public StoreImgBeforeDTO storeImgBeforeData() {
		StoreImgBeforeDTO data = mapper.storeImgBeforeData();
		return data;
	}

	@Override
	public int storeImgBeforeUpdate(StoreImgBeforeDTO dto) {
		int count = mapper.storeImgBeforeUpdate(dto);
		return count;
	}

	@Override
	public int storeImgUpDel(StoreImgBeforeDTO dto) {
		int count = mapper.storeImgUpDel(dto);
		return count;
	}
}


