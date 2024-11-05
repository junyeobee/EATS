package com.eats.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.StoreMapper;

@Service
public class StoreLoginServiceImple implements StoreLoginService {

	@Autowired
	private StoreMapper mapper;

	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2; // PW 틀렸을 때 쓸 값
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1; // 에러났을 때

	@Override
	public int storeLogin(String storeId, String storePwd) {

		String dbPwd = mapper.storeLogin(storeId);
		
		int result=0;

		if (dbPwd == null || dbPwd == "") {

			result= NOT_ID;
		
		}else if(dbPwd.equals(storePwd)) {
			
			result = LOGIN_OK;
		}else {
			
			result=NOT_PWD;
		}

		return result;
	}
}
