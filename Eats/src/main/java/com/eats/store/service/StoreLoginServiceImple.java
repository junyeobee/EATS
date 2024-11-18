package com.eats.store.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.LoginMapper;
import com.eats.store.model.EatsStoreDTO;

@Service
public class StoreLoginServiceImple implements StoreLoginService {

	@Autowired
	private LoginMapper mapper;

	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2; // PW 틀렸을 때 쓸 값
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1; // 에러났을 때

	@Override
	public int storeLogin(String storeId, String storePwd) {

		EatsStoreDTO dbPwd = mapper.storeLogin(storeId);
		
		int result=0;

		if (dbPwd == null) {

			result= NOT_ID;
		
		}else if(!dbPwd.getStore_pwd().equals(storePwd)) {
			
			result = NOT_PWD; 	
			

		}else {
			
			result= dbPwd.getStore_idx(); //로그인성공. 매장idx 반환
		}

		return result;
	}
	
	
	
	@Override
	public String findId(EatsStoreDTO dto) {
		String store_id = mapper.findId(dto);

		return store_id;
	}
	
	@Override
	public String storeidCheckForFindPwd(String storeId) {
		
		String userEmail=mapper.storeidCheckForFindPwd(storeId);
		return userEmail;
		
	}
	
	
	@Override
	public int storeUpdatePwd(String storeId, String newPwd) {
		
		Map<String, String> map= new HashMap<String, String>();
		
		map.put("storeId", storeId);
		map.put("newPwd", newPwd);
		
		int result=mapper.storeUpdatePwd(map);
		
		
		return result;
	}
}
