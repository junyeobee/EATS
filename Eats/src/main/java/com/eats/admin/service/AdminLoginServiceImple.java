package com.eats.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.admin.AdminMapper;

@Service
public class AdminLoginServiceImple implements AdminLoginService{

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public int loginAuth(String userId, String userPwd) {
		
		return 0;
	}
	
	@Override
	public int getAdmin(String userId) {
		
		return 0;
	}
}
