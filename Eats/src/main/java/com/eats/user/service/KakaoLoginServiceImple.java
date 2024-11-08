package com.eats.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.kakao.model.KakaoUserDTO;
import com.eats.mapper.user.KakaoUserMapper;
import com.eats.user.model.EatsUserDTO;

@Service
public class KakaoLoginServiceImple implements KakaoLoginService {

	@Autowired
	private KakaoUserMapper mapper;
	
	@Override
	public EatsUserDTO checkUserIdx(String kakaoId) {
		EatsUserDTO dto=mapper.kakaoIdCheck(kakaoId);
		
		return dto;
	}

	@Override
	public int insertKakaoUser(KakaoUserDTO dto) {
		
		int result=mapper.insertUser(dto);
		return result;
	}

	@Override
	public int insertUserProfile(Map map) {
		int result=mapper.insertUserProfile(map);
		return result;
	}
}
