package com.eats.controller.user;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.HYStoreDTO;
import com.eats.user.model.AreaDTO;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;
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
		Map<String, Object> forStore = new HashMap<>();
		
		LocalDate today = LocalDate.now();
        DayOfWeek dayOfWeek = today.getDayOfWeek();
        String[] koreanDays = {"일", "월", "화", "수", "목", "금", "토"};
		forStore.put("week", koreanDays[dayOfWeek.getValue() % 7]);
		forStore.put("cityWord", cityWord);
		forStore.put("unitWord", unitWord);
		
		List<HYStoreDTO> jcntList = ms.getStoreByJjimCount(forStore);
		List<HYStoreDTO> pointList = ms.getStoreByStarPoint(forStore);
		
        ModelAndView mv = new ModelAndView();
		
		List<CateKeyDTO> keyList = ms.getCateKey();
		Map<String, List<CateValueDTO>> valueList = new HashMap<>();
		Map<String, Integer> idxList = new HashMap<>();

		for (int i = 0; i < keyList.size(); i++) {
			valueList.put(keyList.get(i).getCate_key_name(), ms.getCateValues(keyList.get(i).getCate_key_idx()));
			idxList.put(keyList.get(i).getCate_key_name(), keyList.get(i).getCate_key_idx());
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
			
			List<String> tags = new ArrayList<>();

			for (ReviewDTO rev_dto : reviewData) {
				if(rev_dto!=null) {
					storePoint.add(ms.getStorePoint(rev_dto.getStore_idx()));
					followCount.add(ms.getFollowerCount(rev_dto.getUser_idx()));
	
					String[] tag_arr = rev_dto.getRev_tag().split(",");
					for(String str:tag_arr) {
						tags.add(str);
					}
				}
				
				mv.addObject("reviewData", reviewData);
				mv.addObject("storePoint", storePoint);
				mv.addObject("likeCount", likeCount);
				mv.addObject("followCount", followCount);
				mv.addObject("tags", tags);
			}
		}

		mv.addObject("keyList", keyList);
		mv.addObject("idxList", idxList);
		mv.addObject("valueList", valueList);
		mv.addObject("cityList", cityList);
		mv.addObject("jcntList", jcntList);
		mv.addObject("pointList", pointList);
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
