package com.eats.store.service;

import com.eats.store.model.StoreJoinDTO;

public interface StoreJoinService {
    boolean applyStore(StoreJoinDTO storeJoinDto); // 반환 타입을 boolean으로 변경
    
    boolean isDuplicateId(String approvalId); // 아이디 중복 확인 메서드
}
