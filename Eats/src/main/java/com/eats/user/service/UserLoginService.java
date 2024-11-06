package com.eats.user.service;

import java.util.Map;

import org.springframework.stereotype.Service;

public interface UserLoginService {
	
	public boolean loginCheck(String userId, String userPwd);
	public Map<String, Object> getUserInfo(String userId);
	public String findId(String userName, String userEmail);
	public String idCheckForFindId(String userId);
	public int userResetPwd(String userId, String newPwd);
}
