package com.eats.admin.service;

import com.eats.admin.model.NoticeDTO;

import java.util.List;


public interface NoticeService {
    List<NoticeDTO> getNoticeList(); 
    List<NoticeDTO> getNoticeListWithPaging(int page, int pageSize); // 페이징 추가
    NoticeDTO getNoticeDetail(int ntc_idx);
    void saveNotice(NoticeDTO noticeDTO);
    void deleteNotice(int ntc_idx);
    int getTotalCount(); // 총 레코드 수 조회 메서드
}