package com.eats.admin.service;

import com.eats.admin.model.NoticeDTO;
import com.eats.mapper.admin.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImple implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<NoticeDTO> getNoticeList() {
        return noticeMapper.selectNoticeList();
    }

    @Override
    public NoticeDTO getNoticeDetail(int ntcIdx) {
        return noticeMapper.selectNoticeDetail(ntcIdx);
    }

    @Override
    public void saveNotice(NoticeDTO noticeDTO) {
        if (noticeDTO.getNtc_idx() == 0) { // 신규 등록
            noticeMapper.insertNotice(noticeDTO);
        } else { // 수정
            noticeMapper.updateNotice(noticeDTO);
        }
    }

    @Override
    public void deleteNotice(int ntcIdx) {
        noticeMapper.deleteNotice(ntcIdx);
    }

   @Override
   public List<NoticeDTO> getNoticeListWithPaging(int page, int pageSize) {
       int startRow = (page - 1) * pageSize + 1;
       int endRow = page * pageSize;
       return noticeMapper.selectNoticeListWithPaging(startRow, endRow);
   }

   @Override
   public int getTotalCount() {
      return noticeMapper.selectNoticeTotalCount();
   }
}
