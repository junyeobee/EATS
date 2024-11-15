package com.eats.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.StoreCateMapper;
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
	public List<CateValueDTO> storeCateOneSmallList(int cate_key_idx) {
		
		List<CateValueDTO> lists = mapper.storeCateOneSmallList(cate_key_idx);
		return lists;
	}

}
