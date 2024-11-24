package com.eats.mapper.admin;

import com.eats.admin.model.AdminUserQnaDTO;
import com.eats.admin.model.AdminStoreQnaDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminQnaMapper {
	// 사용자 문의 리스트 조회
	List<AdminUserQnaDTO> findUserQnaList(@Param("searchKeyword") String searchKeyword,
	                                      @Param("limit") int limit,
	                                      @Param("offset") int offset,
	                                      @Param("sortBy") String sortBy,
	                                      @Param("order") String order);

	// 매장 문의 리스트 조회
	List<AdminStoreQnaDTO> findStoreQnaList(@Param("searchKeyword") String searchKeyword,
	                                        @Param("limit") int limit,
	                                        @Param("offset") int offset,
	                                        @Param("sortBy") String sortBy,
	                                        @Param("order") String order);

    int getUserQnaCount(@Param("searchKeyword") String searchKeyword);
    int getStoreQnaCount(@Param("searchKeyword") String searchKeyword);

    AdminUserQnaDTO findUserQnaById(@Param("uqnaIdx") int uqnaIdx);
    AdminStoreQnaDTO findStoreQnaById(@Param("sqnaIdx") int sqnaIdx);

    void updateUserQnaReply(@Param("uqnaIdx") int uqnaIdx, @Param("answer") String answer);
    void updateStoreQnaReply(@Param("sqnaIdx") int sqnaIdx, @Param("answer") String answer);

}
