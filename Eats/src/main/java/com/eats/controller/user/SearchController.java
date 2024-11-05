package com.eats.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	@GetMapping("/searchStore")
	public ModelAndView searchStore(@RequestParam(required = false) String word) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("word", word);
		mv.setViewName("user/search/searchStore");
		
		return mv;
	}
}
