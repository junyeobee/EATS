package com.eats.controller.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreInfoUpdateDTO;
import com.eats.store.service.StoreInfoUpdateReqService;

@Controller
public class EtcController {

    @Autowired
    private StoreInfoUpdateReqService service;
    
    /*
	@GetMapping("/store/storeInfoUpdateReq")
    public String storeInfoUpdateReq() {
        return "store/etc/storeInfoUpdateReq";
    }
    */
    


    @GetMapping("/store/storeInfoUpdateReq")
    public ModelAndView storeInfoUpdateReq() {
    	//정보수정신청 페이지 접속시 저장된 매장 정보 불러옴
    	StoreDTO data = service.storeData();
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data);
        System.out.println(data.toString());
        mav.setViewName("store/etc/storeInfoUpdateReq");

        return mav;
    }
    
    
    @PostMapping("/store/storeInfoUpdateReqSave")
    public ModelAndView storeInfoUpdateReqSave(StoreInfoUpdateDTO dto) {
    	
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
