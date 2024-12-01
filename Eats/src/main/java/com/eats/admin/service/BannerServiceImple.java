package com.eats.admin.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

	
	
	@Override
	public int bannerInsert(BannerDTO dto,MultipartFile menuImg,String realpath) {
		
		try {
			
		if(menuImg!= null && !menuImg.isEmpty()) {
			
			String filename= System.currentTimeMillis() + "_" + menuImg.getOriginalFilename();
			File directory = new File(realpath);
			
			if(!directory.exists()) {
				
				directory.mkdirs();
			}
			
			String filepath = realpath + "img/"+ filename;
			System.out.println("서비스배너"+filepath);
			menuImg.transferTo(new File(filepath));
			
			dto.setBanner_img(filename);
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.bannerInsert(dto);
	
	}
	
	@Override
	public int deleteBanner(List<Integer> bannerIdx) {
		int result = mapper.deleteBanner(bannerIdx);
		return result;
	}
	
	
	
	@Override
	public int bannerUpdate( BannerDTO dto) {
		
		int result = mapper.bannerUpdate(dto);
		
		return result;
	}

	
	@Override
	public BannerDTO bannerInfo(Integer bannerIdx) {
		
		BannerDTO dto= mapper.bannerInfo(bannerIdx);
		
		return dto;
	}

}


