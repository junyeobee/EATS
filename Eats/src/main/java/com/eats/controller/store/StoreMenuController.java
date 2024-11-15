package com.eats.controller.store;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.MenuDTO;
import com.eats.store.model.MenuImgDTO;
import com.eats.store.service.storeMenuService;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class StoreMenuController {

	@Autowired
	private storeMenuService service;

	

	private String fileRealName = "";
	private String extension = "";
	private String fileNameWithTime = "";
	private String goUrl="";

	private DateTimeFormatter timestamp = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
	String timestampDate = LocalDateTime.now().format(timestamp);

	/* private String db_filePath = "/store/"; */

	
	
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

	
	@GetMapping("/menuUpdatePage/{menu_idx}")
	public String menuUpdatePage(@RequestParam(value="menu_idx", required = false)Integer menuIdx) {

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
		public ModelAndView StoreMenuInsertOk(
				 @RequestParam("m_cate_idx") int mCateIdx,
		            @RequestParam("menu_name") String menuName,
		            @RequestParam("menu_info") String menuInfo,
		            @RequestParam("menu_price") int menuPrice,
		            @RequestParam("menu_preorder") Integer menuPreorder,
		            @RequestParam("menu_img") MultipartFile menuImg,
		            HttpServletRequest req
				
				) {

			String realpath = req.getServletContext().getRealPath("/");
			
	        ModelAndView mav = new ModelAndView();
	        
	        MenuDTO menuDTO = new MenuDTO();
	        
	        menuDTO.setM_cate_idx(mCateIdx);
	        menuDTO.setMenu_name(menuName);
	        menuDTO.setMenu_info(menuInfo);
	        menuDTO.setMenu_price(menuPrice);
	        menuDTO.setMenu_preorder(menuPreorder);
	      

	        try {
	            int result = service.insertMenu(menuDTO, menuImg, realpath);
	            if (result > 0) {
	                mav.addObject("msg", "메뉴가 등록되었습니다.");
	            } else {
	                mav.addObject("msg", "메뉴 등록에 실패했습니다.");
	            }
	        } catch (IOException e) {
	            mav.addObject("msg", "파일 저장 중 오류가 발생했습니다.");
	            e.printStackTrace();
	        }
	        
	        
	        mav.addObject("goUrl","storeMenuList");
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

		mav.addObject("msg", msg);
		mav.addObject("goUrl", "storeMenuList");
		mav.setViewName("store/menu/menuMsg");

		return mav;

	}

}
