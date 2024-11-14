package com.eats.controller.store;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

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

import com.eats.store.model.StoreNewsDTO;
import com.eats.store.service.StoreNewsService;

@Controller
public class StoreNewsController {

    @Autowired
    private StoreNewsService service;
    
    private final String filePathValue = "C:/ssangyoung_java/eats/EATS/Eats/src/main/webapp/storeNewsImg/";
    
    //db에 저장되는 파일 경로
    private String db_filePath = "/storeNewsImg/";

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

        // 유효성 검사 실패 시 처리
        if (bindingResult.hasErrors()) {
            System.out.println("에러~~~: " + bindingResult.getAllErrors());
            System.out.println("input으로 받아오는 값이 null인 경우에 유효성 검사 해주는데 null이면 해당 메시지 출력됨");
        }
        // 이미지가 업로드 되었는지 확인
        if (!img.isEmpty()) {
            try {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
                String formattedDate = LocalDateTime.now().format(formatter);

                // 파일명에 날짜와 시간 추가
                String fileName = img.getOriginalFilename().substring(0, img.getOriginalFilename().lastIndexOf(".")) + "_" + formattedDate + img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf("."));
                
                String filePath = filePathValue + fileName;
                
                File file = new File(filePath);
                img.transferTo(file); // 파일을 실제로 저장하는 코드
                //dto.setS_news_img(fileName);
                dto.setS_news_img(db_filePath+fileName);

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
    	
        String msg = result > 0 ? "소식 등록되었습니다." : "소식 등록되지 않았습니다. 다시 입력해주세요.";
        String goPage = "storeNewsList?news_idx=";
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    }


    // POST 요청을 처리하는 메서드
    @PostMapping("/store/storeNewsUpdate")
    public ModelAndView storeNewsUpdate(@ModelAttribute StoreNewsDTO dto, 
                                      BindingResult bindingResult,
                                      @RequestParam("s_news_img") MultipartFile img) {
        // 유효성 검사 실패 시 처리
        if (bindingResult.hasErrors()) {
            System.out.println("에러~~~: " + bindingResult.getAllErrors());
            System.out.println("input으로 받아오는 값이 null인 경우에 유효성 검사 해주는데 null이면 해당 메시지 출력됨");
        }

        // 이미지가 업로드 되었는지 확인
        if (!img.isEmpty()) {
            try {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
                String formattedDate = LocalDateTime.now().format(formatter);

                // 파일명에 날짜와 시간 추가
                String fileName = img.getOriginalFilename().substring(0, img.getOriginalFilename().lastIndexOf(".")) + "_" + formattedDate + img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf("."));
                

                String filePath = filePathValue + fileName;
                
                File file = new File(filePath);
                img.transferTo(file); // 파일을 실제로 저장하는 코드
                dto.setS_news_img(db_filePath+fileName);

                System.out.println("파일 저장 경로: " + filePath);

            } catch (IOException e) {
                e.printStackTrace();
                // 파일 저장 실패 시 처리
            }
        } else {
            System.out.println("이미지가 업로드되지 않았습니다.");
        }
    	
        int result = service.storeNewsUpdate(dto);
    	System.out.println("fffffff");
    	
        String msg = result > 0 ? "소식 수정되었습니다." : "소식 수정되지 않았습니다. 다시 입력해주세요.";
        String goPage = "storeNewsRead?news_idx="+dto.getS_news_idx();
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    }

    
    @GetMapping("/store/storeNewsUpDel")
    public ModelAndView storeNewsUpDel(@RequestParam(value = "news_idx", required = false) Integer s_news_idx) {
    	
        if (s_news_idx != null) {
            System.out.println("News Index: " + s_news_idx);
            // s_news_idx가 존재할 경우의 처리
        } else {
            System.out.println("no value~~~~~~~~");
            // s_news_idx가 없는 경우의 처리
        }
    	System.out.println(s_news_idx);
    	
        int result = service.storeNewsUpDel(s_news_idx);
        String msg = result > 0 ? "소식 삭제 되었습니다." : "소식 삭제되지 않았습니다. 다시 삭제해주세요.";
        String goPage = "storeNewsList";
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    }
}
