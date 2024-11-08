package com.eats.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eats.admin.service.TagService;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;
import com.eats.user.service.MainService;

@Controller
public class TagController {
	
	@Autowired
	private MainService ms;
	@Autowired
	private TagService ts;

	@GetMapping("tagPage")
	public ModelAndView tagPage() {
		
		List<CateKeyDTO> keyList = ms.getCateKey();
		Map<String, List<String>> valueList = new HashMap<>();
		Map<String, Integer> idxList = new HashMap<>();

		for (int i = 0; i < keyList.size(); i++) {
			valueList.put(keyList.get(i).getCate_key_name(), ms.getValueList(keyList.get(i).getCate_key_idx()));
			idxList.put(keyList.get(i).getCate_key_name(), keyList.get(i).getCate_key_idx());
		}
		
		ModelAndView mv= new ModelAndView();
		mv.addObject("keyList", keyList);
		mv.addObject("valueList", valueList);
		mv.addObject("idxList", idxList);
		mv.setViewName("admin/attr/manageTag");
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("addTag")
	public Map addTag(CateValueDTO dto) {
		int count = ts.addCateValue(dto);
		Map map = new HashMap();
		map.put("catevalue",dto.getCate_value_name());
		return map;
	}
}
