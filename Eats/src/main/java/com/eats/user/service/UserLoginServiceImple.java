package com.eats.user.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eats.mapper.user.UserMapper;
import com.eats.user.model.EatsProfileDTO;
import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.EatsUserWrapperDTO;

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
	
	@Transactional
	@Override
	public int insertuser(EatsUserDTO userDTO, EatsProfileDTO profileDTO) {
		int userresult = 0;
		int profileresult = 0;
		
		try {
			userresult = mapper.insertuser(userDTO);
			
			if (userresult > 0) {
		        profileDTO.setUser_idx(userDTO.getUser_idx());
		        profileresult = mapper.insertprofile(profileDTO);
			} 
			
			if (userresult > 0 && profileresult > 0) {
	            return 1; 
	        } else {
	            return 0; 
	        }
		}catch (Exception e) {
			return 0; 
		}
	}

	@Override
	public int idcheck(String userId) {
		int result = 0;
		result = mapper.idcheck(userId);
		
		return result;
	}

	@Override
	public int nickcheck(String userNick) {
		int result = 0;
		result = mapper.nickcheck(userNick);
		
		return result;
	}

	@Override
	public int telcheck(String userTel) {
		int result = 0;
		result = mapper.telcheck(userTel);
		
		return result;
	}
	
}
