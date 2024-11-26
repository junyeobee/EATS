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

		if (dbPwd == null||dbPwd.equals("")) {

			result= NOT_ID;
		
		}else if(dbPwd.getStore_pwd().equals(storePwd)) {
			
			 	
			result= LOGIN_OK; 
		}else {
			result = NOT_PWD;
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
	public int storeUpdatePwd(String newPwd,String storeId) {
		
		Map<String, String> map= new HashMap<String, String>();
	
		
		map.put("newPwd", newPwd);
		map.put("storeId", storeId);
		
		
		int result=mapper.storeUpdatePwd(map);
		
		
		return result;
	}
	
	
	
	@Override
	public String storeName(int storeIdx) {
		String result = mapper.storeName(storeIdx);
		return result;
	}
	
	@Override
	public int storeIdx(String storeId) {
int result = mapper.storeIdx(storeId);
		return result;
	}
}
