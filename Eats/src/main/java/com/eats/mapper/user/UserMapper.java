package com.eats.mapper.user;

import java.util.Map;

import com.eats.user.model.EatsUserDTO;

public interface UserMapper {

	public String loginCheck(String userId);
	public Map<String, Object> getUserInfo(String userId);
	public String findId(Map<String, String> map);
	public String idCheckForFindPwd(String userId);
	public int userResetPwd(Map<String, String> map);
}
