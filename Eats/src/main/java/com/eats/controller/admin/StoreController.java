package com.eats.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.admin.service.AdminStoreEntryService;
import com.eats.admin.service.AdminStoreInfoService;
import com.eats.admin.service.AdminStoreService;
import com.eats.admin.model.AdminStoreDTO;
import com.eats.store.model.StoreJoinDTO;
import com.eats.store.model.StoreNewsDTO;
import com.eats.admin.model.AdminStoreInfoUpdateDTO;

@Controller
public class StoreController {

    @Autowired
    private AdminStoreInfoService si_service;

    @Autowired
    private AdminStoreEntryService se_service;

    @Autowired
    private AdminStoreService st_service;

	@GetMapping("/admin/storeEntryOkList")
    public ModelAndView storeEntry() {

		List<StoreJoinDTO> lists = se_service.adminStoreEntryList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		//mav.addObject("pageStr", pageStr);
		
		mav.setViewName("admin/store/storeEntryOkList");
		return mav;
        //return "admin/store/storeEntryOkList";
    }

	@GetMapping("/admin/storeEntryDetail")
    public ModelAndView storeEntryDetail(@RequestParam("sj_idx") int sj_idx, Model model) {
		
	    model.addAttribute("sj_idx", sj_idx); // store_idx 값을 모델에 추가
	    
		StoreJoinDTO data = se_service.adminStoreEntryDetail(sj_idx);
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data);
        //System.out.println(data.toString());
        mav.setViewName("admin/store/storeEntryDetail");

        return mav;
    }


	@GetMapping("/admin/storeInfoUpdateOkList")
    public ModelAndView storeInfoUpdateOkList() {

		List<AdminStoreInfoUpdateDTO> lists = si_service.adminStoreInfoList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		//mav.addObject("pageStr", pageStr);
		
		mav.setViewName("admin/store/storeInfoUpdateOkList");
		return mav;
    }
    
    @PostMapping("/admin/infoUpdateAction")
    public ModelAndView infoUpdateAction(AdminStoreInfoUpdateDTO dto) {
    	
        int result = si_service.infoUpdateAction(dto);
        
        System.out.println("승인여부"+dto.getSu_state());
        if ("승인".equals(dto.getSu_state())) {
        	
        	//System.out.println("ttttt");
            result += si_service.storeInfoUpdate(dto);
            
            //System.out.println("tttttttttttttttttt");
            result += si_service.storeInfoUpdateCeo(dto);
            
            /*
            System.out.println(dto.getSu_addr());
            System.out.println(dto.getSu_ceo());
            System.out.println(dto.getSu_daddr());
            System.out.println(dto.getSu_idx());
            System.out.println(dto.getSu_name());
            System.out.println(dto.getSu_tel());
            System.out.println("ddddd");
            */

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
    public ModelAndView storeChart() {

		List<AdminStoreDTO> lists = st_service.storeChartList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		
		mav.setViewName("admin/store/storeChart");
		return mav;
    }


	@GetMapping("/admin/storeChartDetail")
    public ModelAndView storeChartDetail(@RequestParam("st_idx") int st_idx, Model model) {
		
	    model.addAttribute("st_idx", st_idx); // store_idx 값을 모델에 추가
	    
	    AdminStoreDTO data = st_service.adminStoreChartDetail(st_idx);
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data);
        //System.out.println(data.toString());
        mav.setViewName("admin/store/storeChartDetail");

        return mav;
    }

	@GetMapping("/admin/storeList")
    public ModelAndView storeList() {

		List<AdminStoreDTO> lists = st_service.storeList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		
		mav.setViewName("admin/store/storeList");
		return mav;
    }


	@GetMapping("/admin/storeDetail")
    public ModelAndView storeDetail(@RequestParam("st_idx") int st_idx, Model model) {
		
	    model.addAttribute("st_idx", st_idx); // store_idx 값을 모델에 추가
	    AdminStoreDTO data = st_service.adminStoreDetail(st_idx);
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data);
        //System.out.println(data.toString());
        mav.setViewName("admin/store/storeDetail");

        return mav;
    }
}
