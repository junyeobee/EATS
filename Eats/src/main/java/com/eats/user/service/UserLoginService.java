package com.eats.user.service;

import java.util.Map;

import org.springframework.stereotype.Service;

public interface UserLoginService {
	
	public boolean loginCheck(String userId, String userPwd);
	public Map<String, Object> getUserInfo(String userId);
}
