package com.eats.controller.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreInfoUpdateDTO;
import com.eats.store.service.StoreInfoUpdateReqService;

@Controller
public class EtcController {

    @Autowired
    private StoreInfoUpdateReqService service;
    
    @GetMapping("/store/storeInfoUpdateReq")
    public ModelAndView storeInfoUpdateReq(@SessionAttribute(value = "store_idx", required = false) Integer store_idx) {
    	//정보수정신청 페이지 접속시 로그인한 매장의 매장데이터 불러옴
        
        // store_idx가 null이면 기본값을 1로 설정
        if (store_idx == null) {
            store_idx = 1;  // 기본값 설정
        }

        StoreDTO data = service.storeData(store_idx);
        
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data);
        System.out.println(data.toString());
        mav.setViewName("store/etc/storeInfoUpdateReq");

        return mav;
    }
    
    @PostMapping("/store/storeInfoUpdateReqSave")
    public ModelAndView storeInfoUpdateReqSave(StoreInfoUpdateDTO dto) {
    	
    	/*
    	System.out.println("tttttttt");
    	System.out.println("idx:"+dto.getStore_idx());
    	System.out.println("addr:"+dto.getSu_addr());
    	System.out.println("ceo:"+dto.getSu_ceo());
    	System.out.println("daddr:"+dto.getSu_daddr());
    	System.out.println("suidx:"+dto.getSu_idx());
    	System.out.println("name:"+dto.getSu_name());
    	System.out.println("reason:"+dto.getSu_reason());
    	System.out.println("state:"+dto.getSu_state());
    	System.out.println("tel:"+dto.getSu_tel());
    	*/
    	
        int result = service.StoreInfoUpdateInsert(dto);
    	System.out.println("fffffff");
    	
        String msg = result > 0 ? "정보수정신청 완료되었습니다." : "정보수정신청 되지 않았습니다. 다시 신청해주세요.";
        String goPage = "storeInfoUpdateReq";
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    	
    }
}
