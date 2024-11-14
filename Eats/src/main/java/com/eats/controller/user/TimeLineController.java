package com.eats.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.TimelineDTO;
import com.eats.user.service.TimelineService;

@Controller
public class TimeLineController {
	@Autowired
	TimelineService service;

	@GetMapping("/timeLineMain")
	public ModelAndView timelineMain() {
		
		List<TimelineDTO> lists= service.randomuser();
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("lists", lists);
		mav.setViewName("user/timeLine/timeLine");
		
		return mav;

		 
	}
	

	
	
	
}
