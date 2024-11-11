package com.eats.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public Map<String,String> addTag(CateValueDTO dto) {
		int count = ts.addCateValue(dto);
		Map<String,String> map = new HashMap<>();
		map.put("catevalue",dto.getCate_value_name());
		map.put("catekey", ""+dto.getCate_key_idx());
		
		return map;
	}
	
	@ResponseBody
	@PostMapping("deleteTag")
	public Map<String,String> deleteTag(CateValueDTO dto) {
		ts.deleteCateValue(dto);
		Map<String,String> map = new HashMap<>();
		map.put("catekey", ""+dto.getCate_key_idx());
		map.put("keyname", ts.getCateKeyName(dto.getCate_key_idx()));
		map.put("catevalue", dto.getCate_value_name());
		
		return map;
	}
	
	@ResponseBody
	@GetMapping("deleteCategory")
	public Map<String, String> deleteCategory(String cate_key_name, int cate_key_idx) {
		ts.deleteCategoryFromValue(cate_key_idx);
		ts.deleteCategory(cate_key_idx);

		Map<String, String> map = new HashMap<>();
		map.put("cate_key", cate_key_name);
		
		return map;
	}
	
	@ResponseBody
	@GetMapping("editTag")
	public Map<String, String> updateTag(String new_tag_name, int cate_key_idx, String cate_value_name){
		Map<String, Object> xmlMap = new HashMap<>();
		xmlMap.put("new_tag_name", new_tag_name);
		xmlMap.put("cate_key_idx", cate_key_idx);
		xmlMap.put("cate_value_name", cate_value_name);
		ts.updateTag(xmlMap);
		
		Map<String, String> map = new HashMap<>();
		map.put("new_tag", new_tag_name);
		map.put("cate_key_idx", ""+cate_key_idx);
		
		return map;
	}
	
	@ResponseBody
	@GetMapping("addCategory")
	public Map<String, Object> addCategory(String cate_key_name, int cate_key_level, String cate_value_name) {
		Map<String, Object> map = new HashMap<>();
		
		CateKeyDTO keydto = new CateKeyDTO();
		keydto.setCate_key_name(cate_key_name);
		keydto.setCate_key_level(cate_key_level);
		ts.addNewCategory(keydto);
		map.put("cate_key", cate_key_name);
		
		int key_idx = ts.getCateIdxByName(cate_key_name);
		map.put("key_idx", key_idx);

		String cate_value[] = cate_value_name.split(",");
		
		List<String> values = new ArrayList<String>();
		
		for(int i=0; i<cate_value.length; i++) {
			CateValueDTO valuedto = new CateValueDTO();
			valuedto.setCate_key_idx(key_idx);
			valuedto.setCate_value_name(cate_value[i]);
			ts.addCateValue(valuedto);
			
			values.add(cate_value[i]);
		}
		
		map.put("cate_values", values);
		
		return map;
	}
	
}
