package com.eats.mapper.user;

import java.util.List;

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.TimelineDTO;

public interface TimelineMapper {

	public List<TimelineDTO> randomuser();
	
	public List<TimelineDTO> selectReviewList();
	
	public List<TimelineDTO> selectFollowerReview(Integer idx);
	
	
}
