package com.eats.mapper.store;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.eats.store.model.StoreImgDTO;

public interface StoreImgMapper {
	public int storeImgInsert(StoreImgDTO dto);
	public StoreImgDTO storeImgData();
}
