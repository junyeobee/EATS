package com.eats.mapper.user;

import java.util.Map;

import com.eats.kakao.model.KakaoUserDTO;
import com.eats.user.model.EatsUserDTO;

public interface KakaoUserMapper {

	public EatsUserDTO kakaoIdCheck(String kakaoId);
	public int insertUser(KakaoUserDTO dto);
	public int getNewUserIdx();
	public int insertUserProfile(Map map);
}
