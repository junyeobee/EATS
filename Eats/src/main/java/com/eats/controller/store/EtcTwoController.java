package com.eats.controller.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreInfoUpdateDTO;

@Controller
public class EtcTwoController {

	@GetMapping("/store/storeTime")
    public ModelAndView storeTime(@SessionAttribute(value = "store_idx", required = false) Integer store_idx) {
    	//정보수정신청 페이지 접속시 로그인한 매장의 매장데이터 불러옴
        
        // store_idx가 null이면 기본값을 1로 설정
        if (store_idx == null) {
            store_idx = 1;  // 기본값 설정
        }

        //StoreDTO data = service.storeData(store_idx);
        
        ModelAndView mav = new ModelAndView();
        //mav.addObject("data", data);
        //System.out.println(data.toString());
        mav.setViewName("store/etc/storeTime");

        return mav;
    }

	@GetMapping("/store/storeWork")
    public ModelAndView storeWork(@SessionAttribute(value = "store_idx", required = false) Integer store_idx) {
        
        // store_idx가 null이면 기본값을 1로 설정
        if (store_idx == null) {
            store_idx = 1;  // 기본값 설정
        }

        //StoreDTO data = service.storeData(store_idx);
        
        ModelAndView mav = new ModelAndView();
        //mav.addObject("data", data);
        //System.out.println(data.toString());
        mav.setViewName("store/etc/storeWork");

        return mav;
    }
    
}
