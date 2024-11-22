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
import com.eats.store.model.StoreTimeDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
    public ModelAndView storeEntry(HttpServletRequest req) {
    	
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

		List<StoreJoinDTO> lists = se_service.adminStoreEntryList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("admin_idx", admin_idx);
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
	

    @PostMapping("/admin/entryAction")
    public ModelAndView entryAction(
    		@RequestParam("sj_idx") int sj_idx,
    		@RequestParam("entry_value") String entry_value
    		) {
    	
    	String entry_val = "";
    	if("Y".equals(entry_value)) {
    		entry_val = "승인";
    		
    		/*
    		승인 클릭시
    		0. store_join 테이블 update
    			> SJ_STAT 필드에 1값 넣기 (승인) / 0은 대기로 들어가있음
    			> SJ_RES_DATE 필드에 sysdate 승인 날짜 넣기

    		1. store 테이블에 insert
    		 	> store_name 매장명
    		 	> store_area
    		 		> addr 데이터가져와서 공백을 기준으로 잘라서 시를 먼저 검색하기
    		 		> 자른 시를 기준으로 area 테이블 검색 ( =말고 포함하고 있는걸로)
    		 		> area 테이블에서 lev 2와 나온 키값으로 where 걸어서 검색
    		 		> 나온 데이터로 키 값 넣기
    			> store_state 영업상태값 0
    			> 
    		2. store_account테이블에 insert
    		3. 이메일 전송
    		4. 매장로그인
    		5. 매장로그인 후 처리
    			> store 테이블의 STORE_STATE
    			> 민주가 TRUE만 사용함    			
    			> 이미지, 특징, 태그, 영업시간 4가지 저장필요
    			> READY 입점승인만 된 상태, 하나도 저장안함
    			> ING (이미지, 특징, 태그, 영업시간 4가지 등록진행중, 4가지 테이블 SELECT 하여 확인하기
    			> TRUE > 4가지 다 저장완료 / "입점되었습니다" alert처리
    		*/
    		
    	}else {
    		entry_val = "반려";
    		
    		/*
    		반려 클릭시    		
    		0. store_join 테이블 update
    			> SJ_STAT 필드에 2값 넣기 (반려) / 0(대기값) 들어가있음
    			> SJ_REASON 반려한 경우 사유
    			> SJ_RES_DATE 필드에 sysdate 반려 날짜 넣기
    			
    		1. 이메일 전송
    		*/
    		
    	}
    	
    	
    	//int result = 0;
        //String msg = result > 5 ? "정보수정신청이 되었습니다." : "정보수정신청이 처리 되지 않았습니다. 다시 진행해주세요.";
    	String msg = entry_val+"//";
        String goPage = "storeEntryDetail?sj_idx="+sj_idx;
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("admin/common/basicMsg");
        

        return mav;
    	
    }


	@GetMapping("/admin/storeInfoUpdateOkList")
    public ModelAndView storeInfoUpdateOkList(HttpServletRequest req) {
    	
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

		List<AdminStoreInfoUpdateDTO> lists = si_service.adminStoreInfoList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("admin_idx", admin_idx);
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
    public ModelAndView storeChart(HttpServletRequest req) {
    	
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

		List<AdminStoreDTO> lists = st_service.storeChartList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("admin_idx", admin_idx);
		
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
    public ModelAndView storeList(HttpServletRequest req) {
    	
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

		List<AdminStoreDTO> lists = st_service.storeList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("admin_idx", admin_idx);
		
		mav.setViewName("admin/store/storeList");
		return mav;
    }


	@GetMapping("/admin/storeDetail")
    public ModelAndView storeDetail(@RequestParam("st_idx") int st_idx, Model model) {
		
	    model.addAttribute("st_idx", st_idx); // store_idx 값을 모델에 추가
	    
	    AdminStoreDTO data = st_service.adminStoreDetail(st_idx);
	    
	    System.out.println(st_idx);
	    List<StoreTimeDTO> t_list = st_service.storeTimeList(st_idx);
	    

	    // t_list의 값 출력 (비어있는지 확인)
	    if (t_list.isEmpty()) {
	        System.out.println("t_list is empty.");
	    } else {
	        // t_list에 값이 있을 경우, 리스트 내용 출력
	        System.out.println("t_list contains " + t_list.size() + " elements.");
	        for (StoreTimeDTO storeTime : t_list) {
	            System.out.println(storeTime.toString());
	        }
	    }
	    
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data);
        mav.addObject("t_list", t_list);
        //System.out.println(data.toString());
        mav.setViewName("admin/store/storeDetail");

        return mav;
    }
}
