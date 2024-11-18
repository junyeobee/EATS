package com.eats.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.StoreCateMapper;
import com.eats.store.model.CategoryDTO;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;

@Service
public class StoreCateServiceImple implements StoreCateService {
	
	@Autowired
	private StoreCateMapper mapper;
	
	@Override
	public List<CateKeyDTO> storeCateOneBigList() {
		
		List<CateKeyDTO> lists = mapper.storeCateOneBigList();
		return lists;
	}

	@Override
	public List<CateKeyDTO> storeCateTwoBigList() {
		
		List<CateKeyDTO> lists = mapper.storeCateTwoBigList();
		return lists;
	}

	@Override
	public List<CateValueDTO> storeCateSmallList(int cate_key_idx) {
		
		List<CateValueDTO> lists = mapper.storeCateSmallList(cate_key_idx);
		return lists;
	}

	@Override
	public int storeTagInsert(CategoryDTO dto) {
		int count = mapper.storeTagInsert(dto);
		return count;
	}

	/*
	@Override
	public int storeTagCheck(int store_idx) {
		int count = mapper.storeTagCheck(store_idx);
		return count;
	}
	*/

	@Override
	public List<CategoryDTO> storeCateOneData(int store_idx) {
		List<CategoryDTO> lists = mapper.storeCateOneData(store_idx);
		return lists;
	}
	@Override
	public List<CategoryDTO> storeCateTwoData(int store_idx) {
		List<CategoryDTO> lists = mapper.storeCateTwoData(store_idx);
		return lists;
	}
	
	@Override
	public int storeCateDel(int store_cate_idx) {
		int count = mapper.storeCateDel(store_cate_idx);
		return count;
	}

}
