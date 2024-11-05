package com.eats.user.service;

import java.util.List;

import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;

public interface MainService {

	public List<CateKeyDTO> getCateKey();
	public List<String> getValueList(int cate_key_idx);
}
