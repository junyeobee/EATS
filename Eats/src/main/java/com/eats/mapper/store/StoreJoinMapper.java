package com.eats.mapper.store;

import com.eats.store.model.StoreJoinDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreJoinMapper {
    /**
     * 입점 신청 데이터 삽입
     *
     * @param storeJoinDto 입점 신청 데이터
     * @return 삽입된 행의 수
     */
    int insertStoreJoin(StoreJoinDTO storeJoinDto);

    /**
     * 아이디 중복 확인
     *
     * @param approvalId 승인 아이디
     * @return 아이디 중복 여부 (true: 중복됨, false: 사용 가능)
     */
    boolean existsByApprovalId(String approvalId);
}
