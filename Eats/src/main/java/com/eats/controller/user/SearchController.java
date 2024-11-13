package com.eats.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.user.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	private SearchService ss;

	@GetMapping("/searchStore")
	public ModelAndView searchStore(@RequestParam(required = false) String tagWord,
			@RequestParam(required = false) String word, @RequestParam(required = false) String areaWord) {

		if (word != null && !word.equals("")) {
			ss.addSearchWord(word);
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("tagWord", tagWord);
		mv.addObject("word", word);
		mv.addObject("areaWord", areaWord);
		mv.setViewName("user/search/searchStore");

		return mv;
	}
}
