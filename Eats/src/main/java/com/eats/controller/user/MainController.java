package com.eats.controller.user;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eats.user.model.AreaDTO;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.ReviewDTO;
import com.eats.user.service.MainService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MainController {

	@Autowired
	private MainService ms;

	@GetMapping("/")
	public ModelAndView mainPage() {
		
		List<CateKeyDTO> keyList = ms.getCateKey();
		Map<String, List<String>> valueList = new HashMap<>();

		for (int i = 0; i < keyList.size(); i++) {
			valueList.put(keyList.get(i).getCate_key_name(), ms.getValueList(keyList.get(i).getCate_key_idx()));
		}

		List<AreaDTO> cityList = ms.getCityList();
		
		List<Integer> revIdxList = ms.getPopularReviews();
		List<ReviewDTO> reviewData = new ArrayList<ReviewDTO>();
		for(int idx:revIdxList) {
			reviewData.add(ms.getReview(idx));
		}

		List<Double> storePoint=new ArrayList<>();
		for(ReviewDTO rev_dto:reviewData) {
		storePoint.add(ms.getStorePoint(rev_dto.getStore_idx())); }
		
		List<Integer> likeCount = new ArrayList<>();
		for(int idx:revIdxList) {
			likeCount.add(ms.getLikeCount(idx));
		}
		
		List<Integer> followCount = new ArrayList<>();
		for(ReviewDTO rev_dto:reviewData) {
			followCount.add(ms.getFollowerCount(rev_dto.getUser_idx()));
		}
	
		ModelAndView mv = new ModelAndView();
		mv.addObject("keyList", keyList);
		mv.addObject("valueList", valueList);
		mv.addObject("cityList", cityList);
		mv.addObject("reviewData", reviewData);
		mv.addObject("storePoint",storePoint);
		mv.addObject("likeCount",likeCount);
		mv.addObject("followCount",followCount);
		mv.setViewName("index");

		return mv;
	}

	@ResponseBody
	@GetMapping("/selectUnit")
	public ModelAndView selectUnit(int cityIdx) {
		List<String> unitList = cityIdx != 0 ? ms.getUnitList(cityIdx) : null;

		ModelAndView mv = new ModelAndView();
		mv.addObject("unitList", unitList);
		mv.setViewName("user/home/resultArea");

		return mv;
	}

	@GetMapping("/selectArea")
	public String selectArea(String selectArea, HttpServletResponse resp, HttpServletRequest req) {
		Cookie cks[] = req.getCookies();
		for(Cookie temp:cks) {
			if(temp.getName().equals("areaCk")) {
				temp.setMaxAge(0);
			}
		}
		Cookie ck = new Cookie("areaCk", selectArea);
		ck.setMaxAge(60);
		resp.addCookie(ck);

		return "index";
	}

}
