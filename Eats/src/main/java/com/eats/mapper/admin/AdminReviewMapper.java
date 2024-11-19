package com.eats.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eats.admin.model.RevDelDTO;
import com.eats.admin.model.ReviewDeleteDTO;

@Mapper
public interface AdminReviewMapper {
	public List<ReviewDeleteDTO> adminRevDelList();
	public int review_stateChange(ReviewDeleteDTO dto);
	public int revDel_stateChange(ReviewDeleteDTO dto);
}
