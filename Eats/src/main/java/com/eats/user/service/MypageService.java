package com.eats.user.service;

import java.util.List;

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.EatsUserProfileDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.model.PaymentDTO;
import com.eats.user.model.ReviewDTO;
import com.eats.user.model.UserQnaDTO;

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

    // 사용자 정보
    EatsUserProfileDTO getUserProfile1(Integer user_idx);

    // 1:1 문의 검색 목록 가져오기
    List<UserQnaDTO> getUserQnaList(Integer userIdx);

    // 검색 조건에 따른 문의 총 개수
    int getTotalQnaCount(int user_idx, String keyword, String status);

    // 1:1 문의 저장
    boolean saveUserQna(UserQnaDTO userQna);

    UserQnaDTO getQnaDetail(int uqnaIdx);

    List<UserQnaDTO> searchUserQnaList(int user_idx, String keyword, String status, int offset, int pageSize);

	EatsUserProfileDTO getUserProfile1(int user_idx);
}
