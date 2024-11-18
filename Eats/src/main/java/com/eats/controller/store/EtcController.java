package com.eats.controller.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.StoreCateDTO;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreGridAllDTO;
import com.eats.store.model.StoreGridBaseDTO;
import com.eats.store.model.StoreGridDetailDTO;
import com.eats.store.model.StoreInfoUpdateDTO;
import com.eats.store.service.StoreEtcService;

@Controller
public class EtcController {

    @Autowired
    private StoreEtcService service;
    //private StoreInfoUpdateReqService service;
    
    @GetMapping("/store/storeInfoUpdateReq")
    public ModelAndView storeInfoUpdateReq(@SessionAttribute(value = "store_idx", required = false) Integer store_idx) {
    	//정보수정신청 페이지 접속시 로그인한 매장의 매장데이터 불러옴
        
        // store_idx가 null이면 기본값을 1로 설정
        if (store_idx == null) {
            store_idx = 1;  // 기본값 설정
        }

        StoreDTO data = service.storeData(store_idx);
        
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data);
        //System.out.println(data.toString());
        mav.setViewName("store/etc/storeInfoUpdateReq");

        return mav;
    }
    
    @PostMapping("/store/storeInfoUpdateReqSave")
    public ModelAndView storeInfoUpdateReqSave(StoreInfoUpdateDTO dto) {
        int result = service.StoreInfoUpdateInsert(dto);
    	System.out.println("fffffff");
    	
        String msg = result > 0 ? "정보수정신청 완료되었습니다." : "정보수정신청 되지 않았습니다. 다시 신청해주세요.";
        String goPage = "storeInfoUpdateReq";
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    }
	
    @GetMapping("/store/storeGrid")
    public ModelAndView storeGrid(@SessionAttribute(value = "store_idx", required = false) Integer store_idx) {
        
        // store_idx가 null이면 기본값을 1로 설정
        if (store_idx == null) {
            store_idx = 1;  // 기본값 설정
        }

        List<StoreCateDTO> lists = service.storeCate(store_idx);
        
        //저장된 그리드가 있으면 해당 그리드를 불러와야함
        StoreGridBaseDTO baseData = service.storeGridBaseSelect(store_idx);
        System.out.println("ddffff"+baseData);
        
		// 값이 없을 경우 기본값 설정
		if (baseData == null) {
		    baseData = new StoreGridBaseDTO(); // baseData 초기화
			baseData.setSg_idx(0); 
			baseData.setStore_idx(0);
			baseData.setStore_floor(0);
			baseData.setSg_col(0);
			baseData.setSg_row(0);
		}else {
			System.out.println("col"+baseData.getSg_col());
			System.out.println("row"+baseData.getSg_row());
		}

        List<StoreGridDetailDTO> gridDetail = service.storeGridDetailView(baseData.getSg_idx());
        
        ModelAndView mav = new ModelAndView();		
        mav.addObject("lists", lists);   	//로그인한 매장의 선택할수있는 좌석타입? 불러옴, category테이블에 매장기본키, 카테고리대메뉴키, 카테고리소메뉴키, category기본키값 존재
        mav.addObject("baseData", baseData);    //로그인한매장의 저장된 그리드base 행X열
        mav.addObject("gridDetail", gridDetail);
        mav.setViewName("store/etc/storeGrid");

        return mav;
    }
    
    @PostMapping("/store/storeGridDelete")
    @ResponseBody  // 이 애너테이션을 추가하여 JSON 응답을 바로 반환하도록 설정, 이거 안써주면 get방식으로 반환한다고 에러남
    public Map<String, Object> storeGridDelete(@RequestBody StoreGridAllDTO storeRequest) {
    	
        // DTO 객체에서 store_idx 값 추출
        int storeIdx = storeRequest.getStore_idx();
        int sg_idx = storeRequest.getSg_idx();
        System.out.println("받은 store_idx: " + storeIdx);
        System.out.println("받은 sg_idx: " + sg_idx);
     
		int result_detail = service.StoreGridDetailDelete(sg_idx);
    	System.out.println("result_detail::"+result_detail);
  
		int result_base = service.StoreGridBaseDelete(sg_idx);
    	System.out.println("result_base::"+result_base);

        Map<String, Object> response = new HashMap<>();
        int result = result_detail+result_base;
        
        if(result > 1) {

            response.put("message", "삭제완료");
            response.put("success", true);  
        }else {

            response.put("message", "삭제실패!!!!!!!!!!!!");
            response.put("success", false);  
        }
        System.out.println(response);  // response 객체를 출력
        
        return response;  // 클라이언트로 JSON 응답 반환
    }

    // 실제 삭제 처리 메서드 (예시)
    private boolean deleteStoreGridData(int storeIdx) {
        // storeIdx를 사용해 데이터를 삭제하는 실제 로직을 구현
        // 예시: 삭제가 성공하면 true, 실패하면 false 반환
        return true; // 임시로 true 반환
    }

    @PostMapping("/store/storeGridSave")
    @ResponseBody  // 이 애너테이션을 추가하여 JSON 응답을 바로 반환하도록 설정
    public Map<String, Object> saveGridData(@RequestBody StoreGridAllDTO requestData) {
    	
    	//행, 열 저장
        int result = service.StoreGridBaseInsert(requestData.getStore_idx(), 1, requestData.getSg_row(), requestData.getSg_col());
        System.out.println("Store ID: " + requestData.getStore_idx());
        System.out.println("Row: " + requestData.getSg_row());
        System.out.println("Col: " + requestData.getSg_col());
        
        //System.out.println("result::"+result);

        int sg_idx = service.storeGridBaseKeySelect(requestData.getStore_idx());
        System.out.println("dd"+sg_idx);
        
        List<Integer> results = new ArrayList<>();
        
        requestData.getGridData().forEach(table -> {

            String stsLocation = table.getSts_location() != null ? table.getSts_location() : "";
            int table_num = table.getTable_num() != 0 ? table.getTable_num() : 0;
            int stsTypeIdx = table.getSts_type_idx() > 0 ? table.getSts_type_idx() : 0;
            int stsCnt = table.getSts_num() > 0 ? table.getSts_num() : 0;
            
			StoreGridDetailDTO storeGridDetail = new StoreGridDetailDTO();
			storeGridDetail.setSg_idx(sg_idx);
			storeGridDetail.setSts_location(stsLocation);
			storeGridDetail.setTable_num(table_num);
			storeGridDetail.setSts_type_idx(stsTypeIdx);
			storeGridDetail.setSts_num(stsCnt);
			
		    // StoreGridDetailInsert 실행 후 결과 저장
		    int result_num = service.StoreGridDetailInsert(storeGridDetail);		    
		    // 결과를 List에 저장
		    results.add(result_num);
		    // 각 처리 결과 출력 (디버깅 용도)
		    System.out.println("Processed table: " + stsLocation + ", result: " + result);
	    });
        
        
        int result2 = 0;

		if (results.isEmpty()) {
		    System.out.println("리스트가 비어 있습니다.");
		} else {
			result2 = 1;
		    System.out.println("리스트에 값이 있습니다.");
		}

	    // 결과 출력
	    System.out.println("result2: " + results);  // results 리스트가 비어 있지 않으면 값이 출력됨
        
        int total = result+sg_idx+result2;
	    System.out.println("total: " + total);  
        //total 위에서 제대로 처리되었으면 x값 이상
        //result > StoreGrid테이블에 행,열,매장키,층 잘 들어갔으면 1, 아니면 0
        //sg_idx > StoreGrid테이블에 방금 저장한(로그인한매장에서 가장 최근에 저장한) 기본키 > 그리드 디테일에 저장시켜야 함
        //result2 > store_table_set테이블에 잘 저장했으면 1, 아니면 0
        
        String msg = total > 1 ? "그리드 저장 되었습니다." : "그리드 저장되지 않았습니다. 다시 입력해주세요.";
        
        Map<String, Object> response = new HashMap<>();
        response.put("message", msg);
        response.put("success", result > 0);  // 성공 여부를 boolean으로 반환
        
        return response;  // 클라이언트로 JSON 응답 반환
    }

}
