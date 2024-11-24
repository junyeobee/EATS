package com.eats.controller.store;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
import jakarta.servlet.http.HttpSession;

@Controller
public class StoreMenuController {

	@Autowired
	private storeMenuService service;

	private String fileRealName = "";
	private String extension = "";
	private String fileNameWithTime = "";
	private String goUrl = "";

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
	public ModelAndView menuUpdatePage(@PathVariable("menu_idx") Integer menuIdx) {
		
		List<MenuDTO> lists = service.storeCateList();
		MenuDTO info = service.updateMenuInfo(menuIdx);
		ModelAndView mav = new ModelAndView();

		mav.addObject("lists", lists);
		mav.addObject("info", info);

		mav.setViewName("store/menu/menuUpdate");

		return mav;
		
	}

	
	
	
	// 메뉴 수정완료
	@PostMapping("/menuUpdateOk")
	public ModelAndView menuUpdateOk(
			@RequestParam("menu_idx") Integer menuIdx, @RequestParam("m_cate_idx") int mCateIdx,
			@RequestParam("menu_name") String menuName, @RequestParam("menu_info") String menuInfo,
			@RequestParam("menu_price") int menuPrice, @RequestParam("menu_preorder") Integer menuPreorder, 
			@RequestParam("menu_img") MultipartFile menuImg, 
			@RequestParam(value="oldName")String oldFileName,
			HttpServletRequest req) {

		String realpath = req.getServletContext().getRealPath("/"); 
		 MenuDTO menuDTO = new MenuDTO();
		 ModelAndView mav = new ModelAndView();
		 try {
		      
		        if (menuImg != null && !menuImg.isEmpty()) {
		          
		        	
		            String fileName = System.currentTimeMillis() + "_" + menuImg.getOriginalFilename();
		            File directory = new File(realpath);
		            if (!directory.exists()) {
		                directory.mkdirs(); 
		            }

		            // 기존 이미지 삭제
		            if (oldFileName != null && !oldFileName.isEmpty()) {
		                File oldFile = new File(realpath + "img/menu/" + oldFileName);
		                if (oldFile.exists()) {
		                    oldFile.delete();
		                }
		            }
		            
		            String filePath = realpath + "img/menu/" + fileName;

		            
		            menuImg.transferTo(new File(filePath)); 

		            menuDTO.setMenu_img(fileName);
		        
		            
		        } else {
		        
		        	menuDTO.setMenu_img(oldFileName);
		           

		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    	mav.addObject("msg", "메뉴 수정 중 오류가 발생했습니다.");
		    }
		
		
		
		    menuDTO.setMenu_idx(menuIdx); 
		    menuDTO.setM_cate_idx(mCateIdx);
		    menuDTO.setMenu_name(menuName);
		    menuDTO.setMenu_info(menuInfo);
		    menuDTO.setMenu_price(menuPrice);
		    menuDTO.setMenu_preorder(menuPreorder);

		oldFileName = menuDTO.getMenu_img();
		
		System.out.println(oldFileName);


		try {
			
			int result = service.updateMenu(menuDTO);
			if (result > 0) {
				mav.addObject("msg", "메뉴가 수정되었습니다.");
			} else {
				mav.addObject("msg", "메뉴 수정에 실패했습니다.");
			}
		} catch (Exception e) {
		
			e.printStackTrace();
			mav.addObject("msg", "메뉴 수정 중 오류가 발생했습니다.");
		}

		mav.addObject("goUrl", "storeMenuList"); 
		mav.setViewName("store/menu/menuMsg"); 
		return mav;
	}

	
	
	
	// 메뉴 등록 페이지
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
	public ModelAndView StoreMenuInsertOk(@RequestParam("m_cate_idx") int mCateIdx,
			@RequestParam("menu_name") String menuName, @RequestParam("menu_info") String menuInfo,
			@RequestParam("menu_price") int menuPrice, @RequestParam("menu_preorder") Integer menuPreorder,
			@RequestParam("menu_img") MultipartFile menuImg, HttpServletRequest req

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
	public ModelAndView deleteMenuCate(@RequestParam(value = "m_cate_idx", required = true) int idx) {

		int result = service.deleteMenuCate(idx);

		String msg = result > 0 ? "카테고리가 삭제되었습니다." : "삭제 실패";
		ModelAndView mav = new ModelAndView();

		mav.addObject("msg", msg);
		mav.addObject("goUrl", "storeMenuCate");

		mav.setViewName("store/menu/menuMsg");

		return mav;

	}

	
	
	//메뉴 카테고리 등록
	@PostMapping("/insertMenuCate")
	public ModelAndView insertMenuCate(
			@RequestParam(value = "m_cate_name", required = false, defaultValue = "") String cateName,
			@RequestParam(value = "m_cate_info", required = false, defaultValue = "") String mCateInfo,
			
			HttpSession session) {
		
		int storeIdx = (int)session.getAttribute("storeIdx");
		System.out.println("스토어 번호!!!:"+storeIdx);
		
		int result = service.insertCate(storeIdx, cateName, mCateInfo);
		
		

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
