package com.eats.user.service;

import com.eats.user.model.PayDTO;

public interface PayService {

	public PayDTO storeInfo(Integer userIdx, Integer storeIdx);
	
}

