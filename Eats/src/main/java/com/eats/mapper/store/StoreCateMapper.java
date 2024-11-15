package com.eats.mapper.store;

import java.util.List;

import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;

public interface StoreCateMapper {
	public List<CateKeyDTO> storeCateOneBigList();
	public List<CateValueDTO> storeCateOneSmallList(int cate_key_idx);

}
