package com.eats.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.user.TimelineMapper;
import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.TimelineDTO;

@Service
public class TimelineServiceImple implements TimelineService {
	
	@Autowired
	TimelineMapper mapper;
	
	//유저 랜덤 추천
	@Override
	public List<TimelineDTO> randomuser() {
		
		List<TimelineDTO> lists= mapper.randomuser();
		
		return lists;
	}

}
