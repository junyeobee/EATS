package com.eats.admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.eats.admin.model.BannerDTO;

public interface BannerService {

	public List<BannerDTO> bannerList();
	
	public int bannerInsert(BannerDTO dto,MultipartFile menuImg,String realpath);
	
	
}
