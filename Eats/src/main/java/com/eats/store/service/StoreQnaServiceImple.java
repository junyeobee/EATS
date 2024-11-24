package com.eats.store.service;

import com.eats.mapper.store.StoreQnaMapper;
import com.eats.store.model.StoreQnaDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreQnaServiceImple implements StoreQnaService {

    @Autowired
    private StoreQnaMapper storeQnaMapper;

    // 매장 1:1 문의 목록 조회
    @Override
    public List<StoreQnaDTO> searchStoreQnaList(Integer store_idx, String keyword, String status, int offset, int pageSize) {
        return storeQnaMapper.searchStoreQnaList(store_idx, keyword, status, offset, pageSize);
    }

    // 매장 1:1 문의 총 개수 조회
    @Override
    public int getTotalStoreQnaCount(Integer store_idx, String keyword, String status) {
        return storeQnaMapper.getTotalStoreQnaCount(store_idx, keyword, status);
    }

    // 매장 1:1 문의 상세 조회
    @Override
    public StoreQnaDTO getStoreQnaDetail(int sqna_idx) {
        return storeQnaMapper.getStoreQnaDetail(sqna_idx);
    }

    // 매장 1:1 문의 데이터 저장
    @Override
    public boolean saveStoreQna(StoreQnaDTO qna) {
        return storeQnaMapper.insertStoreQna(qna) > 0; // 성공 시 true 반환
    }
}
