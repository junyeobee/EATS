package com.eats.store.service;

import com.eats.store.model.StoreJoinDTO;

public interface StoreJoinService {
    /**
     * 입점 신청 처리
     * 
     * @param storeJoinDto 입점 신청 데이터
     * @return 성공 여부 (1: 성공, 0: 실패)
     */
    int applyStore(StoreJoinDTO storeJoinDto);

    /**
     * 아이디 중복 확인
     * 
     * @param approvalId 승인 아이디
     * @return 중복 여부 (true: 중복됨, false: 사용 가능)
     */
    boolean isDuplicateId(String approvalId);
}
