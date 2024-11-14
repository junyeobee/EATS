package com.eats.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		List<TimelineDTO> review= service.selectReviewList();
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("review",review);
		mav.setViewName("user/timeLine/timeLine");

		return mav;
	}
	
	
	@ResponseBody
	@GetMapping("/followerReviewAjax")
	public List<TimelineDTO> followerReviewAjax(@RequestParam(value="idx", required=false, defaultValue="0")Integer idx){
		
		List<TimelineDTO> lists_fw= service.selectFollowerReview(idx);
		
		return lists_fw;
	}
	
	
	

	
	

	
	
	
}
