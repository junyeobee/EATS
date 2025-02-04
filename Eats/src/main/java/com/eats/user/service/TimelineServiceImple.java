package com.eats.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.user.TimelineMapper;
import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.FollowDTO;
import com.eats.user.model.TimelineDTO;

@Service
public class TimelineServiceImple implements TimelineService {
	
	@Autowired
	TimelineMapper mapper;
	
	//유저 랜덤 추천
	@Override
	public List<TimelineDTO> randomuser(Integer userIdx) {
		
		List<TimelineDTO> lists= mapper.randomuser(userIdx);
		
		return lists;
	}
	
	
	//리뷰 리스트 출력
	@Override
	public List<TimelineDTO> selectReviewList() {
		
		List<TimelineDTO> review= mapper.selectReviewList();
		
		return review;
	}
	
	@Override
	public List<TimelineDTO> selectFollowerReview(Integer idx) {
		List<TimelineDTO> lists_fw = mapper.selectFollowerReview(idx);
		return lists_fw;
	}
	
	@Override
	public int userFollow(Map<String,Integer> map) {
		int result = mapper.userFollow(map);
		return result;
	}
	
	@Override
	public int unFollow(Map<String, Integer> map) {
		int result = mapper.unFollow(map);
		return result;
	}
	
	
	@Override
	public TimelineDTO timeLineProfile(int userIdx) {
	
		TimelineDTO dto = mapper.timeLineProfile(userIdx);
		
		return dto;
	}

	
	@Override
	public List<TimelineDTO> followerList(Integer userIdx) {
		
		List<TimelineDTO> dto= mapper.followerList(userIdx);
		
		return dto;
	}
}
