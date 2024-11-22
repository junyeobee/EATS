package com.eats.controller.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.CategoryDTO;
import com.eats.store.service.StoreCateService;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StoreCateController {


    @Autowired
    private StoreCateService service;
    
    @GetMapping("/store/storeCateOne")
    public ModelAndView storeCateOne(HttpServletRequest req) {
    	
        HttpSession session = req.getSession();
        
        Integer storeidx = (Integer) session.getAttribute("storeIdx");
        int store_idx = (storeidx != null) ? storeidx : 0;
        System.out.println("store_idx 값: " + store_idx);

        if(store_idx == 0) {

            String msg = "로그인이 필요합니다.";
            String goPage = "/storeLogin";
        
            ModelAndView mav = new ModelAndView();
            mav.addObject("msg", msg);
            mav.addObject("goPage", goPage);
            mav.setViewName("store/common/basicMsg");
            return mav;
        }

    	//페이지로드시 로그인한 매장의 store_idx로 category테이블에 데이터 있는지 확인
    	//int store_cate_check = service.storeTagCheck(store_idx);

    	ModelAndView mav = new ModelAndView();
    	
    	//category테이블에 등록한 값이 있으면 가져와야함 시작
    	List<CategoryDTO> cate_data = service.storeCateOneData(store_idx); 
        System.out.println("cate_data: " + cate_data);
    	mav.addObject("cate_data", cate_data);  // 대메뉴
    	//category테이블에 등록한 값이 있으면 가져와야함 마침
    	
    	//관리자가 등록해놓은 카테고리와 태그값 가져오는 부분 시작
    	List<CateKeyDTO> cateBigTitle = service.storeCateOneBigList(); 
    	Map<Integer, List<CateValueDTO>> cateSmallData = new HashMap<>();

    	for (CateKeyDTO dto : cateBigTitle) {
    	    int cate_key_idx = dto.getCate_key_idx();  // 대메뉴
    	    
    	    System.out.println("cate_key_idx"+cate_key_idx);
    	    
    	    //특징, 태그 같이 사용
    	    List<CateValueDTO> small_option_list = service.storeCateSmallList(cate_key_idx);  //소메뉴 
    	    cateSmallData.put(Integer.valueOf(cate_key_idx), small_option_list);
    	}
    	
    	mav.addObject("cateBigTitle", cateBigTitle);  // 대메뉴
    	mav.addObject("cateSmallData", cateSmallData);  // 소메뉴
    	//관리자가 등록해놓은 카테고리와 태그값 가져오는 부분 마침
    	mav.addObject("store_idx", store_idx);

    	mav.setViewName("store/storeCate/storeCateOne"); 
    	return mav;
    }

    
    @GetMapping("/store/storeCateTwo")
    public ModelAndView storeCateTwo(HttpServletRequest req) {
    	
        HttpSession session = req.getSession();
        
        Integer storeidx = (Integer) session.getAttribute("storeIdx");
        int store_idx = (storeidx != null) ? storeidx : 0;
        System.out.println("store_idx 값: " + store_idx);

        if(store_idx == 0) {

            String msg = "로그인이 필요합니다.";
            String goPage = "/storeLogin";
        
            ModelAndView mav = new ModelAndView();
            mav.addObject("msg", msg);
            mav.addObject("goPage", goPage);
            mav.setViewName("store/common/basicMsg");
            return mav;
        }

    	ModelAndView mav = new ModelAndView();
    	
    	//category테이블에 등록한 값이 있으면 가져와야함 시작
    	List<CategoryDTO> cate_data = service.storeCateTwoData(store_idx); 
        System.out.println("cate_data: " + cate_data);
    	mav.addObject("cate_data", cate_data);  // 대메뉴
    	//category테이블에 등록한 값이 있으면 가져와야함 마침
    	
    	//관리자가 등록해놓은 카테고리와 태그값 가져오는 부분 시작
    	List<CateKeyDTO> cateBigTitle = service.storeCateTwoBigList(); 
    	Map<Integer, List<CateValueDTO>> cateSmallData = new HashMap<>();

    	for (CateKeyDTO dto : cateBigTitle) {
    	    int cate_key_idx = dto.getCate_key_idx();  // 대메뉴
    	    
    	    System.out.println("cate_key_idx"+cate_key_idx);

    	    //특징, 태그 같이 사용
    	    List<CateValueDTO> small_option_list = service.storeCateSmallList(cate_key_idx);  //소메뉴 
    	    cateSmallData.put(Integer.valueOf(cate_key_idx), small_option_list);
    	}
    	
    	mav.addObject("cateBigTitle", cateBigTitle);  // 대메뉴
    	mav.addObject("cateSmallData", cateSmallData);  // 소메뉴
    	//관리자가 등록해놓은 카테고리와 태그값 가져오는 부분 마침
    	mav.addObject("store_idx", store_idx);

    	mav.setViewName("store/storeCate/storeCateTwo"); 
    	return mav;
    }
    

    
    @PostMapping("/store/storeTagSave")
    public ModelAndView storeTagSave( 
        @RequestParam(value = "store_idx") int store_idx,
        @RequestParam(value = "cate_level") int cate_level,
        @RequestParam(value = "big_cate_key", required = false) List<Integer> big_cate_key,
        @RequestParam(value = "small_cate_key", required = false) List<Integer> small_cate_key,
        @RequestParam(value = "store_cate_idx", required = false) List<Integer> cate_key) {  

    	//태그관리, 특징관리에서 같이 사용
    	
        int result = 0;
        CategoryDTO cate_dto = new CategoryDTO();

        for (int i = 0; i < small_cate_key.size(); i++) {
            Integer big_cate = big_cate_key.get(i);
            Integer small_cate = small_cate_key.get(i);

            System.out.println("store_idx="+store_idx);
            System.out.println("big_cate="+big_cate);
            System.out.println("small_cate="+small_cate);
            
            cate_dto.setStore_idx(store_idx);
            cate_dto.setCate_key_idx(big_cate);
            cate_dto.setCate_value_idx(small_cate);
            
            //로그인한 매장에서 저장한 태그의 경우 insert 안하게
            //category 테이블에서 가져온 값이 아니고 select box 선택한 경우는 cate_key(즉 store_cate_key)존재안함
            if(cate_key.get(i) == null) {
                result += service.storeTagInsert(cate_dto);
                
            //아무것도 처리 안했어도 잘 넘어가지게
            }else {
                result += 1;
            	
            }
            System.out.println("store_idx:" + store_idx+"big_cate:" + big_cate+"small_cate:" + small_cate);
        }
        
        ModelAndView mav = new ModelAndView();
        String msg = "";
        String goPage = "";
        
        
        if(cate_level == 1) {
            goPage = "storeCateOne";
        }else {
            goPage = "storeCateTwo";
        }
        
        // 결과 메시지
        if (result > 0) {
            msg = "태그 등록되었습니다.";
            
        }else {
            msg = "태그가 저장되지 않았습니다. 다시 저장해주세요.";
        }
        
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    }

    @GetMapping("/store/storeTagDel")
    @ResponseBody  // AJAX 요청에 응답을 JSON 형식으로 보내기 위해 @ResponseBody 사용
    public String storeTagDel( 
    	@RequestParam(value = "store_cate_key") int store_cate_key) {
    	
    	//태그관리, 특징관리에서 같이 사용
    	
        CategoryDTO cate_dto = new CategoryDTO();
        cate_dto.setCate_idx(store_cate_key);

        int result = service.storeCateDel(store_cate_key);

        String msg = result > 0 ? "태그 삭제 완료" : "태그가 삭제되지 않았습니다.";
        return msg;
    }
}
