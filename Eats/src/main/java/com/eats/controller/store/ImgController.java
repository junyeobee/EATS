package com.eats.controller.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eats.store.model.StoreImgDTO;
import com.eats.store.service.StoreImgService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ImgController {

	@Autowired
	private StoreImgService service;

    private final String uploadDir = "uploads/"; // 업로드할 디렉토리 경로
	
	@GetMapping("/store/storeImg")
	public String storeImg() {
		
		return "store/imgControl/imgCont";
	}


	@PostMapping("/store/imgSave")
	public ModelAndView StoreImgAdd(StoreImgDTO dto) {
		
	
		int result = service.storeImgInsert(dto);
		String msg = result > 0 ? "이미지 등록 완료되었습니다." : "이미지가 등록되지 않았습니다. 다시 등록하세요.";
		String goPage = "storeImg";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goPage", goPage);
		mav.setViewName("store/common/basicMsg");

		return mav;
	}
}
