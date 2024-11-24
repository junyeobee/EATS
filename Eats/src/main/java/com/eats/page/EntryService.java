package com.eats.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.admin.service.StoreEntryService;

@Service
public class EntryService {

    @Autowired
    private StoreEntryService entry_service;

	//태그, 특징, 영업시간 확인해서 데이터 있는경우는 store의 store_state > true로 바꿔줘야함
    public int entryCheck(int store_idx) {
    	
    	int result_entry = 0;
    	
    	

        int one_cnt = entry_service.tagOneCheck(store_idx);
        int two_cnt = entry_service.tagTwoCheck(store_idx);
        int time_cnt = entry_service.timeCheck(store_idx);
        int img_cnt = entry_service.imgCheck(store_idx);
        
        System.out.println("===========================================");
        System.out.println("===========================================");
        System.out.println("one_cnt"+one_cnt);
        System.out.println("two_cnt"+two_cnt);
        System.out.println("time_cnt"+time_cnt);
        System.out.println("img_cnt"+img_cnt);
        System.out.println("===========================================");
        System.out.println("===========================================");
        
        int all_cnt = one_cnt* two_cnt* time_cnt *img_cnt;
        System.out.println("all_cnt"+all_cnt);
        
        //하나라도 0이면 곱셈을 이용하여 0값이 되게 작업해둠
        //0 초과 값이면 4개 다 수행완료, store_state를 true로 변경해야함
        if(all_cnt > 1) {

            result_entry = entry_service.storeEntryInAction(store_idx);
        	
        }
        return result_entry; 
    }
}
