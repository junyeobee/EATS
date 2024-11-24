package com.eats.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
import com.eats.store.model.EatsStoreDTO;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreJoinDTO;
import com.eats.store.model.StoreNewsDTO;
import com.eats.store.model.StoreTimeDTO;
import com.eats.store.service.StoreJoinService;
import com.eats.user.model.AreaDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.eats.admin.model.AdminStoreInfoUpdateDTO;
import com.eats.admin.model.AdminUserDTO;

@Controller
public class StoreController {

    @Autowired
    private AdminStoreInfoService si_service;

    @Autowired
    private AdminStoreEntryService se_service;

    @Autowired
    private AdminStoreService st_service;
    

	@Autowired
	private JavaMailSender mailSender;


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
    		@RequestParam("entry_value") String entry_value,
    		@RequestParam("cancel_reason") String cancel_reason,
    		@RequestParam("sj_email") String sj_email
    		) {

    	int result = 0;
    	String entry_val = "";
        
    	StoreJoinDTO join_dto = new StoreJoinDTO();
        StoreDTO store_dto = new StoreDTO();
        EatsStoreDTO acc_dto = new EatsStoreDTO();
        AreaDTO area_dto = new AreaDTO();
        
        String msg = "";
        	
    	if("Y".equals(entry_value)) {
    		entry_val = "승인";
    		

    		/*
    		승인 클릭시
    		0. store_join 테이블 update
    			> SJ_STAT 필드에 1값 넣기 (승인) / 0은 대기로 들어가있음
    			> SJ_RES_DATE 필드에 sysdate 승인 날짜 넣기
    		*/
            result += se_service.storeJoinEntryApproval(sj_idx);
            
            //System.out.println("store_join 테이블 결과"+result);

    		StoreJoinDTO sj_data = se_service.storeJoinEntryData(sj_idx);
    		/*
    		System.out.println("1"+sj_data.getBiz_num());
    		System.out.println("2"+sj_data.getOwner_name());
    		System.out.println("3"+sj_data.getOwner_tel());
    		System.out.println("4"+sj_data.getSj_addr());
    		System.out.println("5"+sj_data.getSj_daddr());
    		System.out.println("6"+sj_data.getSj_email());
    		System.out.println("7"+sj_data.getSj_id());
    		System.out.println("8"+sj_data.getSj_idx());
    		System.out.println("9"+sj_data.getSj_name());
    		System.out.println("10"+sj_data.getSj_pwd());
    		System.out.println("11"+sj_data.getSj_reason());
    		System.out.println("12"+sj_data.getSj_req_date());
    		System.out.println("13"+sj_data.getSj_res_date());
    		System.out.println("14"+sj_data.getSj_stat());
    		*/
            
    		
    		
    		/*
    		store_dto.setStore_name("dddd");
    		store_dto.setStore_area(4);

    		store_dto.setStore_addr("6");
    		store_dto.setStore_daddr("7");
    		store_dto.setStore_tel("4");
    		store_dto.setStore_biznum("2");

    		store_dto.setStore_state("3");

    		store_dto.setStore_lat(1);
    		store_dto.setStore_lng(2);
    		*/
    		
    		
            //a. store_join데이터 가져와서
            //b. store dto 셋팅 후 set 작업 후에
            //c. store insert
    		
    		//store_dto.setStore_idx(sj_idx);
    		store_dto.setStore_name(sj_data.getSj_name());
    		
    		

    		//area 추가작업필요
    		//store_dto.setStore_area(4);
    		/////////////////////////////////////////////////////////////////////////////
    		

            String[] addr_sigu = sj_data.getSj_addr().split(" ");

            // 시와 구를 추출
            String city = addr_sigu[0];       // 첫 번째 항목: 시
            String district = addr_sigu[1];   // 두 번째 항목: 구

            // 결과 반환
            System.out.println("시: " + city);
            System.out.println("구: " + district);
            
            int city_idx = se_service.areaCity(city);
            System.out.println("city_idx: " + city_idx);
            
            int gu_idx = se_service.areaGu(city_idx, district);
            System.out.println("gu_idx: " + gu_idx);
            
            
    		/////////////////////////////////////////////////////////////////////////////
    		//area 추가작업필요
    		store_dto.setStore_area(gu_idx);
    		/*
    		 	> store_area
    		 		> addr 데이터가져와서 공백을 기준으로 잘라서 시를 먼저 검색하기
    		 		> 자른 시를 기준으로 area 테이블 검색 ( =말고 포함하고 있는걸로)
    		 		> area 테이블에서 lev 2와 나온 키값으로 where 걸어서 검색
    		 		> 나온 데이터로 키 값 넣기
    		 */
    		
    		store_dto.setStore_addr(sj_data.getSj_addr());
    		store_dto.setStore_daddr(sj_data.getSj_daddr());
    		store_dto.setStore_tel(sj_data.getOwner_tel());
    		store_dto.setStore_biznum(sj_data.getBiz_num());
    		
    		store_dto.setStore_state("READY");

    		System.out.println("state"+store_dto.getStore_state());
    		//store_state 추가작업필요
    		/*
    			> store 테이블의 STORE_STATE
    			> 민주가 TRUE만 사용함    			
    		 */
    		
    		//위도, 경도 추가작업필요
    		store_dto.setStore_lat(0);
    		store_dto.setStore_lng(0);
    		

            /*
    		1. store 테이블에 insert
    		 	> store_name 매장명
    		 	> store_area
    		 		> addr 데이터가져와서 공백을 기준으로 잘라서 시를 먼저 검색하기
    		 		> 자른 시를 기준으로 area 테이블 검색 ( =말고 포함하고 있는걸로)
    		 		> area 테이블에서 lev 2와 나온 키값으로 where 걸어서 검색
    		 		> 나온 데이터로 키 값 넣기
    			> store_state 영업상태값 0
    		*/
    		

    		/*
    		System.out.println("name"+store_dto.getStore_name());
    		System.out.println("area"+store_dto.getStore_area());
    		
    		System.out.println("addr"+store_dto.getStore_addr());
    		System.out.println("daddr"+store_dto.getStore_daddr());
    		System.out.println("tel"+store_dto.getStore_tel());
    		System.out.println("biznum"+store_dto.getStore_biznum());
    		
    		System.out.println("state"+store_dto.getStore_state());
    		System.out.println("lat"+store_dto.getStore_lat());
    		System.out.println("lng"+store_dto.getStore_lng());
    		*/
    		
            result += se_service.storeEntryInsert(store_dto);
            

            System.out.println("store 테이블 결과"+result);
            

            int db_store_idx = se_service.findStoreIdx(sj_data.getSj_name());
            System.out.println("db_store_idx"+db_store_idx);
            
            
            //store_join 테이블에서 데이터 가져와서 셋팅
            acc_dto.setStore_idx(db_store_idx);
            acc_dto.setStore_id(sj_data.getSj_id());
            acc_dto.setStore_pwd(sj_data.getSj_pwd());
            acc_dto.setStore_email(sj_data.getSj_email());
            acc_dto.setStore_ceo(sj_data.getOwner_name());
            
            System.out.println(acc_dto.getStore_idx());
            System.out.println(acc_dto.getStore_id());
            System.out.println(acc_dto.getStore_pwd());
            System.out.println(acc_dto.getStore_email());
            System.out.println(acc_dto.getStore_ceo());
            
            
            
            /*
    		2. store_account테이블에 insert
    		*/
            result += se_service.storeAccountInsert(acc_dto);

            System.out.println("store_account 테이블 결과"+result);
            /*
    		3. 이메일 전송
    		*/
            
            
            //ex)받는 사람 메일주소, 메일 제목, 메일 내용을 모두 인자로 받는 메일 전송 메소드
        	//public void sendEmail(String to, String subject, String content) {
        		SimpleMailMessage mail_msg = new SimpleMailMessage();
        		
        		mail_msg.setTo(sj_email);
        		mail_msg.setSubject("Eats 입점신청 승인되었습니다.");
        		mail_msg.setText(""
        				+ "Eats에 가입해주셔서 감사합니다.\n"
        				+ "입점 승인 되어 메일드립니다.\n\n"
        				+ "eats에 로그인 하셔서 이미지등록, 태그등록, 특징등록, 영업시간등록을 해주셔야 오픈이 가능합니다.\n\n"
        				+ "더 좋은 서비스로 보답하는 eats가 되겠습니다.\n\n"
        				+ "감사합니다.");
        		
        		mailSender.send(mail_msg);
        	//}
        	
        	//emailService.sendMail(receiver_mail, title, content);
            
            /*
    		4. 매장로그인
    		5. 매장로그인 후 처리
    			> store 테이블의 STORE_STATE
    			> 민주가 TRUE만 사용함    			
    			> 이미지, 특징, 태그, 영업시간 4가지 저장필요
    			> READY 입점승인만 된 상태, 하나도 저장안함
    			> ING (이미지, 특징, 태그, 영업시간 4가지 등록진행중, 4가지 테이블 SELECT 하여 확인하기
    			> TRUE > 4가지 다 저장완료 / "입점되었습니다" alert처리
    		*/

            msg = result > 2 ? "입점신청이 승인 되었습니다." : "입점신청이 승인 되지 않았습니다. 다시 진행해주세요.";
    	}else {
    		entry_val = "반려";
    		
    		/*
    		반려 클릭시    		
    		0. store_join 테이블 update
    			> SJ_STAT 필드에 2값 넣기 (반려) / 0(대기값) 들어가있음
    			> SJ_REASON 반려한 경우 사유
    			> SJ_RES_DATE 필드에 sysdate 반려 날짜 넣기
    		*/
    		
    		join_dto.setSj_idx(sj_idx);
    		join_dto.setSj_reason(cancel_reason);
    		
            result += se_service.storeJoinEntryCancel(join_dto);
    		/*
    		1. 이메일 전송
    		*/

    		SimpleMailMessage mail_msg = new SimpleMailMessage();

    		mail_msg.setTo(sj_email);
    		mail_msg.setSubject("Eats 입점신청 반려되었습니다.");
    		mail_msg.setText(""
    				+ "Eats에 가입해주셔서 감사합니다.\n"
    				+ "안타깝지만 아래와 같은 이유로 승인되지 않았습니다.\n\\n"
    				+ "<반려사유시작>\n"
    				+ cancel_reason
    				+ "\n<반려사유마침>\n\\n"
    				+ "더 좋은 서비스로 보답하는 eats가 되겠습니다.\n"
    				+ "감사합니다.");
    		
    		mailSender.send(mail_msg);

            msg = result > 0 ? "입점신청이 반려 되었습니다." : "입점신청이 반려처리 되지 않았습니다. 다시 진행해주세요.";
    	}
    	
    	
    	//int result = 0;
    	//String msg = entry_val+"//";
        String goPage = "storeEntryDetail?sj_idx="+sj_idx;
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("admin/common/basicMsg");
        

        return mav;
    	
    }


	@GetMapping("/admin/storeInfoUpdateOkList")
    public ModelAndView storeInfoUpdateOkList(
    		HttpServletRequest req, 
    		@RequestParam(value = "storeCheck", required = false, defaultValue = "waiting") String storeCheck
    		) {
    	
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

        List<AdminStoreInfoUpdateDTO> lists = null;
        
        System.out.println("storeCheck>>"+storeCheck);
        
        if("waiting".equals(storeCheck)) {
    		lists = si_service.adminStoreInfoList();
    		
        }else if("in".equals(storeCheck)) {
    		lists = si_service.adminStoreInfoListIn();
    		
        }else if("out".equals(storeCheck)) {
    		lists = si_service.adminStoreInfoListOut();
        	
        }
        
		
		if (lists == null || lists.isEmpty()) {
		    // 데이터가 없을 경우 처리 (빈 리스트 또는 메시지)
		    System.out.println("No data available for storeCheck: " + storeCheck);
		}
        
        
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("admin_idx", admin_idx);
		mav.addObject("storeCheck", storeCheck);
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
    public ModelAndView storeList(
    		HttpServletRequest req, 
    		@RequestParam(value="cp", defaultValue="1") int cp, 
    		@RequestParam(value="search_key", defaultValue="") String search_key, 
    		@RequestParam(value="search_value", defaultValue="") String search_value
    		) {
    	
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
        
		
        //List<AdminStoreDTO> lists = st_service.storeList();
        //List<AdminStoreDTO> lists = st_service.storeList();
        //int list_size = lists.size();
        

        int list_size = st_service.storeListCnt();
        System.out.println("list_size"+list_size);
        System.out.println("cp"+cp);
        
		int listSize=5;	//몇개 행을 보여줄 것인지
		int pageSize=5; //페이징 클릭부분 몇개 보여줄 것인지
		
		

		String pageStr = com.eats.page.PageModule
				.makePage("/admin/storeList", list_size, listSize, pageSize, cp, search_key, search_value);
		
		//List<AdminStoreDTO> lists = st_service.storeList();

		//List<AdminStoreDTO> lists = st_service.storeList(cp, listSize, null);
		List<AdminStoreDTO> pagelists = st_service.storeListPage(cp, listSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", pagelists);
		mav.addObject("pageStr", pageStr);
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
