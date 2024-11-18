package com.eats.user.service;

import java.util.List;

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.EatsUserProfileDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.model.PaymentDTO;
import com.eats.user.model.ReviewDTO;

public interface MypageService {
    // 마이페이지 메인 화면 정보 가져오기
    EatsUserDTO getUserProfile(int user_idx);

    // 나의 정보 상세 보기
    EatsUserProfileDTO getUserProfileDetail(int user_idx);

    // 나의 정보 수정 화면 데이터 가져오기
    EatsUserProfileDTO getEditProfile(int user_idx);

    // 나의 정보 업데이트
    boolean updateUserProfile(EatsUserProfileDTO userProfile);
    
    // 찜 목록
    List<JjimDTO> getJjimList(int user_idx, int page, int pageSize);

    // 찜 총 개수
    int getTotalJjimCount(int user_idx);

    // 찜 삭제
    void deleteJjim(int user_idx, int store_idx);

    // 리뷰 목록 가져오기
    List<ReviewDTO> getReviewList(int user_idx, int page, int pageSize);

    // 리뷰 총 개수 가져오기
    int getTotalReviewCount(int user_idx);
    
    // 결제 내역
    List<PaymentDTO> getPaymentList(int user_idx, int page, int pageSize);

    // 결제 총 개수
    int getTotalPaymentCount(int user_idx);

	EatsUserProfileDTO getUserProfile1(Integer user_idx);
}
