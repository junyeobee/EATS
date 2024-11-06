package com.eats.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eats.user.model.AreaDTO;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService ms;

	@GetMapping("/")
	public ModelAndView mainPage(@RequestParam(required=false) String selectArea) {
		
		List<CateKeyDTO> keyList = ms.getCateKey();
		Map<String, List<String>> valueList=new HashMap<>();
		
		for(int i=0; i<keyList.size();i++) {
			valueList.put(keyList.get(i).getCate_key_name(), ms.getValueList(keyList.get(i).getCate_key_idx()));
		}
		
		List<AreaDTO> cityList = ms.getCityList();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("keyList", keyList);
		mv.addObject("valueList", valueList);
		
		mv.addObject("cityList", cityList);
		
		mv.addObject("selectArea",selectArea);
		mv.setViewName("index");
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/selectUnit")
	public ModelAndView selectUnit(int cityIdx) {
		
		List<String> unitList=cityIdx!=0?ms.getUnitList(cityIdx):null;
		System.out.println(unitList);
		System.out.println(cityIdx);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("unitList", unitList);
		mv.setViewName("user/home/resultArea");
		
		return mv;
	}

}
