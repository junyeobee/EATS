package com.eats.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.admin.TagMapper;
import com.eats.user.model.CateValueDTO;

@Service
public class TagServiceImple implements TagService {
	@Autowired
	private TagMapper tm;

	@Override
	public int addCateValue(CateValueDTO dto) {
		int count = tm.addCateValue(dto);
		return count;
	}

}
