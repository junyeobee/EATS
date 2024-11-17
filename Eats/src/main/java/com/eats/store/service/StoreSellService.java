package com.eats.store.service;

import org.springframework.web.multipart.MultipartFile;

public interface StoreSellService {
	public int sellInsert(MultipartFile file, int storeIdx);
}
