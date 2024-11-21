package com.eats.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eats.admin.model.AdminStoreInfoUpdateDTO;
import com.eats.admin.model.AdminUserDTO;
import com.eats.admin.model.RevDelDTO;
import com.eats.admin.model.ReviewDeleteDTO;
import com.eats.admin.service.AdminReviewService;
import com.eats.admin.service.AdminStoreInfoService;
import com.eats.admin.service.AdminStoreService;
import com.eats.admin.service.AdminUserService;
import com.eats.store.model.StoreGridAllDTO;
import com.eats.store.model.StoreImgDTO;
import com.eats.store.model.StoreJoinDTO;
import com.eats.store.model.StoreTimeDTO;

@Controller
public class AdminUserController {

    @Autowired
    private AdminUserService service;

    @Autowired
    private AdminReviewService re_service;
    /*
	@GetMapping("/admin/main")
    public ModelAndView main() {
		List<AdminUserDTO> lists = service.userList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		
		mav.setViewName("admin/index");
		return mav;
    }
    */

	@GetMapping("/admin/userList")
    public ModelAndView userList() {

		List<AdminUserDTO> lists = service.userList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		
		mav.setViewName("admin/adminEtc/userList");
		return mav;
    }

	@GetMapping("/admin/userDetail")
    public ModelAndView userDetail(@RequestParam("user_idx") int user_idx, Model model) {
		
	    model.addAttribute("user_idx", user_idx); // store_idx 값을 모델에 추가
	    
	    AdminUserDTO data = service.userDetail(user_idx);
        ModelAndView mav = new ModelAndView();
        
        System.out.println("tttt");
        System.out.println(data.getJoin_method());
        
        mav.addObject("data", data);
        //System.out.println(data.toString());
        mav.setViewName("admin/adminEtc/userDetail");

        return mav;
    }
	
	@GetMapping("/admin/reviewDelOkList")
    public ModelAndView reviewDelOkList() {
		
		List<ReviewDeleteDTO> review_lists = re_service.adminRevDelList();

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", review_lists);
		
		mav.setViewName("admin/adminEtc/reviewDelOkList");
		return mav;
    }

    @PostMapping("/admin/reviewDelete")
    @ResponseBody  // 이 애너테이션을 추가하여 JSON 응답을 바로 반환하도록 설정, 이거 안써주면 get방식으로 반환한다고 에러남
    public ModelAndView storeGridDelete(
    			@RequestParam("rv_idx") int rv_idx, 
    			@RequestParam("rev_state") int rev_state, 
    			@RequestParam("del_state") int del_state
    		) {
    	
    	ReviewDeleteDTO dto = new ReviewDeleteDTO();
        // DTO 객체에서 store_idx 값 추출
        dto.setRev_idx(rv_idx);
        dto.setRev_state(rv_idx);
        dto.setDel_state(del_state);

		int result = 0;
     
		result += re_service.review_stateChange(dto);
		result += re_service.revDel_stateChange(dto);


        String msg = result > 0 ? "승인되었습니다." : "반려되었습니다.";
        String goPage = "reviewDelOkList";
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    }
	

}
