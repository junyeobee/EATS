package com.eats.store.service;

import com.eats.store.model.StoreQnaDTO;

import java.util.List;

public interface StoreQnaService {

    // 매장 1:1 문의 목록 조회
    List<StoreQnaDTO> searchStoreQnaList(Integer store_idx, String keyword, String status, int offset, int pageSize);

    // 매장 1:1 문의 총 개수 조회
    int getTotalStoreQnaCount(Integer store_idx, String keyword, String status);

    // 매장 1:1 문의 상세 조회
    StoreQnaDTO getStoreQnaDetail(int sqna_idx);

    // 매장 1:1 문의 데이터 저장
    boolean saveStoreQna(StoreQnaDTO qna);
}
