package com.eats.admin.service;

public interface AdminLoginService {

	public int loginAuth(String userId, String userPwd);
	public int getAdmin(String userId);
	
}
