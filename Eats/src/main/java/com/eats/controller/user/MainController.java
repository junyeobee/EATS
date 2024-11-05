package com.eats.controller.user;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;
import com.eats.user.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService ms;

	@GetMapping("/")
	public ModelAndView mainPage() {
		
		List<CateKeyDTO> keyList = ms.getCateKey();
		Map<String, List<String>> valueList=new HashMap<>();
		
		for(int i=0; i<keyList.size();i++) {
			valueList.put(keyList.get(i).getCate_key_name(), ms.getValueList(keyList.get(i).getCate_key_idx()));
		}		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("keyList", keyList);
		mv.addObject("valueList", valueList);
		mv.setViewName("index");
		
		return mv;
	}
}
