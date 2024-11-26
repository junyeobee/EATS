package com.eats.controller.user;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.web.ServerProperties.Tomcat.Resource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.EatsUserProfileDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.model.PaymentDTO;
import com.eats.user.model.ReviewDTO;
import com.eats.user.model.UserQnaDTO;
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
        long currentTime = System.currentTimeMillis(); // 현재 시간 추가

        mav.addObject("userProfile", userProfile);
        mav.addObject("userProfile1", userProfile1);
        mav.addObject("currentTime", currentTime);
        mav.setViewName("user/mypage/myPage");
        return mav;
    }

    // 나의 정보 보기 화면
    @GetMapping("/user/mypage/myProfile")
    public ModelAndView myProfile(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        Integer user_idx = extractUserIdx(session);
        
        if (user_idx == null) {
            mav.setViewName("redirect:/user/login");
            return mav;
        }

        EatsUserProfileDTO userProfile = mypageService.getUserProfileDetail(user_idx);

//        // 디버깅: 프로필 이미지 확인
//        if (userProfile != null) {
//            System.out.println("Profile Image Path: " + userProfile.getProfile_image());
//        } else {
//            System.out.println("User profile is null.");
//        }

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
    public String updateProfile(@ModelAttribute EatsUserProfileDTO userProfile, HttpSession session) {
        try {
            Integer user_idx = (Integer) session.getAttribute("user_idx");
            if (user_idx == null) {
                return "redirect:/user/login";
            }

            userProfile.setUser_idx(user_idx);
            
            // 전화번호 유효성 검사
            String phoneRegex = "^(01[016789])-([0-9]{3,4})-([0-9]{4})$";
            if (!userProfile.getUser_tel().matches(phoneRegex)) {
                return "redirect:/user/mypage/editProfile?error=invalidPhone";
            }

            // 프로필 업데이트
            boolean isUpdated = mypageService.updateUserProfile(userProfile);
            if (!isUpdated) {
                return "redirect:/user/mypage/editProfile?error=true";
            }

            return "redirect:/user/mypage/myProfile";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/user/mypage/editProfile?error=true";
        }
    }


    @PostMapping("/file/upload")
    @ResponseBody
    public Map<String, Object> uploadFile(@RequestParam("file") MultipartFile file) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 업로드 디렉토리 경로를 동적으로 가져오기
            String uploadDir = System.getProperty("user.dir") + "/src/main/webapp/img/user/profile/";
            String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
            File destFile = new File(uploadDir + fileName);

            // 디렉토리가 존재하지 않으면 생성
            File directory = new File(uploadDir);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // 파일 저장
            file.transferTo(destFile);

            // 반환 경로 설정
            response.put("success", true);
            response.put("filePath", "/img/user/profile/" + fileName); // JSP에서 사용할 경로
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", e.getMessage());
            e.printStackTrace();
        }
        return response;
    }



    @GetMapping("/uploads/{filename}")
    public ResponseEntity<FileSystemResource> getImage(@PathVariable String filename) {
        try {
            // 파일 경로
            String uploadDir = "C:/uploads/";
            File file = new File(uploadDir + filename);

            // 파일 존재 여부 확인
            if (!file.exists()) {
                return ResponseEntity.notFound().build();
            }

            // 파일 리소스를 읽어 반환
            FileSystemResource resource = new FileSystemResource(file);
            String contentType = Files.probeContentType(file.toPath());

            // MIME 타입 설정
            if (contentType == null) {
                contentType = "application/octet-stream";
            }

            return ResponseEntity.ok()
                    .contentType(MediaType.parseMediaType(contentType))
                    .body(resource);

        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
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
    @GetMapping("/user/mypage/myJjim")
    public String myJjim(HttpSession session, Model model,
                         @RequestParam(value = "page", defaultValue = "1") int page) {
        Integer user_idx = convertToInteger(session.getAttribute("user_idx"));

        if (user_idx == null) {
            return "redirect:/user/login";  // 로그인 하지 않은 경우 리다이렉트
        }

        int pageSize = 10;
        int offset = (page - 1) * pageSize;

        int totalItems = mypageService.getTotalJjimCount(user_idx);
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);

        List<JjimDTO> jjimList = mypageService.getJjimList(user_idx, page, pageSize);
        if (jjimList == null || jjimList.isEmpty()) {
            model.addAttribute("jjim", null); // 찜 리스트가 없음을 명시
        } else {
            model.addAttribute("jjimList", jjimList); // 전체 찜 리스트 전달
        }

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "user/mypage/myJjim";  // 반환 타입을 String으로 수정, 뷰 이름 반환
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
        int offset = (page - 1) * pageSize;
        int totalItems = mypageService.getTotalReviewCount(user_idx);
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        List<ReviewDTO> reviewList = mypageService.getReviewList(user_idx, page, pageSize);

        model.addAttribute("reviewList", reviewList);
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

        model.addAttribute("paymentList", paymentList);
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

    // 나의 1:1 문의 화면
    @GetMapping("/user/mypage/myQna")
    public String getMyQnaList(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "status", required = false) String status,
            HttpSession session,
            Model model) {

        // 로그인 확인
        Integer user_idx = extractUserIdx(session);
        if (user_idx == null) {
            return "redirect:/user/login";
        }

        // 페이지네이션 설정
        int pageSize = 10;
        int offset = (page - 1) * pageSize;

        // 검색 조건 처리
        List<UserQnaDTO> qnaList = mypageService.searchUserQnaList(user_idx, keyword, status, offset, pageSize);
        int totalItems = mypageService.getTotalQnaCount(user_idx, keyword, status);
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);

        // JSP에 데이터 전달
        model.addAttribute("qnaList", qnaList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("keyword", keyword);
        model.addAttribute("status", status);
        return "user/mypage/myQna";
    }

    
    // 1:1 문의 글쓰기 화면
    @GetMapping("/user/mypage/writeQna")
    public String writeQnaPage(HttpSession session, Model model) {
        // 로그인 여부 확인
        Integer user_idx = extractUserIdx(session);
        if (user_idx == null) {
            return "redirect:/user/login";
        }

        // 빈 DTO 객체 전달 (JSP에서 폼 데이터 바인딩)
        model.addAttribute("qna", new UserQnaDTO());
        return "user/mypage/writeQna"; // 글쓰기 화면 JSP
    }

    // 1:1 문의 데이터 저장
    @PostMapping("/user/mypage/writeQna")
    public String submitQna(@ModelAttribute("qna") UserQnaDTO qna, HttpSession session) {
        // 로그인 여부 확인
        Integer user_idx = extractUserIdx(session);
        if (user_idx == null) {
            return "redirect:/user/login";
        }

        // 사용자 ID 설정
        qna.setUSER_IDX(user_idx);

        // 데이터 저장
        boolean isSaved = mypageService.saveUserQna(qna);
        if (!isSaved) {
            // 저장 실패 시 에러 처리 (필요시)
            return "redirect:/user/mypage/writeQna?error=true";
        }

        // 저장 성공 후 목록으로 이동
        return "redirect:/user/mypage/myQna";
    }
    
    @GetMapping("/user/mypage/qnaDetail/{uqnaIdx}")
    public ModelAndView qnaDetail(@PathVariable("uqnaIdx") int uqnaIdx, HttpSession session) {
        ModelAndView mav = new ModelAndView();

        // 로그인 여부 확인
        Integer user_idx = extractUserIdx(session);
        if (user_idx == null) {
            mav.setViewName("redirect:/user/login");
            return mav;
        }

        // 문의 상세 정보 가져오기
        UserQnaDTO qnaDetail = mypageService.getQnaDetail(uqnaIdx);

        // 요청한 문의가 로그인한 사용자 소유인지 확인
        if (qnaDetail == null || qnaDetail.getUSER_IDX() != user_idx) {
            mav.setViewName("error");
            mav.addObject("message", "해당 문의에 접근할 수 없습니다.");
            return mav;
        }

        mav.addObject("qnaDetail", qnaDetail);
        mav.setViewName("user/mypage/qnaDetail"); // JSP 경로
        return mav;
    }

}
