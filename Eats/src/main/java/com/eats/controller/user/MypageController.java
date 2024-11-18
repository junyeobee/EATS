package com.eats.controller.user;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.EatsUserProfileDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.model.PaymentDTO;
import com.eats.user.model.ReviewDTO;
import com.eats.user.service.MypageService;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class MypageController {

    @Autowired
    private MypageService mypageService;


    @Value("${profile.image.upload.path:/default/path}")
    private String uploadPath;

    // 마이페이지 메인 화면
    @GetMapping("/user/mypage/myPage")
    public ModelAndView myPage(HttpSession session) {
        ModelAndView mav = new ModelAndView();

        // 세션에서 user_idx 가져오기
        Object userIdxObj = session.getAttribute("user_idx");
        Integer user_idx = convertToInteger(userIdxObj);

        if (user_idx == null) {
            mav.setViewName("redirect:/user/login");
            return mav;
        }

        // 사용자 기본 정보 가져오기
        EatsUserDTO userProfile = mypageService.getUserProfile(user_idx);
        EatsUserProfileDTO userProfile1 = mypageService.getUserProfile1(user_idx);
        if (userProfile == null) {
            mav.setViewName("error");
            mav.addObject("message", "사용자 정보를 찾을 수 없습니다.");
            return mav;
        }

        mav.addObject("userProfile", userProfile);
        mav.addObject("userProfile1", userProfile1);
        mav.setViewName("user/mypage/myPage");
        return mav;
    }

    // 나의 정보 보기 화면
    @GetMapping("/user/mypage/myProfile")
    public ModelAndView myProfile(HttpSession session) {
        ModelAndView mav = new ModelAndView();

        // 세션에서 user_idx 가져오기
        Object userIdxObj = session.getAttribute("user_idx");
        Integer user_idx = convertToInteger(userIdxObj);

        if (user_idx == null) {
            mav.setViewName("redirect:/user/login");
            return mav;
        }

        // 사용자 상세 정보 가져오기
        EatsUserProfileDTO userProfile = mypageService.getUserProfileDetail(user_idx);
        if (userProfile == null) {
            mav.setViewName("error");
            mav.addObject("message", "사용자 정보를 찾을 수 없습니다.");
            return mav;
        }

        mav.addObject("userProfile", userProfile);
        mav.setViewName("user/mypage/myProfile");
        return mav;
    }

    // 나의 정보 수정 화면
    @GetMapping("/user/mypage/editProfile")
    public ModelAndView editProfile(HttpSession session) {
        ModelAndView mav = new ModelAndView();

        // 세션에서 user_idx 가져오기
        Object userIdxObj = session.getAttribute("user_idx");
        Integer user_idx = convertToInteger(userIdxObj);

        if (user_idx == null) {
            mav.setViewName("redirect:/user/login");
            return mav;
        }

        // 수정할 사용자 정보 가져오기
        EatsUserProfileDTO userProfile = mypageService.getEditProfile(user_idx);
        if (userProfile == null) {
            mav.setViewName("error");
            mav.addObject("message", "사용자 정보를 찾을 수 없습니다.");
            return mav;
        }

        mav.addObject("userProfile", userProfile);
        mav.setViewName("user/mypage/editProfile");
        return mav;
    }

    // 나의 정보 업데이트
    @PostMapping("/user/mypage/updateProfile")
    public String updateProfile(EatsUserProfileDTO userProfile, HttpSession session) {
        // 세션에서 user_idx 가져오기
        Object userIdxObj = session.getAttribute("user_idx");
        Integer user_idx = convertToInteger(userIdxObj);

        if (user_idx == null) {
            return "redirect:/user/login";
        }

        // user_idx를 DTO에 설정
        userProfile.setUser_idx(user_idx);

        // 정보 업데이트
        boolean isUpdated = mypageService.updateUserProfile(userProfile);
        if (!isUpdated) {
            return "redirect:/user/mypage/editProfile?error=true";
        }

        return "redirect:/user/mypage/myProfile";
    }

//    // Object를 Integer로 변환
//    private Integer convertToInteger(Object obj) {
//        if (obj instanceof BigDecimal) {
//            return ((BigDecimal) obj).intValue();
//        } else if (obj instanceof Integer) {
//            return (Integer) obj;
//        }
//        return null;
//    }
//    // 찜 목록
    // 찜 목록
    @GetMapping("/user/mypage/myJjim")
    public String myJjim(HttpSession session, Model model,
                         @RequestParam(value = "page", defaultValue = "1") int page) {
        Integer user_idx = convertToInteger(session.getAttribute("user_idx"));

        if (user_idx == null) {
            return "redirect:/user/login";
        }

        int pageSize = 10;
        int offset = (page - 1) * pageSize;

        // 로그 출력으로 값 확인
        System.out.println("user_idx: " + user_idx);
        System.out.println("page: " + page);
        System.out.println("offset: " + offset);

        int totalItems = mypageService.getTotalJjimCount(user_idx);
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);

        List<JjimDTO> jjimList = mypageService.getJjimList(user_idx, page, pageSize);
        if (jjimList == null) {
            jjimList = new ArrayList<>(); // 빈 리스트로 초기화
        }

        model.addAttribute("jjim", jjimList.get(0));
        System.out.println("jjimList" + jjimList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("_csrf", session.getAttribute("_csrf"));
        return "user/mypage/myJjim";
    }

    // 찜 삭제
    @PostMapping("/user/mypage/deleteJjim")
    public String deleteJjim(@RequestParam("storeId") int storeId, HttpSession session) {
        Integer user_idx = convertToInteger(session.getAttribute("user_idx"));

        if (user_idx != null) {
            mypageService.deleteJjim(user_idx, storeId);
        }

        return "redirect:/user/mypage/myJjim";
    }

    // 나의 리뷰
    @GetMapping("/user/mypage/myReviews")
    public String myReviews(HttpSession session, Model model,
                            @RequestParam(value = "page", defaultValue = "1") int page) {
    	Integer user_idx = convertToInteger(session.getAttribute("user_idx"));
    	//        Integer user_idx = extractUserIdx(session);
        if (user_idx == null) {
            return "redirect:/user/login";
        }

        int pageSize = 5; // 한 페이지에 표시할 리뷰 수
        int totalItems = mypageService.getTotalReviewCount(user_idx);
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        List<ReviewDTO> reviewList = mypageService.getReviewList(user_idx, page, pageSize);

        model.addAttribute("review", reviewList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "user/mypage/myReview";
    }

    // 나의 결제 내역
    @GetMapping("/user/mypage/myPayments")
    public String myPayments(HttpSession session, Model model,
                             @RequestParam(value = "page", defaultValue = "1") int page) {
    	Integer user_idx = convertToInteger(session.getAttribute("user_idx"));

        if (user_idx == null) {
            return "redirect:/user/login";
        }

        int pageSize = 10;
        int totalItems = mypageService.getTotalPaymentCount(user_idx);
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        List<PaymentDTO> paymentList = mypageService.getPaymentList(user_idx, page, pageSize);

        model.addAttribute("payment", paymentList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "user/mypage/myPayment";
    }

    // 유틸: 세션에서 user_idx 추출
    private Integer extractUserIdx(HttpSession session) {
        Object userIdxObj = session.getAttribute("user_idx");
        if (userIdxObj instanceof BigDecimal) {
            return ((BigDecimal) userIdxObj).intValue();
        } else if (userIdxObj instanceof Integer) {
            return (Integer) userIdxObj;
        } else if (userIdxObj != null) {
            try {
                return Integer.parseInt(userIdxObj.toString());
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid user_idx format: " + userIdxObj, e);
            }
        }
        return null;
    }
    // BigDecimal을 Integer로 변환하는 메서드
    private Integer convertToInteger(Object obj) {
        if (obj instanceof BigDecimal) {
            return ((BigDecimal) obj).intValue(); // BigDecimal -> Integer 변환
        } else if (obj instanceof Integer) {
            return (Integer) obj;
        } else {
            return null; // 변환 불가능할 경우 null 반환
        }
    }

}
