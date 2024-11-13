package com.eats.controller.store;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.StoreCateDTO;
import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreGridAllDTO;
import com.eats.store.model.StoreGridBaseDTO;
import com.eats.store.model.StoreGridDetailDTO;
import com.eats.store.model.StoreImgDTO;
import com.eats.store.model.StoreInfoUpdateDTO;
import com.eats.store.model.StoreNewsDTO;
import com.eats.store.service.StoreEtcService;
import com.eats.store.service.StoreInfoUpdateReqService;

import jakarta.servlet.http.HttpServletResponse;

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
            store_idx = 8;  // 기본값 설정
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
		}

        List<StoreGridDetailDTO> gridDetail = service.storeGridDetailView(baseData.getSg_idx());

        
        ModelAndView mav = new ModelAndView();
		
        mav.addObject("lists", lists);
    	//로그인한 매장의 선택할수있는 좌석타입? 불러옴, category테이블에 매장기본키, 카테고리대메뉴키, 카테고리소메뉴키, category기본키값 존재
		
        mav.addObject("baseData", baseData);
        //로그인한매장의 저장된 그리드base 행X열

        mav.addObject("gridDetail", gridDetail);
        
        //System.out.println(data.toString());
        mav.setViewName("store/etc/storeGrid");
        
        /*
        💡 for문을 이용한 방법

        1. 1부터 9까지의 숫자가 저장되어 1차원 배열을 구성합니다. 그리고 rows(행)와 cols(열) 변수는 각각 2차원 배열의 행과 열의 수를 저장하고 있습니다.
        2. rows(행)와 cols(열)의 크기를 가진 빈 2차원 배열을 선언합니다.
        3. row(행)과 cols(열)을 순회하면서 1차원 배열의 값을 2차원 배열에 대입합니다.
        4. 결과값을 출력합니다.
        
        // 1 
        int[] oneDArray = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int rows = 3;
        int cols = 3;
         
        // 2
        int[][] twoDArray = new int[rows][cols];
         
        // 3
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                twoDArray[i][j] = oneDArray[(i * cols) + j];
            }
        }
         
        // 4
        for (int[] item : twoDArray) {
            System.out.println("for 문을 활용한 결과 값 :: " + Arrays.toString(item));
        }
        */

        return mav;
    }
    
    /*
    // Grid 데이터를 저장하는 POST 메서드
    @PostMapping("/store/storeGridSave")
    public ResponseEntity<String> saveGridData(@RequestBody List<StoreGridArrayDTO> gridData) {
        // 받은 JSON 데이터를 출력
        gridData.forEach(table -> {
            System.out.println("Row: " + table.getRow() + ", Column: " + table.getCol() +
                               ", name: " + table.getTname() + ", Type: " + table.getType() +
                               ", Seat: " + table.getSeat() + ", Location: " + table.getLocation()+"////");
        });

        // DB에 데이터를 저장하는 로직을 추가합니다.
        // 예: repository.saveAll(gridData);

        return ResponseEntity.ok("Data saved successfully");
    }
    */

    @PostMapping("/store/storeGridSave")
    @ResponseBody  // 이 애너테이션을 추가하여 JSON 응답을 바로 반환하도록 설정
    public Map<String, Object> saveGridData(@RequestBody StoreGridAllDTO requestData) {
    //public ModelAndView saveGridData(@RequestBody StoreGridArrayDTO requestData) {
    	
        // 받은 데이터를 출력
        //System.out.println("Store ID: " + requestData.getStore_idx());
        //System.out.println("Row: " + requestData.getTr());
        //System.out.println("Col: " + requestData.getTd());
        
        //int base_idx = 그리드 base 저장시키는 쿼리;
    	
    	//행, 열 저장
        int result = service.StoreGridBaseInsert(requestData.getStore_idx(), 1, requestData.getSg_row(), requestData.getSg_col());
        System.out.println("Store ID: " + requestData.getStore_idx());
        System.out.println("Row: " + requestData.getSg_row());
        System.out.println("Col: " + requestData.getSg_col());
        
        //System.out.println("result::"+result);

        int sg_idx = service.storeGridBaseKeySelect(requestData.getStore_idx());
        System.out.println("dd"+sg_idx);
        
        requestData.getGridData().forEach(table -> {

            //System.out.println("sg_idx: "+sg_idx+", Name: " + table.getSts_name() + ", Type: " + table.getSts_type_idx() +
             //                  ", Seat: " + table.getSts_num() + ", Location: " + table.getSts_location());
            // DB에 데이터를 삽입
            //int result2 = service.StoreGridDetailInsert(sg_idx, table.getSts_location(), table.getSts_name(), table.getSts_type_idx(), table.getSts_cnt() );
            

            String stsLocation = table.getSts_location() != null ? table.getSts_location() : "";
            String stsName = table.getSts_name() != null ? table.getSts_name() : "";
            int stsTypeIdx = table.getSts_type_idx() > 0 ? table.getSts_type_idx() : 0;
            int stsCnt = table.getSts_num() > 0 ? table.getSts_num() : 0;
            
            /*
            System.out.println("stsLocation"+stsLocation);
            System.out.println("stsName"+stsName);
            System.out.println("stsTypeIdx"+stsTypeIdx);
            System.out.println("stsCnt"+stsCnt);
            */

			StoreGridDetailDTO storeGridDetail = new StoreGridDetailDTO();
			storeGridDetail.setSg_idx(sg_idx);
			storeGridDetail.setSts_location(stsLocation);
			storeGridDetail.setSts_name(stsName);
			storeGridDetail.setSts_type_idx(stsTypeIdx);
			storeGridDetail.setSts_num(stsCnt);
			
			// 매퍼에 객체 전달
			int result2 = service.StoreGridDetailInsert(storeGridDetail);

	    	System.out.println("result2::"+result2);

            //int result2 = service.StoreGridDetailInsert(sg_idx, stsLocation, stsName, stsTypeIdx, stsCnt );
            /*
            // DB에 데이터를 삽입
            int result2 = service.StoreGridDetailInsert(
                sg_idx, 
                stsLocation, 
                stsName, 
                stsTypeIdx, 
                stsCnt
            );
            */
            //System.out.println("Insert result: " + result2);
            //System.out.println("Insert result: " + result2);
            
        });

        // DB에 그리드 데이터를 저장
        //int result2 = service.StoreGridDetailInsert(requestData.getSg_idx(), requestData.getGridData());

    	//System.out.println("result2::"+result2);
        
        /////////////////////////////////종료
        
        int total = result+sg_idx;
        //total 위에서 제대로 처리되었으면 x값 이상
        //result > StoreGrid테이블에 행,열,매장키,층 잘 들어갔으면 1, 아니면 0
        //sg_idx > StoreGrid테이블에 방금 저장한(로그인한매장에서 가장 최근에 저장한) 기본키 > 그리드 디테일에 저장시켜야 함
        //result2 > store_table_set테이블에 잘 저장했으면 1이상, 아니면 0
        
        String msg = total > 1 ? "그리드 저장 되었습니다." : "그리드 저장되지 않았습니다. 다시 입력해주세요.";
        //String goPage = "storeGrid";
        
        // 응답을 위한 Map 생성
        Map<String, Object> response = new HashMap<>();
        response.put("message", msg);
        response.put("success", result > 0);  // 성공 여부를 boolean으로 반환
        
        return response;  // 클라이언트로 JSON 응답 반환
        
    	//1. 행열 저장시키고 
    	//2. 로그인한 매장에서 제일 마지막에 저장시킨 기본키값 grid_base_key에 담기
    	//List<StoreGridArrayDTO> gridData = (List<StoreGridArrayDTO>) requestData.get("gridData");
        //Integer base_idx = (Integer) requestData.get("base_idx");
        
        /*
        requestData.getGridData().forEach(table -> {
        	
            System.out.println("sg_idx: base기본키값, Name: " + table.getSts_name() + ", Type: " + table.getSts_type_idx() +
                               ", Seat: " + table.getSts_num() + ", Location: " + table.getSg_idx());
        });
        */
    	
        /*
        requestData.getGridData().forEach(table -> {
        	
            System.out.println("Row: " + table.getTr() + ", Column: " + table.getTd() +
                               ", Name: " + table.getTname() + ", Type: " + table.getType() +
                               ", Seat: " + table.getSeat() + ", Location: " + table.getLocation());
        });
        */

        // DB에 그리드 데이터를 저장
        //int result = service.StoreGridInsert(requestData.getStore_idx(), requestData.getGridData());
        
        /*
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
        */
    }

    /*
    @PostMapping("/store/storeGridSave")
    public ModelAndView storeNewsSave(StoreGridDTO dto) {
    	
    	
        int result = service.StoreGridInsert(dto);
    	System.out.println("fffffff");
    	
        String msg = result > 0 ? "소식 등록되었습니다." : "소식 등록되지 않았습니다. 다시 입력해주세요.";
        String goPage = "storeNewsList?news_idx=";
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    }
    */
}
