package com.eats.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eats.admin.model.BannerDTO;
import com.eats.admin.service.BannerService;

@Controller
public class BannerController {

	@Autowired
	BannerService service;
	@GetMapping("/admin/banner")
	public ModelAndView bannerList() {
		
		List<BannerDTO> lists = service.bannerList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("lists",lists);
		mav.setViewName("admin/banner/banner");
		

		return mav ;
	}

}
