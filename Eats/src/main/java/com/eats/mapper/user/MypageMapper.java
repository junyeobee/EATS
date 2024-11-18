package com.eats.mapper.user;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.eats.user.model.*;

@Mapper
public interface MypageMapper {

    // 마이페이지 정보 가져오기 (EatsUserDTO)
    EatsUserDTO getUserProfile(int user_idx);

    // 나의 정보 상세보기 (EatsUserProfileDTO)
    EatsUserProfileDTO getUserProfileDetail(int user_idx);

    // 나의 정보 수정
    int updateUserProfile(EatsUserProfileDTO userProfile);

    // 프로필 이미지 수정
    int updateProfileImage(int user_idx, String profile_image);

    // 나의 정보 수정 화면 데이터를 가져오기
    EatsUserProfileDTO getEditProfile(int user_idx);

    // 찜 관련
    List<JjimDTO> getJjimList(int user_idx, int offset, int pageSize);
    int getTotalJjimCount(int user_idx);
    void deleteJjim(int user_idx, int store_idx);

    // 리뷰 관련
    // 리뷰 목록 가져오기
//    List<ReviewDTO> getReviewList(@Param("user_idx") int user_idx,
//                                  @Param("offset") int offset,
//                                  @Param("pageSize") int pageSize);
    List<ReviewDTO> getReviewList(int user_idx, int offset, int pageSize); // 인터페이스
    int getTotalReviewCount(int user_idx);
    // 리뷰 총 개수 가져오기
    //int getTotalReviewCount(@Param("user_idx") int user_idx);
    
    // 결제 관련
    List<PaymentDTO> getPaymentList(int user_idx, int offset, int pageSize);
    int getTotalPaymentCount(int user_idx);

	EatsUserProfileDTO getUserProfile1(Integer user_idx);

//	List<PaymentDTO> getPaymentList(int user_idx, int offset, int pageSize);


}
