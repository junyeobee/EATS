package com.eats.user.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.user.UserMapper;
import com.eats.user.model.EatsUserDTO;

@Service
public class UserLoginServiceImple implements UserLoginService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public boolean loginCheck(String userId, String userPwd) {
		
		String dbPwd=mapper.loginCheck(userId);
		
		boolean result;
		if(dbPwd==null || dbPwd=="") {
			//아이디 없음
			result=false;
			System.out.println("아이디없음");
		}else {
			if(userPwd.equals(dbPwd)) {
				//로그인성공
				result=true;
			}else {
				//비밀번호 틀림
				result=false;
			}
		}
		return result;
	}
	
	@Override
	public Map<String, Object> getUserInfo(String userId) {
		
		Map<String, Object> map=mapper.getUserInfo(userId);
		
		return map;
	}
	
	@Override
	public String findId(String userName, String userEmail) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("userName", userName);
		map.put("userEmail", userEmail);
		String userId=mapper.findId(map);
        
		return userId;
	}
	
	@Override
	public String idCheckForFindId(String userId) {
		
		String userEmail=mapper.idCheckForFindPwd(userId);
		return userEmail;
	}
	
	@Override
	public int userResetPwd(String userId, String newPwd) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("userId", userId);
		map.put("newPwd", newPwd);
		
		int result=mapper.userResetPwd(map);
		
		return result;
	}
}
