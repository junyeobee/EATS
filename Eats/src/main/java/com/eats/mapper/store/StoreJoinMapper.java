package com.eats.mapper.store;

import com.eats.store.model.StoreJoinDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface StoreJoinMapper {
    void insertStoreJoin(StoreJoinDTO storeJoinDto);

    @Select("SELECT COUNT(*) > 0 FROM STORE_JOIN WHERE SJ_ID = #{approvalId}")
    boolean existsByApprovalId(String approvalId); // 아이디 중복 체크 쿼리
}
