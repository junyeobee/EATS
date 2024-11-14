package com.eats.user.service;

import java.util.List;

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.TimelineDTO;

public interface TimelineService {
	
	public List<TimelineDTO> randomuser();
	
	public List<TimelineDTO> selectReviewList();
	
	public List<TimelineDTO> selectFollowerReview(Integer idx);
	
	

}
