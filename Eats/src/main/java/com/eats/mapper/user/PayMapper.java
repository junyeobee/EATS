package com.eats.mapper.user;

import com.eats.user.model.PayDTO;

public interface PayMapper {

	public PayDTO storeInfo(Integer userIdx, Integer storeIdx);
	
}
