package com.eats.controller.user;

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

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.TimelineDTO;
import com.eats.user.service.TimelineService;

import jakarta.servlet.http.HttpSession;

@Controller
public class TimeLineController {
	@Autowired
	TimelineService service;

	@GetMapping("/timeLineMain")
	public ModelAndView timelineMain(Integer userIdx, HttpSession session) {
		
		userIdx = (int) session.getAttribute("user_idx"); 
		
	
		List<TimelineDTO> lists= service.randomuser(userIdx);
		
		List<TimelineDTO> review= service.selectReviewList();
		
		TimelineDTO profile = service.timeLineProfile(userIdx);
		
		/* List<TimelineDTO> follow=service.followerList(userIdx); */
	
		
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.addObject("review",review);
		mav.addObject("profile",profile);
		/* mav.addObject("follow",follow); */
		
		mav.setViewName("user/timeLine/timeLine");

		return mav;
	}
	
	
	@ResponseBody
	@GetMapping("/followerReviewAjax")
	public List<TimelineDTO> followerReviewAjax(@RequestParam(value="idx", defaultValue="0")Integer userIdx,
			@RequestParam(value="following_idx")int followingIdx){
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("user_idx", userIdx);
		map.put("following_idx", followingIdx);
		
		service.userFollow(map);
		
		List<TimelineDTO> lists_fw= service.selectFollowerReview(followingIdx);
		
		return lists_fw;
	}
	
	
	@ResponseBody
	@GetMapping("/unFollowAjax")
	public Map<String, Object> unFollow(@RequestParam(value="idx", defaultValue = "0")Integer userIdx,          
			@RequestParam(value="following_idx")int followingIdx) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("user_idx", userIdx);
		map.put("following_idx", followingIdx);
		
		int result = service.unFollow(map);
		
		
	    Map<String, Object> response = new HashMap<>();
	    response.put("result", result > 0);
	    response.put("following_idx", followingIdx); 
	    
	    return response;
		
	}
	
	
	
	
	
	

	
	
	
	

	

	
	
	

	
	

	
	
	
}
