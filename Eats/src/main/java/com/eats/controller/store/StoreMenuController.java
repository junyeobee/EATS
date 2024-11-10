package com.eats.controller.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView storeCateList(@RequestParam(value = "idx", required = false, defaultValue = "0") Integer idx) {

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
	public List<MenuDTO> storeMenuAjax(@RequestParam(value = "idx", required = false, defaultValue = "0") Integer idx) {
		List<MenuDTO> menu = service.storeMenuList(idx);
		return menu;
	}

	@GetMapping("/storeMenuInsert")
	public String storeMenuInsert() {
		return "store/menu/menuInsert";
	}

	@GetMapping("/menuUpdatePage")
	public String menuUpdatePage() {

		return "store/menu/menuUpdate";
	}

	@GetMapping("/StoreMenuInsert")
	public ModelAndView StoreMenuInsert() {
		List<MenuDTO> lists = service.storeCateList();

		ModelAndView mav = new ModelAndView();

		mav.addObject("lists", lists);
		mav.setViewName("store/menu/menuInsert");
		return mav;
	}

	// 메뉴 등록
	@PostMapping("/StoreMenuInsertOk")
	public ModelAndView StoreMenuInsertOk(MenuDTO dto) {

		int result = service.insertMenu(dto);

		String msg = result > 0 ? "메뉴가 등록되었습니다." : "메뉴등록에 실패했습니다.";

		ModelAndView mav = new ModelAndView();

		mav.addObject("msg", msg);
		mav.addObject("goUrl", "storeMenuList");
		mav.setViewName("store/menu/menuMsg");

		return mav;

	}

	// 카테고리 관리
	@GetMapping("/storeMenuCate")
	public ModelAndView storeMenuCate() {

		List<MenuDTO> lists = service.storeCateList();

		ModelAndView mav = new ModelAndView();

		mav.addObject("lists", lists);
		mav.setViewName("store/menu/menuCate");

		return mav;
	}

	@PostMapping("/deleteMenuCate")
	public ModelAndView deleteMenuCate(
			@RequestParam(value = "m_cate_name", required = false, defaultValue = "") String cateName) {
		int result = service.deleteMenuCate(cateName);

		String msg = result > 0 ? "카테고리가 삭제되었습니다." : "삭제 실패";
		ModelAndView mav = new ModelAndView();

		mav.addObject("msg", msg);
		mav.addObject("goUrl", "storeMenuCate");

		mav.setViewName("store/menu/menuMsg");

		return mav;

	}

	@PostMapping("/insertMenuCate")
	public ModelAndView insertMenuCate(
			@RequestParam(value = "m_cate_name", required = false, defaultValue = "") String cateName) {

		int result = service.insertCate(cateName);

		String msg = result > 0 ? "카테고리가 등록되었습니다." : "카테고리 등록에 실패했습니다.";
		ModelAndView mav = new ModelAndView();

		mav.addObject("msg", msg);
		mav.addObject("goUrl", "storeMenuCate");
		mav.setViewName("store/menu/menuMsg");

		return mav;

	}

	@PostMapping("/deleteMenu")
	public ModelAndView deleteMenu(@RequestParam(value = "menu_idx", required = true) List<Integer> menuList) {

		ModelAndView mav = new ModelAndView();
		int result = service.deleteMenu(menuList);

		String msg = result > 0 ? "선택한 메뉴가 삭제되었습니다." : "메뉴 삭제가 실패했습니다.";
		
		mav.addObject("msg",msg);
		mav.addObject("goUrl","storeMenuList");
		mav.setViewName("store/menu/menuMsg");
		
		return mav;
		

	}

}
