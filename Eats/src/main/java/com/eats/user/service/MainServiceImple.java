package com.eats.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.user.MainMapper;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;

@Service
public class MainServiceImple implements MainService {
	@Autowired
	public MainMapper mp;

	@Override
	public List<CateKeyDTO> getCateKey() {
		List<CateKeyDTO> list = mp.getCateKey();
		return list;
	}
	
	@Override
	public List<String> getValueList(int cate_key_idx) {
		List<String> list = mp.getValueList(cate_key_idx);
		return list;
	}
}
