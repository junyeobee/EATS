package com.eats.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.eats.user.model.*;

@Mapper
public interface MypageMapper {

    // 마이페이지 정보 가져오기 (EatsUserDTO)
    EatsUserDTO getUserProfile(int user_idx);

    // 나의 정보 상세보기 (EatsUserProfileDTO)
    EatsUserProfileDTO getUserProfileDetail(int user_idx);

    // 나의 정보 수정 (EatsUserProfileDTO를 사용)
    int updateUserProfile(EatsUserProfileDTO userProfile);
    
    // 프로필 이미지 수정
    int updateProfileImage(@Param("user_idx") int user_idx, @Param("profile_image") String profile_image);

    // 나의 정보 수정 화면 데이터를 가져오기
    EatsUserProfileDTO getEditProfile(int user_idx);

    // 찜 관련
    List<JjimDTO> getJjimList(@Param("user_idx") int user_idx, @Param("offset") int offset, @Param("pageSize") int pageSize);

    int getTotalJjimCount(int user_idx);

    void deleteJjim(@Param("user_idx") int user_idx, @Param("store_idx") int store_idx);

    // 리뷰 관련
    List<ReviewDTO> getReviewList(@Param("user_idx") int user_idx, @Param("offset") int offset, @Param("pageSize") int pageSize);

    int getTotalReviewCount(int user_idx);

    // 결제 관련
    List<PaymentDTO> getPaymentList(@Param("user_idx") int user_idx, @Param("offset") int offset, @Param("pageSize") int pageSize);

    int getTotalPaymentCount(int user_idx);

    // 사용자 정보
    EatsUserProfileDTO getUserProfile1(Integer user_idx);

    // 사용자 문의 목록 조회 (검색 및 필터링 포함)
    List<UserQnaDTO> selectUserQnaList(
        @Param("userIdx") int userIdx,
        @Param("keyword") String keyword,
        @Param("status") String status,
        @Param("offset") int offset,
        @Param("pageSize") int pageSize
    );

    // 사용자 문의 총 개수 (검색 및 필터링 포함)
    int getTotalQnaCount(
        @Param("userIdx") int userIdx,
        @Param("keyword") String keyword,
        @Param("status") String status
    );

    // 1:1 문의 저장
    int insertUserQna(UserQnaDTO userQna);

    UserQnaDTO selectQnaDetail(int uqnaIdx);
}
