package com.eats.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eats.kakao.model.KakaoUserDTO;
import com.eats.mapper.user.KakaoUserMapper;
import com.eats.user.model.EatsUserDTO;

@Service
public class KakaoLoginServiceImple implements KakaoLoginService {

	@Autowired
	private KakaoUserMapper mapper;
	
	public KakaoLoginServiceImple() {
		
	}
	
	public KakaoLoginServiceImple(KakaoUserMapper mapper) {
		this.mapper=mapper;
	}
	
	@Override
	public EatsUserDTO checkUserIdx(String kakaoId) {
		EatsUserDTO dto=mapper.kakaoIdCheck(kakaoId);
		return dto;
	}

	@Override
	@Transactional
	public int insertUserAndProfile(KakaoUserDTO dto) {
		
		int userResult = mapper.insertUser(dto);
		
		if(userResult>0) {
			//insertUser가 잘 수행되면 insertUserProfile도 수행
			int newIdx=mapper.getNewUserIdx(); //새로 삽입된 user_idx 가져오기
			
			//파라미터 map에 넣기
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("user_idx", newIdx);
			param.put("user_nickname", dto.getNickname());
			
			//insertUserProfile 수행
			int userProfileResult = mapper.insertUserProfile(param);
			
			//userProfile이 잘 수행?
			if(userProfileResult>0) {
				return newIdx;
			}else {
				return -1;
			}
		}else {
			return -1;
		}
	}
}
