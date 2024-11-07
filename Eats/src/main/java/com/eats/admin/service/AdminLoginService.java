package com.eats.admin.service;

public interface AdminLoginService {

	public int loginAuth(String adminId, String adminPwd);
	public int getAdmin(String adminId);
	
}
