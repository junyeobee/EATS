package com.eats.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;
import com.eats.user.service.MainService;
import com.eats.user.service.SearchService;

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
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("tagWord", tagWord);
		mv.addObject("word", word);
		mv.addObject("areaWord", areaWord);
		mv.addObject("valueList",valueList);
		mv.addObject("keyList", keyList);
		mv.setViewName("user/search/searchStore");

		return mv;
	}
	
	@GetMapping("/searchStoreWithFilter")
	public Map<String, String> searchStoreWithFilter(){
		
		Map<String, String> map = new HashMap<>();
		
		return map;
	}
	
	@GetMapping("getAddr")
	public String getAddr() {
		return "user/home/getAddr";
	}
}
