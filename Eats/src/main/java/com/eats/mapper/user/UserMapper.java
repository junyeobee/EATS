package com.eats.mapper.user;

import java.util.Map;

public interface UserMapper {

	public String loginCheck(String userId);
	public Map<String, Object> getUserInfo(String userId);
}
