package com.eats.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.service.MypageService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MypageController {

    @Autowired
    private MypageService mypageService;

    // 마이페이지 메인 화면
    @GetMapping("/user/mypage/myPage")
    public ModelAndView myPage(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("user_idx");
        if (userId == null) {
            return new ModelAndView("redirect:/user/login");
        }

        EatsUserDTO userProfile = mypageService.getUserProfile(userId);
        if (userProfile == null) {
            ModelAndView errorView = new ModelAndView("error");
            errorView.addObject("message", "사용자 정보를 찾을 수 없습니다.");
            return errorView;
        }

        ModelAndView modelAndView = new ModelAndView("user/mypage/myPage");
        modelAndView.addObject("userProfile", userProfile);
        return modelAndView;
    }

    // 내 정보 보기 화면
    @GetMapping("/user/mypage/myProfile")
    public ModelAndView myProfile(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("user_idx");
        if (userId == null) {
            return new ModelAndView("redirect:/user/login");
        }

        EatsUserDTO userProfile = mypageService.getUserProfile(userId);
        if (userProfile == null) {
            ModelAndView errorView = new ModelAndView("error");
            errorView.addObject("message", "사용자 정보를 찾을 수 없습니다.");
            return errorView;
        }

        ModelAndView modelAndView = new ModelAndView("user/mypage/myProfile");
        modelAndView.addObject("userProfile", userProfile);
        return modelAndView;
    }

    // 내 정보 수정 화면
    @GetMapping("/user/mypage/editProfile")
    public ModelAndView editProfile(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("user_idx");
        if (userId == null) {
            return new ModelAndView("redirect:/user/login");
        }

        EatsUserDTO userProfile = mypageService.getUserProfile(userId);
        if (userProfile == null) {
            ModelAndView errorView = new ModelAndView("error");
            errorView.addObject("message", "사용자 정보를 찾을 수 없습니다.");
            return errorView;
        }

        ModelAndView modelAndView = new ModelAndView("user/mypage/editProfile");
        modelAndView.addObject("userProfile", userProfile);
        return modelAndView;
    }

    // 내 정보 업데이트
    @PostMapping("/user/mypage/updateProfile")
    public ModelAndView updateProfile(EatsUserDTO updatedProfile, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("user_idx");
        if (userId == null || updatedProfile.getUser_idx() != userId) {
            return new ModelAndView("redirect:/user/login");
        }

        boolean isUpdated = mypageService.updateUserProfile(updatedProfile);

        ModelAndView modelAndView = new ModelAndView();
        if (isUpdated) {
            modelAndView.setViewName("redirect:/user/mypage/myProfile");
        } else {
            modelAndView.setViewName("error");
            modelAndView.addObject("message", "정보 업데이트에 실패했습니다.");
        }
        return modelAndView;
    }

    // 나의 찜 보기
    @GetMapping("/user/mypage/myJjim")
    public ModelAndView myJjim(HttpSession session, 
                               @RequestParam(value = "page", defaultValue = "1") int page) {
        Integer userId = (Integer) session.getAttribute("user_idx");
        if (userId == null) {
            return new ModelAndView("redirect:/user/login");
        }

        int itemsPerPage = 5; 
        int totalItems = mypageService.getJjimCount(userId); 
        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

        List<JjimDTO> jjimList = mypageService.getJjimListWithPaging(userId, page, itemsPerPage);

        ModelAndView modelAndView = new ModelAndView("user/mypage/myJjim");
        modelAndView.addObject("jjimList", jjimList);
        modelAndView.addObject("currentPage", page);
        modelAndView.addObject("totalPages", totalPages);
        return modelAndView;
    }

    // 찜 삭제 기능
    @PostMapping("/user/mypage/deleteJjim")
    public String deleteJjim(HttpSession session, @RequestParam("storeId") int storeId) {
        Integer userId = (Integer) session.getAttribute("user_idx");
        if (userId == null) {
            return "redirect:/user/login";
        }

        mypageService.deleteJjim(userId, storeId);
        return "redirect:/user/mypage/myJjim";
    }
}
