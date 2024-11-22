package com.eats.mapper.admin;

import java.util.List;

import com.eats.admin.model.BannerDTO;

public interface BannerMapper {
	
	public List<BannerDTO> bannerList();
	
	public int bannerInsert(BannerDTO dto);
	
	public int deleteBanner(List<Integer> bannerIdx);
	
	public int bannerUpdate(BannerDTO dto);
	
	
	

}
