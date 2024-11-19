package com.eats.controller.user;

import java.net.URLConnection;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.HYStoreDTO;
import com.eats.user.model.AreaDTO;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;
import com.eats.user.service.MainService;
import com.eats.user.service.SearchService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class SearchController {

	@Autowired
	private SearchService ss;
	@Autowired
	private MainService ms;

	@GetMapping("/searchStore")
	public ModelAndView searchStore(@RequestParam(value = "tagWord", required = false) String tagIdx,
			@RequestParam(required = false) String word, @RequestParam(required = false) String areaWord,
			@RequestParam(required = false) String selectedDate, @RequestParam(required = false) String selectedTime,
			@RequestParam(required = false) String price) {

		if (word != null && !word.equals("")) {
			ss.addSearchWord(word);
		}

		List<CateKeyDTO> keyDTOList = ms.getCateKey();
		Map<String, List<CateValueDTO>> mainValueList = new HashMap<>();
		Map<String, List<CateValueDTO>> subValueList = new HashMap<>();
		Map<String, Integer> mainKeyList = new HashMap<>();
		Map<String, Integer> subKeyList = new HashMap<>();
		for (CateKeyDTO dto : keyDTOList) {
			if (dto.getCate_key_level() == 1) {
				mainValueList.put(dto.getCate_key_name(), ms.getCateValues(dto.getCate_key_idx()));
				mainKeyList.put(dto.getCate_key_name(), dto.getCate_key_idx());
			} else if (dto.getCate_key_level() == 2) {
				subValueList.put(dto.getCate_key_name(), ms.getCateValues(dto.getCate_key_idx()));
				subKeyList.put(dto.getCate_key_name(), dto.getCate_key_idx());
			}
		}

		List<AreaDTO> cityList = ms.getCityList();

		List<Map<String, Integer>> tagList = new ArrayList<>();

		if (tagIdx != null && !tagIdx.equals("")) {
			String[] tagArr = tagIdx.split(" ");

			for (int i = 0; i < tagArr.length; i++) {
				if (!tagArr[i].equals("")) {
					String[] idxArr = tagArr[i].split(",");

					Map<String, Integer> idxMap = new HashMap<>();
					idxMap.put("keyidx", Integer.parseInt(idxArr[0]));
					idxMap.put("valueidx", Integer.parseInt(idxArr[1]));

					tagList.add(idxMap);
				}
			}
		}

		String week = null;
		if (selectedDate != null && !selectedDate.equals("")) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate date = LocalDate.parse(selectedDate, formatter);

			// 요일을 숫자로 구하기 (1=월요일, 7=일요일)
			int weekNumber = date.getDayOfWeek().getValue();
			switch (weekNumber) {
			case 1: week = "월"; break;
			case 2: week = "화";break;
			case 3: week = "수";break;
			case 4: week = "목";break;
			case 5: week = "금";break;
			case 6: week = "토";break;
			case 7: week = "일";break;
			}
		}
		
		Map<String, Object> words = new HashMap<>();
		words.put("tag", tagList);
		if(areaWord!=null) {
			words.put("city", areaWord.split(" ")[0]);
			words.put("unit", areaWord.split(" ")[1]);
		}

		words.put("date", selectedDate);
		words.put("week", week);
		words.put("time", selectedTime);
		words.put("price", price);
		List<HYStoreDTO> storeList = ss.getStoreInfo(words);
		
		ModelAndView mv = new ModelAndView();
		
		Map<Integer, Integer> reviewCount = new HashMap<>();
		Map<Integer, Double> reviewPoint = new HashMap<>();
		List<Map<String, Double>> location = new ArrayList<>();
		for(HYStoreDTO dto:storeList) {
			reviewCount.put(dto.getStore_idx(), ms.getReviewCountByStoreIdx(dto.getStore_idx())==null?0:ms.getReviewCountByStoreIdx(dto.getStore_idx()));
			reviewPoint.put(dto.getStore_idx(), ms.getStorePoint(dto.getStore_idx()));
			
			Map<String, Double> latlng = new HashMap<>();
			latlng.put("lat", dto.getStore_lat());
			latlng.put("lng", dto.getStore_lng());
			
			location.add(latlng);
		}

		
		mv.addObject("tagList", tagList);
		mv.addObject("tagWord", tagIdx);
		mv.addObject("word", word);
		mv.addObject("areaWord", areaWord);
		mv.addObject("selectedDate", selectedDate);
		mv.addObject("selectedTime", selectedTime);
		mv.addObject("mainValueList", mainValueList);
		mv.addObject("mainKeyList", mainKeyList);
		mv.addObject("subValueList", subValueList);
		mv.addObject("subKeyList", subKeyList);
		mv.addObject("cityList", cityList);
		mv.addObject("storeList", storeList);
		mv.addObject("reviewCount", reviewCount);
		mv.addObject("reviewPoint", reviewPoint);
		mv.addObject("location", location);
		
		mv.setViewName("user/search/searchStore");

		return mv;
	}

	@GetMapping("/setArea")
	public String setArea(String selectCity, String selectUnit, HttpServletResponse resp, HttpServletRequest req) {
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
		ck.setMaxAge(60 * 60 * 24);
		ck2.setMaxAge(60 * 60 * 24);
		resp.addCookie(ck);
		resp.addCookie(ck2);

		return "user/search/searchStore";
	}
	
	@GetMapping("/getAddr")
	public String getAddr() {
		return "user/home/getAddr";
	}
}
