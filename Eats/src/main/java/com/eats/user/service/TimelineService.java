package com.eats.user.service;

import java.util.List;
import java.util.Map;

import com.eats.user.model.TimelineDTO;

public interface TimelineService {
	
	public List<TimelineDTO> randomuser(Integer userIdx);
	
	public List<TimelineDTO> selectReviewList();
	
	public List<TimelineDTO> selectFollowerReview(Integer idx);
	
	public int userFollow(Map<String, Integer> map);
	
	public int unFollow(Map<String, Integer> map);
	
	public TimelineDTO timeLineProfile(int userIdx);
	
	public List<TimelineDTO> followerList(Integer userIdx);
	

}
