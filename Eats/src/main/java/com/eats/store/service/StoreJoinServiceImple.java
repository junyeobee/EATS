package com.eats.store.service;

import com.eats.mapper.store.StoreJoinMapper;
import com.eats.store.model.StoreJoinDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StoreJoinServiceImple implements StoreJoinService {

    @Autowired
    private StoreJoinMapper storeJoinMapper;

    /**
     * 입점 신청 처리
     *
     * @param storeJoinDto 입점 신청 데이터
     * @return 성공 여부 (1: 성공, 0: 실패)
     */
    @Override
    @Transactional
    public int applyStore(StoreJoinDTO storeJoinDto) {
        try {
            return storeJoinMapper.insertStoreJoin(storeJoinDto); // 성공 시 1 반환
        } catch (Exception e) {
            e.printStackTrace(); // 에러 로그 출력
            return 0; // 실패 시 0 반환
        }
    }

    /**
     * 아이디 중복 확인
     *
     * @param approvalId 승인 아이디
     * @return 중복 여부 (true: 중복됨, false: 사용 가능)
     */
    @Override
    public boolean isDuplicateId(String approvalId) {
        try {
            return storeJoinMapper.existsByApprovalId(approvalId); // 중복 여부 반환
        } catch (Exception e) {
            e.printStackTrace(); // 에러 로그 출력
            return true; // 예외 발생 시 기본적으로 중복된 것으로 간주
        }
    }
}
