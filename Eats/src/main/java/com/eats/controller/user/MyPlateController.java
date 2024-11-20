package com.eats.controller.user;

import java.io.File;
import java.io.IOException;
import java.lang.module.ModuleDescriptor.Requires;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.HYMenuCateDTO;
import com.eats.store.model.HYMenuDTO;
import com.eats.user.model.ReservationDTO;
import com.eats.user.model.ReviewDTO;
import com.eats.user.service.UserReviewService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyPlateController {
	
	@Autowired
	private UserReviewService reviewService;
		
	@Value("${review.upload.path}")
	private String uploadPath;

	@GetMapping("/user/writeReview")
	public ModelAndView goWriteReview(
			@RequestParam(value="reserve_idx", required=true)int reserve_idx) {
		
		Map storeInfo = reviewService.getStoreInfoByReserveIdx(reserve_idx);
		ReservationDTO reserveDTO = reviewService.getReserveInfo(reserve_idx);
		List<HYMenuCateDTO> menuCateList = reviewService.getMenuCateListByReserveIdx(reserve_idx);
		List<HYMenuDTO> menuList = reviewService.getMenuListByReserveIdx(reserve_idx);
		List<String> tagList = reviewService.tagList();
		
		ModelAndView mv=new ModelAndView();
		
		if(storeInfo==null || storeInfo.size()==0 || reserveDTO==null || menuCateList==null || menuCateList.size()==0 
				|| menuList==null || menuList.size()==0 || tagList==null || tagList.size()==0 ) {
			mv.addObject("errorMsg", "잘못된 접근입니다.");
			mv.addObject("goTo", "/");
			mv.setViewName("user/myplate/error");
		}else {
			mv.addObject("storeInfo", storeInfo);
			mv.addObject("reserveDTO", reserveDTO);
			mv.addObject("menuCateList", menuCateList);
			mv.addObject("menuList", menuList);
			mv.addObject("tagList", tagList);
			mv.setViewName("user/myplate/writeReview");
		}
		return mv;
	}
	
	@PostMapping("/user/insertReview")
	public String reviewSubmit(
			@RequestParam("reserve_idx")int reserve_idx, 
			@RequestParam("rev_score")int rev_score, 
			@RequestParam("rev_content") String rev_content,  
			@RequestParam(value="images", required=false) List<MultipartFile> images, 
			@RequestParam("rev_menu") String rev_menu, 
			@RequestParam(value="rev_tag", required=false) String rev_tag,
			Model model, HttpServletRequest req,
			HttpSession session) {
		
		String failedCallback=req.getHeader("Referer");
		
		String projectPath=System.getProperty("user.dir");
		List<String> imgNameList = new ArrayList<String>();
		String redirectUri="";
		
		if( images!=null && !images.isEmpty() && images.size()!=0 ) {
			
			File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs();
	        }
	        
	        for (int i = 0; i < images.size(); i++) {
	            MultipartFile image = images.get(i);
	            String originalFilename = image.getOriginalFilename();
	            String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	            
	            // 새 파일명 생성: reserve_idx_순번.확장자
	            String newFileName = reserve_idx + "_" + (i + 1) + extension;
	            
	            try {
	                // 파일 저장
	                File newFile = new File(projectPath + uploadPath + newFileName);
	                image.transferTo(newFile);
	                
	                // 파일명 리스트에 추가
	                imgNameList.add(newFileName);
	                
	                
	            } catch (IOException e) {
	                e.printStackTrace();
	                
	            }
	        }
		}else {
			System.out.println("images is null");
		}
		
		String dbSave="";
		
		for(int i=0; i<imgNameList.size(); i++) {
			if(i==0) {
				dbSave+=imgNameList.get(i);
			}else {
				dbSave+=","+imgNameList.get(i);
			}
		}
		
		ReviewDTO dto=new ReviewDTO(0, reserve_idx, rev_score, rev_content, null, 1, dbSave, rev_menu, rev_tag);
		int result=reviewService.insertReview(dto);
		
		if(result>0) {
			model.addAttribute("msg", "리뷰 등록 성공!");
			model.addAttribute("goTo", "/");
		}else {
			model.addAttribute("msg", "리뷰 등록 실패");
			model.addAttribute("goTo", failedCallback);
		}
		
		return "user/myplate/msg";
	}
	
	@GetMapping("/user/myPlate")
	public String goMyPlate() {
		return "user/myplate/main";
	}
}