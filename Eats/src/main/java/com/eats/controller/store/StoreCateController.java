package com.eats.controller.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.service.StoreCateService;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class StoreCateController {


    @Autowired
    private StoreCateService service;
    
    @GetMapping("/store/storeTag")
    public ModelAndView storeTag(@SessionAttribute(value = "store_idx", required = false) Integer store_idx) {
		
        // store_idx가 null이면 기본값을 1로 설정
        if (store_idx == null) {
            store_idx = 1;  // 기본값 설정
        }
        
        List<CateKeyDTO> list_key = service.storeCateOneBigList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list_key", list_key);
		

		System.out.println("111111");
		
		Map<String, Object> listMap = new HashMap<>();
		for (CateKeyDTO dto : list_key) {
		    int cate_key_idx = dto.getCate_key_idx();
		    

	        List<CateValueDTO> list_value = service.storeCateOneSmallList(cate_key_idx);

			System.out.println("222222");
	        // "list_value_" + cate_key_idx를 키로 저장
	        listMap.put("list_value_" + cate_key_idx, list_value);
	        //mav.addObject("list_value_" + cate_key_idx, list_value);
		}
		
		
		
		/*
		 * 확인1-1
		// List<String>으로 main_arr을 처리
		List<String> mainArr = new ArrayList<>();
		for (CateKeyDTO dto : list_key) {
		    mainArr.add(dto.getCate_key_name());  // cate_key_name을 배열에 추가
		}

		// mainArr을 모델에 담아서 JSP로 전달
		mav.addObject("mainArr", mainArr);
		*/
		
		/*
		확인5-1
		StringBuilder mainArr = new StringBuilder();
		for (CateKeyDTO dto : list_key) {
		    if (mainArr.length() > 0) {
		        mainArr.append(", "); // 구분자 추가
		    }
		    mainArr.append(dto.getCate_key_name());
		}
		mav.addObject("mainArr", mainArr.toString());
		*/



		System.out.println("333333");
		// Map을 모델에 담아서 JSP로 전달
		mav.addObject("listMap", listMap);
        mav.setViewName("store/storeCate/storeTag"); // JSP 이름

        return mav;
    }
}
