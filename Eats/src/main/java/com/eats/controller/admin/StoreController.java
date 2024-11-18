package com.eats.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eats.admin.service.AdminStoreInfoService;
import com.eats.admin.model.AdminStoreInfoUpdateDTO;

@Controller
public class StoreController {

    @Autowired
    private AdminStoreInfoService service;

	@GetMapping("/admin/storeEntryOkList")
    public ModelAndView storeEntry() {

		List<AdminStoreInfoUpdateDTO> lists = service.adminStoreInfoList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		//mav.addObject("pageStr", pageStr);
		
		mav.setViewName("admin/store/storeEntryOkList");
		return mav;
        //return "admin/store/storeEntryOkList";
    }


	@GetMapping("/admin/storeInfoUpdateOkList")
    public ModelAndView storeInfoUpdateOkList() {

		List<AdminStoreInfoUpdateDTO> lists = service.adminStoreInfoList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		//mav.addObject("pageStr", pageStr);
		
		mav.setViewName("admin/store/storeInfoUpdateOkList");
		return mav;
    }
    

    
    @PostMapping("/admin/infoUpdateAction")
    public ModelAndView infoUpdateAction(AdminStoreInfoUpdateDTO dto) {
    	
        int result = service.infoUpdateAction(dto);
        
        System.out.println("승인여부"+dto.getSu_state());
        if ("승인".equals(dto.getSu_state())) {
        	
        	System.out.println("ttttt");
            result += service.storeInfoUpdate(dto);
            
            System.out.println("tttttttttttttttttt");
            result += service.storeInfoUpdateCeo(dto);
            
            System.out.println(dto.getSu_addr());
            System.out.println(dto.getSu_ceo());
            System.out.println(dto.getSu_daddr());
            System.out.println(dto.getSu_idx());
            System.out.println(dto.getSu_name());
            System.out.println(dto.getSu_tel());
            System.out.println("ddddd");

        	result = result + 4;
        }else {
        	result = result + 5;
        }
    	
        String msg = result > 5 ? "정보수정신청이 "+dto.getSu_state()+"되었습니다." : "정보수정신청이 "+dto.getSu_state()+"처리 되지 않았습니다. 다시 진행해주세요.";
        String goPage = "storeInfoUpdateOkList";
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("admin/common/basicMsg");

        return mav;
    	
    }


	@GetMapping("/admin/storeChart")
    public String storeChart() {
        return "admin/store/storeChart";
    }

	@GetMapping("/admin/storeList")
    public String storeList() {
        return "admin/store/storeList";
    }
}
