package com.eats.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.admin.model.AdminStoreDTO;
import com.eats.admin.model.AdminUserDTO;
import com.eats.admin.model.ReviewDeleteDTO;
import com.eats.admin.service.AdminReviewService;
import com.eats.admin.service.AdminStoreEntryService;
import com.eats.admin.service.AdminUserService;
import com.eats.store.model.StoreJoinDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class adminMainController {

    @Autowired
    private AdminUserService service;

    @Autowired
    private AdminStoreEntryService se_service;
    
    @Autowired
    private AdminReviewService re_service;
    


	@GetMapping("/admin/main")
    public ModelAndView main(HttpServletRequest req) {
    	
        HttpSession session = req.getSession();
        
        Integer adminidx = (Integer) session.getAttribute("admin_idx");
        int admin_idx = (adminidx != null) ? adminidx : 0;
        System.out.println("adminidx 값: " + admin_idx);

        if(admin_idx == 0) {

            String msg = "로그인이 필요합니다.";
            String goPage = "/adminLogin";
        
            ModelAndView mav = new ModelAndView();
            mav.addObject("msg", msg);
            mav.addObject("goPage", goPage);
            mav.setViewName("admin/common/basicMsg");
            return mav;
        	//return new ModelAndView("redirect:/adminLogin");
        }
        
		List<StoreJoinDTO> store_lists = se_service.adminMainEntryList();
		if (store_lists.size() > 10) {
			store_lists = store_lists.subList(0, 10);  // 10개로 제한
		}
		
		
		
		List<ReviewDeleteDTO> review_lists = re_service.adminMainReviewList();
		if (review_lists.size() > 10) {
			review_lists = review_lists.subList(0, 10);  // 10개로 제한
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("store_lists", store_lists);
		mav.addObject("review_lists", review_lists);
		mav.addObject("admin_idx", admin_idx);
		
		mav.setViewName("admin/index");
		return mav;
    }

}
