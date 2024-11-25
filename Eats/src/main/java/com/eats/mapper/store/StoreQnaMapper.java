package com.eats.mapper.store;

import com.eats.store.model.StoreQnaDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface StoreQnaMapper {

    // 매장 문의 목록 조회
    List<StoreQnaDTO> searchStoreQnaList(@Param("store_idx") Integer store_idx,
                                         @Param("keyword") String keyword,
                                         @Param("status") String status,
                                         @Param("offset") int offset,
                                         @Param("pageSize") int pageSize);

    // 매장 문의 총 개수 조회
    int getTotalStoreQnaCount(@Param("store_idx") Integer store_idx,
                              @Param("keyword") String keyword,
                              @Param("status") String status);

    // 매장 문의 상세 조회
    StoreQnaDTO getStoreQnaDetail(@Param("sqna_idx") int sqna_idx);

    // 매장 문의 등록
    int insertStoreQna(StoreQnaDTO qna);
}
