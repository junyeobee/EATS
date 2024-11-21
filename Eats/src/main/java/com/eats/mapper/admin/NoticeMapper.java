package com.eats.mapper.admin;

import com.eats.admin.model.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NoticeMapper {
    List<NoticeDTO> selectNoticeList(); 
    NoticeDTO selectNoticeDetail(int ntc_idx);
    void insertNotice(NoticeDTO noticeDTO); 
    void updateNotice(NoticeDTO noticeDTO); 
    void deleteNotice(int ntc_idx);
    List<NoticeDTO> selectNoticeListWithPaging(@Param("startRow") int startRow, @Param("endRow") int endRow); // 페이징 메서드
   int selectNoticeTotalCount();
}