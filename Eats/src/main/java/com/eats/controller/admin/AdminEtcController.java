package com.eats.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eats.admin.model.AdminStoreInfoUpdateDTO;
import com.eats.admin.model.RevDelDTO;
import com.eats.admin.model.ReviewDeleteDTO;
import com.eats.admin.service.AdminReviewService;
import com.eats.admin.service.AdminStoreInfoService;
import com.eats.store.model.StoreImgDTO;

@Controller
public class AdminEtcController {

    @Autowired
    private AdminReviewService service;

	@GetMapping("/admin/main")
    public String main() {
        return "admin/index";
    }

	@GetMapping("/admin/userList")
    public String userList() {
        return "admin/adminEtc/userList";
    }

	@GetMapping("/admin/reviewDelOkList")
    public ModelAndView reviewDelOkList() {

		List<ReviewDeleteDTO> lists = service.adminRevDelList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		//mav.addObject("pageStr", pageStr);
		
		mav.setViewName("admin/adminEtc/reviewDelOkList");
		return mav;
        //return "admin/adminEtc/reviewDelOkList";
    }

	@PostMapping("/admin/reviewDelete")
    public ModelAndView reviewDelete(
    			@RequestParam("rv_idx") int rv_idx, 
    			@RequestParam("rev_state") int rev_state, 
    			@RequestParam("del_state") int del_state
    		) {

		

		ReviewDeleteDTO ReviewDeleteDTO = new ReviewDeleteDTO();
		ReviewDeleteDTO.setRev_idx(rv_idx);
		ReviewDeleteDTO.setRev_state(rev_state);
		
		
		ReviewDeleteDTO.setDel_state(del_state); 
        
		int result = 0;
		System.out.println("1111");
        result += service.review_stateChange(ReviewDeleteDTO);
		System.out.println("2222");
        result += service.revDel_stateChange(ReviewDeleteDTO);
		System.out.println("3333");
        
        String del_state_value = "";
        
        if(del_state == 1 ) {
        	del_state_value = "승인";
        }else {
        	del_state_value = "반려";        	
        }
    	
        String msg = result > 1 ? "리뷰삭제"+del_state_value+" 처리되었습니다." : "리뷰 처리되지 않았습니다. 다시 클릭해주세요.";
        String goPage = "reviewDelOkList";
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    }
	    
}
