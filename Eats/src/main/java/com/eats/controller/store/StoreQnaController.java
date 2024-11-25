package com.eats.controller.store;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.StoreQnaDTO;
import com.eats.store.service.StoreQnaService;
import jakarta.servlet.http.HttpSession;

@Controller
public class StoreQnaController {

    @Autowired
    private StoreQnaService storeQnaService;

    // 나의 1:1 문의 목록 화면
    @GetMapping("/store/qna")
    public String getMyQnaList(HttpSession session, Model model) {
        Integer storeIdx = extractStoreIdx(session);
        if (storeIdx == null) {
            return "redirect:/store/login";
        }

        int page = 1;
        int pageSize = 10;
        int offset = (page - 1) * pageSize;

        String keyword = "";
        String status = "";

        List<StoreQnaDTO> qnaList = storeQnaService.searchStoreQnaList(storeIdx, keyword, status, offset, pageSize);
        int totalItems = storeQnaService.getTotalStoreQnaCount(storeIdx, keyword, status);
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);

        model.addAttribute("qnaList", qnaList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "store/qna/storeQna";
    }

    // 1:1 문의 글쓰기 화면
    @GetMapping("/store/qna/write")
    public String writeQnaPage(HttpSession session, Model model) {
        Integer storeIdx = extractStoreIdx(session);
        if (storeIdx == null) {
            return "redirect:/store/login";
        }

        model.addAttribute("qna", new StoreQnaDTO());
        return "store/qna/writeQna";
    }

    // 1:1 문의 데이터 저장
    @PostMapping("/store/qna/write")
    public String submitQna(@ModelAttribute("qna") StoreQnaDTO qna, HttpSession session, Model model) {
        Integer storeIdx = extractStoreIdx(session);
        if (storeIdx == null) {
            return "redirect:/store/login";
        }

        qna.setSTORE_IDX(storeIdx); // 매장 ID 설정

        boolean isSaved = storeQnaService.saveStoreQna(qna);
        if (!isSaved) {
            model.addAttribute("error", "문의 등록에 실패했습니다.");
            return "store/qna/writeQna";
        }

        return "redirect:/store/qna";
    }

    // 1:1 문의 상세보기
    @GetMapping("/store/qna/detail/{sqnaIdx}")
    public ModelAndView qnaDetail(@PathVariable("sqnaIdx") int sqnaIdx, HttpSession session) {
        ModelAndView mav = new ModelAndView();

        Integer storeIdx = extractStoreIdx(session);
        if (storeIdx == null) {
            mav.setViewName("redirect:/store/login");
            return mav;
        }

        StoreQnaDTO qnaDetail = storeQnaService.getStoreQnaDetail(sqnaIdx);
        if (qnaDetail == null || !storeIdx.equals(qnaDetail.getSTORE_IDX())) {
            mav.setViewName("error");
            mav.addObject("message", "해당 문의에 접근할 수 없습니다.");
            return mav;
        }

        mav.addObject("qnaDetail", qnaDetail);
        mav.setViewName("store/qna/storeDetailQna");
        return mav;
    }

    // 세션에서 storeIdx 추출
    private Integer extractStoreIdx(HttpSession session) {
        Object storeIdxObj = session.getAttribute("storeIdx");
        if (storeIdxObj == null) {
            return null;
        }
        try {
            return Integer.parseInt(storeIdxObj.toString());
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Invalid storeIdx format", e);
        }
    }
}
