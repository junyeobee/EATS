package com.eats.controller.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.HYMenuCateDTO;
import com.eats.store.model.HYMenuDTO;
import com.eats.user.model.ReservationDTO;
import com.eats.user.service.UserReviewService;

@Controller
public class MyPlateController {
	
	@Autowired
	private UserReviewService reviewService;

	@GetMapping("/user/writeReview")
	public ModelAndView goWriteReview(
			@RequestParam(value="reserve_idx", required=true)int reserve_idx) {
		
		Map storeInfo = reviewService.getStoreInfoByReserveIdx(reserve_idx);
		ReservationDTO reserveDTO = reviewService.getReserveInfo(reserve_idx);
		List<HYMenuCateDTO> menuCateList = reviewService.getMenuCateListByReserveIdx(reserve_idx);
		List<HYMenuDTO> menuList = reviewService.getMenuListByReserveIdx(reserve_idx);
		List<String> tagList = reviewService.tagList();
		
		ModelAndView mv=new ModelAndView();
		
		if(storeInfo==null || storeInfo.size()==0 || reserveDTO==null || menuCateList==null || menuCateList.size()==0 
				|| menuList==null || menuList.size()==0 || tagList==null || tagList.size()==0 ) {
			mv.addObject("errorMsg", "잘못된 접근입니다.");
			mv.setViewName("user/myplate/error");
		}else {
			mv.addObject("storeInfo", storeInfo);
			mv.addObject("reserveDTO", reserveDTO);
			mv.addObject("menuCateList", menuCateList);
			mv.addObject("menuList", menuList);
			mv.addObject("tagList", tagList);
			mv.setViewName("user/myplate/writeReview");
		}
		return mv;
	}
	
	@GetMapping("/user/myPlate")
	public String goMyPlate() {
		return "user/myplate/main";
	}
}