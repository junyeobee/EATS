package com.eats.controller.user;

import com.eats.user.model.*;
import com.eats.user.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user/mypage") // 기본 경로 설정
public class MypageController {

    @Autowired
    private MypageService mypageService;

    @GetMapping("/myPage")
    public ModelAndView myPage(int userId) {
        EatsUserDTO userProfile = mypageService.getUserProfile(userId);
        ModelAndView modelAndView = new ModelAndView("user/mypage/myPage");
        modelAndView.addObject("userProfile", userProfile);
        return modelAndView;
    }

    @GetMapping("/myProfile")
    public ModelAndView myProfile(int userId) {
        EatsUserDTO userProfile = mypageService.getUserProfile(userId);
        ModelAndView modelAndView = new ModelAndView("user/mypage/myProfile");
        modelAndView.addObject("userProfile", userProfile);
        return modelAndView;
    }
}
