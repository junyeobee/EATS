package com.eats.admin.service;

import java.util.Map;

import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;

public interface TagService {
	public int addCateValue(CateValueDTO dto);
	public int deleteCateValue(CateValueDTO dto);
	public String getCateKeyName(int cate_key_idx);
	public int deleteCategoryFromValue(int cate_key_idx);
	public int deleteCategory(int cate_key_idx);
	public int updateTag(Map<String, Object> map);
	public int addNewCategory(CateKeyDTO dto);
	public int getCateIdxByName(String cate_key_name);
}
