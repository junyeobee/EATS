package com.eats.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.admin.AdminMapper;

@Service
public class AdminLoginServiceImple implements AdminLoginService{

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public int loginAuth(String adminId, String adminPwd) {
		
		String dbpwd = mapper.loginAuth(adminId);
		
		int result = 0;
		
		if(dbpwd==null || dbpwd=="") {
			result = 1;
		}else {
			if(adminPwd.equals(dbpwd)) {
				result = 3;
			}else {
				result = 2;
			}
		}
		
		return result;
	}
	
	@Override
	public int getAdmin(String adminId) {
		
		int adminidx = mapper.getAdmin(adminId);
		
		return adminidx;
	}
}
