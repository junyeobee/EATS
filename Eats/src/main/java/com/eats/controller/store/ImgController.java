package com.eats.controller.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ImgController {

	
	@GetMapping("/store/storeImg")
	public String storeImg() {
		
		return "store/imgControl/imgList";
	}
}
