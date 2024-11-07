package com.eats.controller.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreMenuController {

	@GetMapping("storeMenuList")
	public String storeMenuList(){
		
		return"store/menu/menuList";
		
	}
}
