package com.eats.controller.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.MenuDTO;
import com.eats.store.service.storeMenuService;

import jakarta.annotation.Resource;

@Controller
public class StoreMenuController {

	@Autowired
	private storeMenuService service;

	

	@GetMapping("storeMenuList")
	public ModelAndView storeCateList(@RequestParam(value="idx", required=false, defaultValue = "0")Integer idx) {

		List<MenuDTO> lists = service.storeCateList();
		ModelAndView mav = new ModelAndView();

		List<MenuDTO> menu = service.storeMenuList(idx);
		
		mav.addObject("menu", menu);
		mav.addObject("lists", lists);
		
		mav.setViewName("store/menu/menuList");

		return mav;
	}
	
	
	@ResponseBody
	@GetMapping("/menuListAjax")
	public List<MenuDTO> storeMenuAjax(@RequestParam(value="idx", required=false, defaultValue = "0")Integer idx){
		List<MenuDTO> menu = service.storeMenuList(idx);
		return menu;
	}
	
	
	@GetMapping("/storeMenuInsert")
	public String storeMenuInsert(){
		return "store/menu/menuInsert";
	}
	
	
	@GetMapping("/menuUpdatePage")
	public String menuUpdatePage(){
		
		return "store/menu/menuUpdate";
	}
	
	@GetMapping("/StoreMenuInsert")
	public String StoreMenuInsert(){
		
		return "store/menu/menuInsert";
	}
	
	
	//메뉴 등록
	@PostMapping("/StoreMenuInsert")
	public ModelAndView StoreMenuInsert(MenuDTO dto){
		
		int result = service.insertMenu(dto);
		
		String msg=result>0?"메뉴가 등록되었습니다.":"메뉴등록에 실패했습니다.";	
		String goUrl="";
		
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("msg",msg);
		mav.addObject("goUrl","storeMenuList");
		mav.setViewName("store/menu/menuMsg");

		
		return mav;
		
	}
	

}
