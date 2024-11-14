package com.eats.store.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.eats.mapper.store.StoreImgMapper;
import com.eats.store.model.StoreImgDTO;

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
	public StoreImgDTO storeImgData() {
		StoreImgDTO data = mapper.storeImgData();
		return data;
	}

	@Override
	public int storeImgUpdate(StoreImgDTO dto) {
		int count = mapper.storeImgUpdate(dto);
		return count;
	}

	@Override
	public int storeImgUpDel(StoreImgDTO dto) {
		int count = mapper.storeImgUpDel(dto);
		return count;
	}
}


