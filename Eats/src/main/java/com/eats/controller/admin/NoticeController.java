package com.eats.controller.admin;

import com.eats.admin.model.NoticeDTO;
import com.eats.admin.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    // 공지사항 목록
    @GetMapping
    public String getNoticeList(@RequestParam(defaultValue = "1") int page, Model model) {
        int pageSize = 7; // 한 페이지당 7개 게시글
        int totalRecords = noticeService.getTotalCount(); // 총 레코드 수
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

        List<NoticeDTO> noticeList = noticeService.getNoticeListWithPaging(page, pageSize);

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("page", page);
        model.addAttribute("totalPages", totalPages);

        return "admin/notice/noticeList";
    }

    // 공지사항 작성
    @GetMapping("/write")
    public String writeNotice(Model model) {
        model.addAttribute("notice", new NoticeDTO()); // NoticeDTO 사용
        return "admin/notice/noticeWrite";
    }

    // 공지사항 저장
    @PostMapping("/save")
    public String saveNotice(NoticeDTO noticeDTO) {
        noticeService.saveNotice(noticeDTO); // NoticeDTO 변수명 사용
        return "redirect:/admin/notice";
    }

    // 공지사항 수정
    @GetMapping("/edit/{ntc_idx}")
    public String editNotice(@PathVariable("ntc_idx") int ntc_idx, Model model) {
        NoticeDTO notice = noticeService.getNoticeDetail(ntc_idx);
        model.addAttribute("notice", notice);
        return "admin/notice/noticeEdit"; // 반환 값이 JSP 파일과 일치해야 함
    }

    // 공지사항 삭제
    @GetMapping("/delete/{ntc_idx}")
    public String deleteNotice(@PathVariable("ntc_idx") int ntc_idx) {
        noticeService.deleteNotice(ntc_idx);
        return "redirect:/admin/notice";
    }

    // 공지사항 상세보기
    @GetMapping("/detail/{ntc_idx}")
    public String getNoticeDetail(@PathVariable("ntc_idx") int ntc_idx, Model model) {
        NoticeDTO notice = noticeService.getNoticeDetail(ntc_idx);
        model.addAttribute("notice", notice);
        return "admin/notice/noticeDetail"; // 반환 값이 JSP 파일과 일치해야 함
    }
}
