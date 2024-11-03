package com.eats.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.user.UserMapper;

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

}
