package com.eats.mapper.user;

import java.util.List;

import com.eats.user.model.AreaDTO;
import com.eats.user.model.CateKeyDTO;
import com.eats.user.model.CateValueDTO;
import com.eats.user.model.ReviewDTO;

public interface MainMapper {

	public List<CateKeyDTO> getCateKey();
	public List<String> getValueList(int cate_key_idx);
	
	public List<AreaDTO> getCityList();
	public List<String> getUnitList(int area_idx);
	
	public List<Integer> getPopularReviews(String areaWord);
	public ReviewDTO getReview(int rev_idx);
	public Double getStorePoint(int store_idx);
	public Integer getLikeCount(int rev_idx);
	public Integer getFollowerCount(int user_idx);
	public String getTag(int tag_idx);
	

}
