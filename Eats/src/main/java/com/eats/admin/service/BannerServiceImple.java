package com.eats.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.admin.model.BannerDTO;
import com.eats.mapper.admin.BannerMapper;

@Service
public class BannerServiceImple implements BannerService {
	
	@Autowired
	BannerMapper mapper;
	
	@Override
	public List<BannerDTO> bannerList() {
		List<BannerDTO> lists= mapper.bannerList();
		
		return lists;
	}

}
