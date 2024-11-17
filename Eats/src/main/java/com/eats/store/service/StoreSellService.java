package com.eats.store.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.eats.store.model.SalesResponseDTO;
import com.eats.store.model.SalesSearchDTO;

public interface StoreSellService {
	public int sellInsert(MultipartFile file, int storeIdx);
	public List<SalesResponseDTO> sellList(SalesSearchDTO searchDTO);
	
}
