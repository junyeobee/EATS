package com.eats.controller.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.eats.admin.service.AdminStoreService;
import com.eats.page.EntryService;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreImgDTO;
import com.eats.store.model.StoreInfoUpdateDTO;
import com.eats.store.model.StoreTimeDTO;
import com.eats.store.service.StoreEtcService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class EtcTwoController {

    @Autowired
    private AdminStoreService service;	//관리자에서 가입매장데이터 뿌릴때 시간도 보여주고 있는 걸 먼저 작업해서 admin에 서비스 만듦

    @Autowired
    private EntryService en_service;

	@GetMapping("/store/storeTime")
    public ModelAndView storeTime(HttpServletRequest req) {
    	
        HttpSession session = req.getSession();
        
        Integer storeidx = (Integer) session.getAttribute("storeIdx");
        int store_idx = (storeidx != null) ? storeidx : 0;
        System.out.println("store_idx 값: " + store_idx);

        if(store_idx == 0) {

            String msg = "로그인이 필요합니다.";
            String goPage = "/storeLogin";
        
            ModelAndView mav = new ModelAndView();
            mav.addObject("msg", msg);
            mav.addObject("goPage", goPage);
            mav.setViewName("store/common/basicMsg");
            return mav;
        }

        //StoreDTO data = service.storeData(store_idx);
	    List<StoreTimeDTO> t_list = service.storeTimeList(store_idx);
	    Map<Integer, String> dayMap = new HashMap<>();
	    dayMap.put(0, "일");  // Sunday
	    dayMap.put(1, "월");  // Monday
	    dayMap.put(2, "화");  // Tuesday
	    dayMap.put(3, "수");  // Wednesday
	    dayMap.put(4, "목");  // Thursday
	    dayMap.put(5, "금");  // Friday
	    dayMap.put(6, "토");  // Saturday
	    String data1[]= {"일","월","화","수","목","금","토"};
        
	    List<StoreTimeDTO> t_list2 =new ArrayList<>();
	    boolean sw=true;
	    for(int j=0;j<data1.length;j++) {
	    	String tt=data1[j];
	    	
		    for(int i=0; i<t_list.size(); i++) {
		    	StoreTimeDTO temp = t_list.get(i);
		    	if(tt.equals(temp.getStime_day())) {
		    		t_list2.add(temp);
		    		//System.out.println("기존데이터삽입:"+temp.getStime_day());
		    		sw=false;
		    	}
		    	//System.out.println("j="+j+"/i="+i);
		    	//System.out.println(temp.getStore_idx()+"//"+temp.getStime_idx()+"//"+temp.getStime_start()+"//"+temp.getStime_end()+"//"+temp.getStime_day()+"//"+temp.getStime_break());
		    }
		    if(sw) {
		    	StoreTimeDTO temp2=new StoreTimeDTO(0, 0, tt, null, null, null);
		    	t_list2.add(temp2);
		    	// System.out.println("새데이터삽입:"+temp2.getStime_day());
		    }
		    sw=true;
	    }
	    for(int i=0; i<t_list2.size(); i++) {
	    	StoreTimeDTO temp = t_list2.get(i);
	    	//System.out.println(temp.getStore_idx()+"//"+temp.getStime_idx()+"//"+temp.getStime_start()+"//"+temp.getStime_end()+"//"+temp.getStime_day()+"//"+temp.getStime_break());
	    }
        ModelAndView mav = new ModelAndView();
        mav.addObject("t_list", t_list2);
        mav.addObject("dayMap", dayMap);  // 요일 Map 추가
        
        

        //운영설정데이터
        String work_type = service.storeWorkData(store_idx);        
        System.out.println(work_type);
        mav.addObject("work_type", work_type);

        mav.addObject("store_idx", store_idx);
        
        //System.out.println(data.toString());
        mav.setViewName("store/etc/storeTime");

        return mav;
    }


    @PostMapping("/store/storeTimeSave")
    public ModelAndView storeTimeSave(
    //public String storeTimeSave(
        @RequestParam(value = "store_idx", required = false) List<Integer> store_idx,

        @RequestParam(value = "radio_val", required = false) List<String> radio_val,
        @RequestParam(value = "stime_day", required = false) List<String> s_day,
        
        @RequestParam(value = "work_shour", required = false) List<String> work_shour,
        @RequestParam(value = "work_sminute", required = false) List<String> work_sminute, 
        
        @RequestParam(value = "work_ehour", required = false) List<String> work_ehour,
        @RequestParam(value = "work_eminute", required = false) List<String> work_eminute,
        
        @RequestParam(value = "rest_time", required = false) List<String> rest_time_arr) {

    	int result = 0;
    	int store_idx_val = 0;

        for (int i = 0; i < radio_val.size(); i++) {
            if (!radio_val.get(i).isEmpty()) {
                if ("Y".equals(radio_val.get(i))) {
                	
                	store_idx_val = store_idx.get(i);

	            	System.out.println(radio_val.get(i));
	
	        	    String stime = work_shour.get(i)+":"+work_sminute.get(i);
	        	    String etime = work_ehour.get(i)+":"+work_eminute.get(i);
	        	    String rest_time = rest_time_arr.get(i);
	        	    
	        	    StoreTimeDTO StoreTimeDTO = new StoreTimeDTO();
	            	StoreTimeDTO.setStore_idx(store_idx.get(i));
	            	StoreTimeDTO.setStime_day(s_day.get(i));
	            	StoreTimeDTO.setStime_start(stime);
	            	StoreTimeDTO.setStime_end(etime);
	            	StoreTimeDTO.setStime_break(rest_time);
	
	                result += service.storeTimeSave(StoreTimeDTO);
	            	System.out.println("fffffff");
	            	
                } else if ("N".equals(radio_val.get(i))) {
                    //System.out.println("The status for " + key + " is 'N'.");
	            	System.out.println("휴무무무무"+radio_val.get(i));
	            	
                } else {
                    //System.out.println("The status for " + key + " is unknown.");
	            	System.out.println("Y도 아니고 N도 아님"+radio_val.get(i));
                }
        	}
       	}
    	System.out.println("rrrrrrrrrrrrrrrrrrrrrrrrrrrr");
        
        if(result > 0) {
        	//store_state를 바꾸기 위해 체크 후 변경
        	int test = en_service.entryCheck(store_idx_val);
        	
        	System.out.println("dddddddddddddddddd");
        	System.out.println("testddd"+test);
        	
        }
        
        String msg = result > 0 ? "영업시간 설정되었습니다." : "영업시간 설정되지 않았습니다. 다시 저장해주세요.";
        String goPage = "storeTime";
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
        //return "test";
    }
    


    @PostMapping("/store/storeTimeUpdate")
    public ModelAndView storeTimeUpdate(
    //public String storeTimeSave(
        @RequestParam(value = "store_idx", required = false) int store_idx,

        @RequestParam(value = "radio_val", required = false) List<String> radio_val,
        @RequestParam(value = "stime_idx", required = false) List<Integer> s_idx,
        @RequestParam(value = "stime_day", required = false) List<String> s_day,
        
        @RequestParam(value = "work_shour", required = false) List<String> work_shour,
        @RequestParam(value = "work_sminute", required = false) List<String> work_sminute, 
        
        @RequestParam(value = "work_ehour", required = false) List<String> work_ehour,
        @RequestParam(value = "work_eminute", required = false) List<String> work_eminute,
        
        @RequestParam(value = "rest_shour", required = false) List<String> rest_shour,
        @RequestParam(value = "rest_sminute", required = false) List<String> rest_sminute,
        @RequestParam(value = "rest_ehour", required = false) List<String> rest_ehour,
        @RequestParam(value = "rest_eminute", required = false) List<String> rest_eminute) {
    	
    	//@RequestParam(value = "rest_time", required = false) List<String> rest_time_arr

    	int result = 0;
    	
    	System.out.println("radio_val.size():"+radio_val.size());

    	
    	int data_no = 0;
    	
        for (int i = 0; i < radio_val.size(); i++) {
            if (!radio_val.get(i).isEmpty()) {
            	
            	System.out.println("work_shour"+work_shour.size());
            	System.out.println("work_sminute"+work_sminute.size());
            	System.out.println("work_ehour"+work_ehour.size());
            	System.out.println("work_eminute"+work_eminute.size());
            	//System.out.println("rest_time_arr"+rest_time_arr.size());

            	
        	    String stime = work_shour.get(i)+":"+work_sminute.get(i);
        	    String etime = work_ehour.get(i)+":"+work_eminute.get(i);
        	    //String rest_time = rest_time_arr.get(i);
        	    String rest_time = rest_shour.get(i)+":"+rest_sminute.get(i)+"-"+rest_ehour.get(i)+":"+rest_eminute.get(i);
        	    
        	    StoreTimeDTO StoreTimeDTO = new StoreTimeDTO();

            	
                if ("Y".equals(radio_val.get(i))) {

	            	System.out.println("radio_valyyyy"+radio_val.get(i));



	            	System.out.println("stime"+stime);
	            	System.out.println("etime"+etime);
	            	System.out.println("s_day"+s_day.get(i));
	            	
	            	
	            	StoreTimeDTO.setStore_idx(store_idx);
	            	StoreTimeDTO.setStime_day(s_day.get(i));
	            	StoreTimeDTO.setStime_start(stime);
	            	StoreTimeDTO.setStime_end(etime);
	            	StoreTimeDTO.setStime_break(rest_time);
	            	
	            	//y인데 기본키 있으면 수정모드
	            	System.out.println(s_idx.get(i));
	            	if(s_idx.get(i) > 0) {

	                	StoreTimeDTO.setStime_idx(s_idx.get(i));
		            	System.out.println("YO");
		                result += service.storeTimeUpdate(StoreTimeDTO);

		            //y인데 기본키 없으면 등록모드
	            	}else {

		            	System.out.println("YX");
		                result += service.storeTimeSave(StoreTimeDTO);

		                if(result > 0) {
		                	//store_state를 바꾸기 위해 체크 후 변경
		                	int test = en_service.entryCheck(store_idx);
		                	
		                	System.out.println("testddd"+test);
		                	
		                }
	            	}
	            	
	            	data_no++;
	            	
	            	//System.out.println("fffffff");
	            	
                } else if ("N".equals(radio_val.get(i))) {
                    //System.out.println("The status for " + key + " is 'N'.");
	            	//System.out.println("휴무무무무"+radio_val.get(i));

	            	System.out.println("radio_valnnnn"+radio_val.get(i));
                	//n인데 기본키 있으면 삭제시켜야함
	            	System.out.println(s_idx.get(i));
	            	if(s_idx.get(i) > 0) {

	                	StoreTimeDTO.setStime_idx(s_idx.get(i));
		            	System.out.println("NO");
		                result += service.storeTimeDelete(s_idx.get(i));

	            	}

	                //n인데 기본키 없으면 저장안하면 됨
	                
	            	
                } else {
                    //System.out.println("The status for " + key + " is unknown.");
	            	System.out.println("Y도 아니고 N도 아님"+radio_val.get(i));
                }
        	}
       	}
        
        //String msg = result > 0 ? "영업시간 변경되었습니다." : "영업시간 변경되지 않았습니다. 다시 저장해주세요.";
        String msg = "영업시간 설정되었습니다.";
        String goPage = "storeTime";
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
        //return "test";
    }
    

	@GetMapping("/store/storeWork")
    public ModelAndView storeWork(HttpServletRequest req) {
    	
        HttpSession session = req.getSession();
        
        Integer storeidx = (Integer) session.getAttribute("storeIdx");
        int store_idx = (storeidx != null) ? storeidx : 0;
        System.out.println("store_idx 값: " + store_idx);

        if(store_idx == 0) {

            String msg = "로그인이 필요합니다.";
            String goPage = "/storeLogin";
        
            ModelAndView mav = new ModelAndView();
            mav.addObject("msg", msg);
            mav.addObject("goPage", goPage);
            mav.setViewName("store/common/basicMsg");
            return mav;
        }

        String data = service.storeWorkData(store_idx);
        
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data);
        mav.addObject("store_idx", store_idx);
        //System.out.println(data.toString());
        mav.setViewName("store/etc/storeWork");

        return mav;
    }
	
    @PostMapping("/store/storeWorkSet")
    public ModelAndView storeWorkSet(
    //public String storeTimeSave(
        @RequestParam(value = "store_idx", required = false) int store_idx,
        @RequestParam(value = "s_work", required = false) String s_work) {
    	
    	System.out.println(store_idx+"//"+s_work);


    	StoreDTO StoreDTO = new StoreDTO();
    	StoreDTO.setStore_idx(store_idx);
    	StoreDTO.setStore_state(s_work);

    	int result = service.storeWorkSet(StoreDTO);
        
        String msg = result > 0 ? "운영설정 설정되었습니다." : "영업시간 설정되지 않았습니다. 다시 저장해주세요.";
        String goPage = "storeTime";
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
        //return "test";
    }


    
}
