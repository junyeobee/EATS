package com.eats.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
import com.eats.store.model.StoreImgDTO;
import com.eats.store.model.StoreJoinDTO;

@Controller
public class AdminUserController {

    @Autowired
    private AdminUserService service;

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

}
