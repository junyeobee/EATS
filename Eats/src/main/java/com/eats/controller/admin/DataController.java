package com.eats.controller.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DataController {

	@GetMapping("searchData")
	public Map<String, String> searchData() {
		Map<String, String> map = new HashMap<>();
		map.put("name", "name");
		map.put("age", "20");
		
		return map;
	}
}
