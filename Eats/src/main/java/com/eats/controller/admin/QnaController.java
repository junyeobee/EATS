package com.eats.controller.admin;

import com.eats.admin.model.AdminStoreQnaDTO;
import com.eats.admin.model.AdminUserQnaDTO;
import com.eats.admin.service.AdminQnaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/qna")
public class QnaController {

    private final AdminQnaService adminQnaService;

    public QnaController(AdminQnaService adminQnaService) {
        this.adminQnaService = adminQnaService;
    }

    @GetMapping
    public String getQnaList(
            @RequestParam(defaultValue = "user") String type,
            @RequestParam(required = false) String searchKeyword,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "date") String sortBy,
            @RequestParam(defaultValue = "desc") String order,
            Model model) {

        searchKeyword = (searchKeyword == null) ? "" : searchKeyword;

        List<?> qnaList;
        int totalCount;
        if ("store".equals(type)) {
            qnaList = adminQnaService.getStoreQnaList(searchKeyword, page, size, sortBy, order);
            totalCount = adminQnaService.getStoreQnaCount(searchKeyword);
        } else {
            qnaList = adminQnaService.getUserQnaList(searchKeyword, page, size, sortBy, order);
            totalCount = adminQnaService.getUserQnaCount(searchKeyword);
        }

        int totalPages = (int) Math.ceil((double) totalCount / size);

        model.addAttribute("qnaList", qnaList);
        model.addAttribute("type", type);
        model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("order", order);

        return "admin/qna/listQna";
    }

    @GetMapping("/user/{uqnaIdx}")
    public String getUserQnaDetail(@PathVariable int uqnaIdx, Model model) {
        AdminUserQnaDTO userQna = adminQnaService.getUserQnaDetail(uqnaIdx);
        model.addAttribute("userQna", userQna);
        return "admin/qna/detailQna";  // 뷰 이름 수정: detailUserQna → detailQna
    }

    @GetMapping("/store/{sqnaIdx}")
    public String getStoreQnaDetail(@PathVariable int sqnaIdx, Model model) {
        AdminStoreQnaDTO storeQna = adminQnaService.getStoreQnaDetail(sqnaIdx);
        model.addAttribute("storeQna", storeQna);
        return "admin/qna/detailQna";
    }


    @PostMapping("/user/{uqnaIdx}/reply")
    public String replyToUserQna(@PathVariable int uqnaIdx, @RequestParam String answer) {
        adminQnaService.replyToUserQna(uqnaIdx, answer);
        return "redirect:/admin/qna/user/" + uqnaIdx;  // 이 경로가 올바르게 설정되었는지 확인
    }

    @PostMapping("/store/{sqnaIdx}/reply")
    public String replyToStoreQna(@PathVariable int sqnaIdx, @RequestParam String answer) {
        adminQnaService.replyToStoreQna(sqnaIdx, answer);
        return "redirect:/admin/qna/store/" + sqnaIdx;
    }
}
