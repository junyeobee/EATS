package com.eats.controller.store;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.StoreImgDTO;
import com.eats.store.model.StoreNewsDTO;
import com.eats.store.service.StoreNewsService;

@Controller
public class StoreNewsController {

    @Autowired
    private StoreNewsService service;

	@GetMapping("/store/storeNewsWrite")
    public String storeNewsWrite() {
        return "store/news/newsWrite";
    }
	
	@GetMapping("/store/storeNewsUpdateForm")
    public ModelAndView storeNewsUpdateForm(@RequestParam("news_idx") int news_idx, Model model) {
	    model.addAttribute("news_idx", news_idx); // store_idx 값을 모델에 추가
	    
	    StoreNewsDTO data = service.storeNewsData(news_idx); 
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data); // JSP로 객체 전달
        System.out.println(data.toString());
        mav.setViewName("store/news/newsWrite"); // JSP 이름

        return mav;
    }
	
	@GetMapping("/store/storeNewsRead")
	public ModelAndView storeNewsRead(@RequestParam("news_idx") int news_idx, Model model) {
	    model.addAttribute("news_idx", news_idx); // store_idx 값을 모델에 추가

	    StoreNewsDTO data = service.storeNewsData(news_idx); 
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data); // JSP로 객체 전달
        System.out.println(data.toString());
        mav.setViewName("store/news/newsRead"); // JSP 이름

        return mav;
	}
	
	@GetMapping("/store/storeNewsList")
    public ModelAndView storeNewsList(
    		@SessionAttribute(value = "store_idx", required = false) Integer store_idx
    		) {
		
        // store_idx가 null이면 기본값을 1로 설정
        if (store_idx == null) {
            store_idx = 1;  // 기본값 설정
        }
		
        /*
		int totalCnt=service.storeNewsTotalCnt(store_idx);
		int listSize=5;
		int pageSize=5;
		Map<String, Object> params = new HashMap<>();
		params.put("store_idx", store_idx);         // store_idx 파라미터
		params.put("totalCnt", totalCnt);
		*/
		
		List<StoreNewsDTO> lists = service.storeNewsList(store_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		//mav.addObject("pageStr", pageStr);
		
		mav.setViewName("store/news/newsList");
		return mav;
	}

    @PostMapping("/store/storeNewsSave")
    public ModelAndView storeNewsSave(@ModelAttribute StoreNewsDTO dto, 
                                      BindingResult bindingResult,
                                      @RequestParam("s_news_img") MultipartFile img) {
        
        /*
    	// 수동으로 유효성 검사
        if (dto.getS_news_title() == null || dto.getS_news_title().isEmpty()) {
            bindingResult.rejectValue("s_news_title", "error.title", "소식 제목은 필수입니다.");
        }

        if (dto.getS_news_content() == null || dto.getS_news_content().isEmpty()) {
            bindingResult.rejectValue("s_news_content", "error.content", "소식 내용은 필수입니다.");
        }

        if (img.isEmpty()) {
            bindingResult.rejectValue("s_news_img", "error.image", "이미지를 업로드 해주세요.");
        }
        */

        // 유효성 검사 실패 시 처리
        if (bindingResult.hasErrors()) {
            System.out.println("에러~~~: " + bindingResult.getAllErrors());
            System.out.println("이미지값 file로 받아서 현재 db에 null로 받아와지고 db에 경로가 들어가는중");
            System.out.println("이 에러가 왜 뜨는지 알수없음~~~~~~~~~~~~~~");
        }

        // 유효성 검사 통과 후 데이터 처리
        /*
    	System.out.println("store_idx:"+dto.getStore_idx());
    	System.out.println("com:"+dto.getS_news_content());
    	System.out.println("del:"+dto.getS_news_del());
    	System.out.println("idx:"+dto.getS_news_idx());
    	System.out.println("img:"+dto.getS_news_img());
    	System.out.println("title:"+dto.getS_news_title());
    	System.out.println("imgvalue:"+img);
    	*/

        // 이미지가 업로드 되었는지 확인
        if (!img.isEmpty()) {
            try {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
                String formattedDate = LocalDateTime.now().format(formatter);

                // 파일명에 날짜와 시간 추가
                String fileName = img.getOriginalFilename().substring(0, img.getOriginalFilename().lastIndexOf(".")) + "_" + formattedDate + img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf("."));
                
                String filePath = "C:/EATS/Eats/src/main/webapp/storeNewsImg/"+ fileName;
                //String filePath = "/path/to/save/directory/" + img.getOriginalFilename();
                
                File file = new File(filePath);
                img.transferTo(file); // 파일을 실제로 저장하는 코드
                dto.setS_news_img(fileName);

                System.out.println("파일 저장 경로: " + filePath);

            } catch (IOException e) {
                e.printStackTrace();
                // 파일 저장 실패 시 처리
            }
        } else {
            System.out.println("이미지가 업로드되지 않았습니다.");
        }
    	
        int result = service.storeNewsInsert(dto);
    	System.out.println("fffffff");
    	
        String msg = result > 0 ? "소식 등록되었습니다." : "소식 등록되지 않았습니다. 다시 신청해주세요.";
        String goPage = "storeNewsList";
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    }
}
