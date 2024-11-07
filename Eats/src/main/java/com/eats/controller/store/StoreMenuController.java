package com.eats.controller.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.MenuDTO;
import com.eats.store.service.storeMenuService;

@Controller
public class StoreMenuController {

	@Autowired
	private storeMenuService service;

	/*
	 * @GetMapping("storeMenuListPage") public String storeMenuList(){
	 * 
	 * return"store/menu/menuList";
	 * 
	 * }
	 */

	@GetMapping("storeMenuList")
	public ModelAndView storeCateList() {

		List<MenuDTO> lists = service.storeCateList();
		ModelAndView mav = new ModelAndView();

		List<MenuDTO> menu = service.storeMenuList();

		mav.addObject("menu", menu);
		mav.addObject("lists", lists);
		
		mav.setViewName("store/menu/menuList");

		return mav;
	}

}
