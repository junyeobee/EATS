package com.eats.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.user.PayMapper;
import com.eats.user.model.PayDTO;

@Service
public class PayServiceImple implements PayService {
	
	@Autowired
	PayMapper mapper;
	@Override
	public PayDTO storeInfo(Integer userIdx, Integer storeIdx) {
		
		PayDTO dto= mapper.storeInfo(userIdx, storeIdx);
		return dto;
	}

}
