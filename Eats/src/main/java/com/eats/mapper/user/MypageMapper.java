package com.eats.mapper.user;

import java.util.List;

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.model.ReviewDTO;

public interface MypageMapper {

    // 사용자 정보 관련 메서드
    EatsUserDTO getUserProfile(int userId); // 사용자 프로필 정보 가져오기
    int updateUserProfile(EatsUserDTO userProfile); // 사용자 프로필 정보 업데이트
    void updateProfileImage(int userId, String imagePath); // 프로필 이미지 업데이트

    // 찜 관련 메서드
    List<JjimDTO> getJjimList(int userId); // 전체 찜 목록 가져오기
    List<JjimDTO> getJjimListWithPaging(int userId, int offset, int limit); // 페이징 처리된 찜 목록 가져오기
    int getJjimCount(int userId); // 찜 개수 가져오기
    void deleteJjim(int userId, int storeId); // 찜 삭제

    // 리뷰 관련 메서드
    int getReviewCount(int userId); // 총 리뷰 개수 가져오기
    List<ReviewDTO> getReviewListWithPaging(int userId, int offset, int limit); // 페이징 처리된 리뷰 목록 가져오기
}
