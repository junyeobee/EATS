package com.eats.user.service;

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
	public void insertUserAndProfile(EatsUserDTO userDTO) {
		
		//mapper.insertUser(userDTO);
	}
}
