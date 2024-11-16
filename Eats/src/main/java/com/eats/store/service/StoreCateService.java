package com.eats.store.service;

import java.util.List;

import com.eats.store.model.CategoryDTO;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;

public interface StoreCateService {

	public List<CateKeyDTO> storeCateOneBigList();
	public List<CateKeyDTO> storeCateTwoBigList();
	
	public List<CateValueDTO> storeCateSmallList(int cate_key_idx);
	public int storeTagInsert(CategoryDTO dto);

	//public int storeTagCheck(int store_idx);
	public List<CategoryDTO> storeCateOneData(int store_idx);
	public List<CategoryDTO> storeCateTwoData(int store_idx);
	public int storeCateDel(int store_cate_idx);
}
