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
	public ModelAndView mainPage(@CookieValue(value = "cityCk", required = false) String cityWord,
			@CookieValue(value = "unitCk", required = false) String unitWord) {
		ModelAndView mv = new ModelAndView();
		
		List<CateKeyDTO> keyList = ms.getCateKey();
		Map<String, List<String>> valueList = new HashMap<>();

		for (int i = 0; i < keyList.size(); i++) {
			valueList.put(keyList.get(i).getCate_key_name(), ms.getValueList(keyList.get(i).getCate_key_idx()));
		}

		List<AreaDTO> cityList = ms.getCityList();

		List<Integer> revIdxList = ms.getPopularReviews(cityWord, unitWord);
		if (revIdxList.size() > 0) {
			List<ReviewDTO> reviewData = new ArrayList<ReviewDTO>();
			List<Integer> likeCount = new ArrayList<>();
			for (int idx : revIdxList) {
				reviewData.add(ms.getReview(idx));
				likeCount.add(ms.getLikeCount(idx));
			}

			List<Double> storePoint = new ArrayList<>();
			List<Integer> followCount = new ArrayList<>();
			
			String tagIdx_s[] = new String[2];
			int tagIdx[] = new int[2];
			List<List<String>> tags = new ArrayList<>();

			for (ReviewDTO rev_dto : reviewData) {
				if(rev_dto!=null) {
					storePoint.add(ms.getStorePoint(rev_dto.getStore_idx()));
					followCount.add(ms.getFollowerCount(rev_dto.getUser_idx()));
	
					tagIdx_s = rev_dto.getRev_tag().split(",");
	
					tagIdx[0] = Integer.parseInt(tagIdx_s[0]);
					tagIdx[1] = Integer.parseInt(tagIdx_s[1]);
	
					List<String> box = new ArrayList<>();
	
					box.add(ms.getTag(tagIdx[0]));
					box.add(ms.getTag(tagIdx[1]));
	
					tags.add(box);
				}
				
				mv.addObject("reviewData", reviewData);
				mv.addObject("storePoint", storePoint);
				mv.addObject("likeCount", likeCount);
				mv.addObject("followCount", followCount);
				mv.addObject("tags", tags);
				
			}
		}

		mv.addObject("keyList", keyList);
		mv.addObject("valueList", valueList);
		mv.addObject("cityList", cityList);
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
	public String selectArea(String selectCity, String selectUnit, HttpServletResponse resp, HttpServletRequest req) {
		Cookie cks[] = req.getCookies();
		for (Cookie temp : cks) {
			if (temp.getName().equals("cityCk")) {
				temp.setMaxAge(0);
			}
			if (temp.getName().equals("unitCk")) {
				temp.setMaxAge(0);
			}
		}
		Cookie ck = new Cookie("cityCk", selectCity);
		Cookie ck2 = new Cookie("unitCk", selectUnit);
		ck.setMaxAge(60*60*24);
		ck2.setMaxAge(60*60*24);
		resp.addCookie(ck);
		resp.addCookie(ck2);

		return "index";
	}

}
