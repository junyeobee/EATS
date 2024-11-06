package com.eats.store.service;

import com.eats.mapper.store.StoreJoinMapper;
import com.eats.store.model.StoreJoinDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StoreJoinServiceImple implements StoreJoinService {

    private final StoreJoinMapper storeJoinMapper;

    @Autowired
    public StoreJoinServiceImple(StoreJoinMapper storeJoinMapper) {
        this.storeJoinMapper = storeJoinMapper;
    }

    @Override
    @Transactional
    public boolean applyStore(StoreJoinDTO storeJoinDto) {
        try {
            storeJoinMapper.insertStoreJoin(storeJoinDto);
            return true; // 성공 시 true 반환
        } catch (Exception e) {
            // 예외가 발생할 경우 false 반환 (예외 로깅을 추가할 수 있습니다)
            return false;
        }
    }

    @Override
    public boolean isDuplicateId(String approvalId) {
        return storeJoinMapper.existsByApprovalId(approvalId);
    }
}
