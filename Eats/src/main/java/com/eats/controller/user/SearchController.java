package com.eats.controller.user;

import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.StoreDTO;
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
	public ModelAndView searchStore(@RequestParam(required = false) String tagWord,
			@RequestParam(required = false) String word, @RequestParam(required = false) String areaWord) {

		if (word != null && !word.equals("")) {
			ss.addSearchWord(word);
		}
		
		List<CateKeyDTO> keyDTOList = ms.getCateKey();
		Map<String, List<String>> valueList = new HashMap<>();
		Map<String, Integer> keyList = new HashMap<>();
		for(CateKeyDTO dto:keyDTOList) {
			valueList.put(dto.getCate_key_name(), ms.getValueList(dto.getCate_key_idx()));
			keyList.put(dto.getCate_key_name(), dto.getCate_key_idx());
		}List<StoreDTO> storeList = ss.getStoreInfo();
		
		List<AreaDTO> cityList = ms.getCityList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("tagWord", tagWord);
		mv.addObject("word", word);
		mv.addObject("areaWord", areaWord);
		mv.addObject("valueList",valueList);
		mv.addObject("keyList", keyList);
		mv.addObject("cityList", cityList);
		mv.addObject("storeList", storeList);
		mv.setViewName("user/search/searchStore");

		return mv;
	}
	
	@GetMapping("/searchStoreWithFilter")
	public Map<String,Object> searchStoreWithFilter(){
		List<StoreDTO> storeList = ss.getStoreInfo();
		
		Map<String,Object> map = new HashMap<>();
		map.put("storeList", storeList);
		return map;
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
		ck.setMaxAge(60*60*24);
		ck2.setMaxAge(60*60*24);
		resp.addCookie(ck);
		resp.addCookie(ck2);

		return "user/search/searchStore";
	}
}
