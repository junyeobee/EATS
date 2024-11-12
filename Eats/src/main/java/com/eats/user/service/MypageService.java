package com.eats.user.service;

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.JjimDTO;

import java.util.List;

public interface MypageService {
    EatsUserDTO getUserProfile(int userId); // 사용자 정보 가져오기
    boolean updateUserProfile(EatsUserDTO userProfile);
    List<JjimDTO> getJjimList(int userId); // 사용자 찜 목록 가져오기
    void deleteJjim(int userId, int storeId); // 찜 삭제
    List<JjimDTO> getJjimListWithPaging(int userId, int page, int itemsPerPage); // 찜 목록 페이징 처리
    int getJjimCount(int userId); // 총 찜 개수
    void updateProfileImage(int userId, String imagePath); // 프로필 이미지 업데이트

}
